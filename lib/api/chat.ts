import { getAuthHeaders } from "@/lib/utils";

const API = process.env.NEXT_PUBLIC_BACKENED_DOMAIN;

/* ─────────── API FUNCTIONS ─────────── */

/**
 * POST /chat/:projectId — send a chat message.
 * Returns the assistant's reply text.
 */
export async function sendChatMessage(
  projectId: string,
  message: string
): Promise<string> {
  const res = await fetch(`${API}/chat/${projectId}`, {
    method: "POST",
    headers: { "Content-Type": "application/json", ...getAuthHeaders() },
    body: JSON.stringify({ message }),
  });
  const json = await res.json();
  let replyText: string =
    json.text || json.reply || json.response || "No response";

  // If backend returned JSON-wrapped report, try to extract readable text
  if (typeof replyText === "string" && replyText.startsWith("{")) {
    try {
      const inner = JSON.parse(replyText);
      replyText = inner.fullText || inner.text || inner.summary || replyText;
    } catch {
      /* not JSON, use as-is */
    }
  }

  return replyText;
}
