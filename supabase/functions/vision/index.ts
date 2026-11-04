// Supabase Edge Function: "vision"
// Optional. Lets the app version read trades from a screenshot with Claude.
// Without it the app reads screenshots on the device instead (less accurate).
// Setup: Edge Functions -> Deploy a new function -> name "vision", paste this file.
// Keep "Enforce JWT verification" ON, so only signed-in Arelo users can call it.
// Then Edge Functions -> Secrets: add ANTHROPIC_API_KEY (your key from console.anthropic.com).
// Optional secret ANTHROPIC_MODEL to pick a model (default below).
const cors = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};
const json = (b: unknown, s = 200) =>
  new Response(JSON.stringify(b), { status: s, headers: { ...cors, "content-type": "application/json" } });

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: cors });
  if (req.method !== "POST") return json({ error: "POST only" }, 405);
  const key = Deno.env.get("ANTHROPIC_API_KEY");
  if (!key) return json({ error: "not configured" }, 501);
  let body: any;
  try { body = await req.json(); } catch { return json({ error: "bad json" }, 400); }
  const image = String(body?.image || "");
  const type = ["image/jpeg", "image/png", "image/webp"].includes(body?.media_type) ? body.media_type : "image/jpeg";
  const prompt = String(body?.prompt || "").slice(0, 4000);
  if (!image || image.length > 7_000_000 || !prompt) return json({ error: "bad input" }, 400);
  const r = await fetch("https://api.anthropic.com/v1/messages", {
    method: "POST",
    headers: { "x-api-key": key, "anthropic-version": "2023-06-01", "content-type": "application/json" },
    body: JSON.stringify({
      model: Deno.env.get("ANTHROPIC_MODEL") || "claude-haiku-5-5",
      max_tokens: 4000,
      messages: [{ role: "user", content: [
        { type: "image", source: { type: "base64", media_type: type, data: image } },
        { type: "text", text: prompt },
      ] }],
    }),
  });
  if (!r.ok) return json({ error: "model failed" }, 502);
  const out = await r.json();
  const text = (out?.content || []).map((c: any) => c?.text || "").join("");
  const m = text.match(/\{[\s\S]*\}/);
  try { const j = JSON.parse(m ? m[0] : text); return json({ trades: Array.isArray(j.trades) ? j.trades.slice(0, 100) : [], notes: String(j.notes || "").slice(0, 300) }); }
  catch { return json({ trades: [], notes: "unreadable" }); }
});
