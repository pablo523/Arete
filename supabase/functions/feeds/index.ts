// Supabase Edge Function: "feeds"
// Fetches public market news (RSS) and the ForexFactory calendar on the
// server, so the app can read them without browser CORS limits.
// Only the sources listed below can be requested.

const SOURCES: Record<string, string> = {
  ffcal: "https://nfs.faireconomy.media/ff_calendar_thisweek.json",
  ffnext: "https://nfs.faireconomy.media/ff_calendar_nextweek.json",
  fxstreet: "https://www.fxstreet.com/rss/news",
  forexlive: "https://www.forexlive.com/feed/news",
  investing: "https://www.investing.com/rss/news_1.rss",
};
const TTL: Record<string, number> = { ffcal: 15 * 60, ffnext: 60 * 60 };
const cache = new Map<string, { t: number; body: string; type: string }>();
const cors = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "apikey, authorization, content-type, x-client-info",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
};

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: cors });
  const src = new URL(req.url).searchParams.get("src") || "";
  const url = SOURCES[src];
  if (!url) return new Response("unknown source", { status: 400, headers: cors });
  const ttl = (TTL[src] ?? 4 * 60) * 1000;
  const hit = cache.get(src);
  if (hit && Date.now() - hit.t < ttl) {
    return new Response(hit.body, { headers: { ...cors, "content-type": hit.type, "cache-control": "public, max-age=120" } });
  }
  try {
    const r = await fetch(url, { headers: { "user-agent": "Mozilla/5.0 (compatible; AreloFeeds/1.0)", accept: "*/*" } });
    if (!r.ok) throw new Error(String(r.status));
    const body = await r.text();
    const type = src.startsWith("ff") ? "application/json" : "application/xml";
    cache.set(src, { t: Date.now(), body, type });
    return new Response(body, { headers: { ...cors, "content-type": type, "cache-control": "public, max-age=120" } });
  } catch (_e) {
    if (hit) return new Response(hit.body, { headers: { ...cors, "content-type": hit.type } });
    return new Response("upstream error", { status: 502, headers: cors });
  }
});
