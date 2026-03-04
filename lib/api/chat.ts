import { getAuthHeaders } from "@/lib/utils";
import axios from "axios";

const API = process.env.NEXT_PUBLIC_BACKEND_DOMAIN;

/* ─────────── TYPES ─────────── */

export type ChatSender = {
  id: string;
  name: string;
  designation: string;
  role: "CREATOR" | "COORDINATOR" | "MEMBER" | "SYSTEM" | null;
};

export type ChatReplyTo = {
  id: string;
  content: string;
  sender: { id: string; name: string; designation: string };
};

export type ChatMessage = {
  id: string;
  chatRoomId: string;
  senderId: string;
  content: string;
  createdAt: string;
  sender: ChatSender;
  replyTo: ChatReplyTo | null;
};

export type FetchMessagesResult = {
  messages: ChatMessage[];
  nextCursor: string | null;
};

/* ─────────── API FUNCTIONS ─────────── */

/**
 * GET /projects/:projectId/chat — fetch chat messages (paginated).
 */
export async function fetchChatMessages(
  projectId: string,
  cursor?: string | null,
  limit = 30
): Promise<FetchMessagesResult> {
  try {
    const params: Record<string, string> = { limit: String(limit) };
    if (cursor) params.cursor = cursor;

    const res = await axios.get(`${API}/projects/${projectId}/chat`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
      params,
    });
    return {
      messages: res.data.messages ?? [],
      nextCursor: res.data.nextCursor ?? null,
    };
  } catch {
    return { messages: [], nextCursor: null };
  }
}

/**
 * POST /projects/:projectId/chat — send a chat message.
 * Returns { userMessage, aiMessage } from the server.
 */
export async function sendChatMessage(
  projectId: string,
  content: string,
  replyToId?: string | null
): Promise<{ userMessage: ChatMessage; aiMessage: ChatMessage | null }> {
  const res = await axios.post(
    `${API}/projects/${projectId}/chat`,
    { content, replyToId: replyToId ?? null },
    { headers: { "Content-Type": "application/json", ...getAuthHeaders() } }
  );
  return res.data;
}

/**
 * POST /chat/:projectId — send an AI chat message (old endpoint).
 * Returns the assistant's reply text.
 */
export async function sendAIChatMessage(
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
