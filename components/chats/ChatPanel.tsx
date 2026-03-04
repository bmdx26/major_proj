"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import {
  Loader2,
  Reply,
  X,
  Send,
  AtSign,
} from "lucide-react";
import TextareaAutosize from "react-textarea-autosize";
import {
  fetchChatMessages,
  sendChatMessage,
} from "@/lib/api";
import type { ChatMessage } from "@/lib/api";
import { getSocket, disconnectSocket } from "@/lib/socket";

/* ═══════════════════ TYPES ═══════════════════ */

type Props = {
  projectId: string;
};

/* ═══════════════════ HELPERS ═══════════════════ */

function roleBadge(role: string | null) {
  if (!role) return null;
  const map: Record<string, string> = {
    CREATOR: "bg-amber-500/15 text-amber-400 border-amber-500/20",
    COORDINATOR: "bg-blue-500/15 text-blue-400 border-blue-500/20",
    MEMBER: "bg-white/5 text-white/50 border-white/10",
    SYSTEM: "bg-purple-500/15 text-purple-400 border-purple-500/20",
  };
  return (
    <span
      className={`ml-1.5 inline-flex items-center rounded-full border px-1.5 py-0 text-[9px] font-medium uppercase ${map[role] ?? map.MEMBER}`}
    >
      {role === "SYSTEM" ? "AI" : role}
    </span>
  );
}

function formatTime(iso: string) {
  try {
    return new Date(iso).toLocaleTimeString([], {
      hour: "2-digit",
      minute: "2-digit",
    });
  } catch {
    return "";
  }
}

/* ═══════════════════ COMPONENT ═══════════════════ */

export default function ChatPanel({ projectId }: Props) {
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [loading, setLoading] = useState(true);
  const [sending, setSending] = useState(false);
  const [aiTyping, setAiTyping] = useState(false);

  /* reply state */
  const [replyTo, setReplyTo] = useState<ChatMessage | null>(null);

  /* input state */
  const [input, setInput] = useState("");
  const [showMention, setShowMention] = useState(false);
  const inputRef = useRef<HTMLTextAreaElement>(null);

  /* scroll ref */
  const bottomRef = useRef<HTMLDivElement>(null);
  const scrollAreaRef = useRef<HTMLDivElement>(null);

  /* current user id */
  const currentUserId = useRef<string | null>(null);
  useEffect(() => {
    const token = localStorage.getItem("authToken");
    if (token) {
      try {
        const payload = JSON.parse(atob(token.split(".")[1]));
        currentUserId.current = payload.id ?? payload.sub ?? null;
      } catch {
        /* ignore */
      }
    }
  }, []);

  /* ─── LOAD MESSAGES ─── */
  useEffect(() => {
    if (!projectId) return;
    let cancelled = false;
    (async () => {
      setLoading(true);
      const data = await fetchChatMessages(projectId, null, 50);
      if (!cancelled) {
        setMessages(data.messages);
        setLoading(false);
        setTimeout(() => scrollToBottom(), 100);
      }
    })();
    return () => { cancelled = true; };
  }, [projectId]);

  /* ─── SOCKET.IO ─── */
  useEffect(() => {
    if (!projectId) return;
    const socket = getSocket();
    socket.emit("joinProjectRoom", projectId);

    const handleNewMessage = (payload: {
      userMessage: ChatMessage | null;
      aiMessage: ChatMessage | null;
    }) => {
      setAiTyping(false);
      setMessages((prev) => {
        const ids = new Set(prev.map((m) => m.id));
        const next = [...prev];
        if (payload.userMessage && !ids.has(payload.userMessage.id)) {
          next.push(payload.userMessage);
        }
        if (payload.aiMessage && !ids.has(payload.aiMessage.id)) {
          next.push(payload.aiMessage);
        }
        return next;
      });
      setTimeout(() => scrollToBottom(), 100);
    };

    const handleAiTyping = () => setAiTyping(true);

    socket.on("newMessage", handleNewMessage);
    socket.on("aiTyping", handleAiTyping);

    return () => {
      socket.off("newMessage", handleNewMessage);
      socket.off("aiTyping", handleAiTyping);
      disconnectSocket();
    };
  }, [projectId]);

  /* ─── SCROLL HELPERS ─── */
  const scrollToBottom = useCallback(() => {
    bottomRef.current?.scrollIntoView({ behavior: "smooth" });
  }, []);

  useEffect(() => {
    if (!loading && messages.length > 0) scrollToBottom();
  }, [messages.length, loading, scrollToBottom]);

  /* ─── SEND ─── */
  const handleSend = async () => {
    const text = input.trim();
    if (!text || sending) return;

    setSending(true);
    setInput("");

    try {
      const result = await sendChatMessage(projectId, text, replyTo?.id);
      // Add the user message locally (socket will de-dup if it also arrives)
      setMessages((prev) => {
        const ids = new Set(prev.map((m) => m.id));
        const next = [...prev];
        if (result.userMessage && !ids.has(result.userMessage.id)) {
          next.push(result.userMessage);
        }
        // AI messages arrive via socket usually, but also add from REST if present
        if (result.aiMessage && !ids.has(result.aiMessage.id)) {
          next.push(result.aiMessage);
        }
        return next;
      });
      setReplyTo(null);
      setTimeout(() => scrollToBottom(), 100);
    } catch {
      /* error — message stays in input */
      setInput(text);
    } finally {
      setSending(false);
    }
  };

  /* ─── MENTION AUTOCOMPLETE ─── */
  const handleInputChange = (val: string) => {
    setInput(val);
    // Show mention popup when last typed char is '@'
    const caret = inputRef.current?.selectionStart ?? val.length;
    const before = val.slice(0, caret);
    // Show popup if '@' is the last non-whitespace trigger
    if (before.endsWith("@")) {
      setShowMention(true);
    } else if (showMention && !before.includes("@MitigateAI")) {
      // Close if user deleted the @
      const lastAt = before.lastIndexOf("@");
      if (lastAt === -1) setShowMention(false);
    }
  };

  const insertMention = () => {
    const caret = inputRef.current?.selectionStart ?? input.length;
    const before = input.slice(0, caret);
    const lastAt = before.lastIndexOf("@");
    if (lastAt !== -1) {
      const newVal = input.slice(0, lastAt) + "@MitigateAI " + input.slice(caret);
      setInput(newVal);
    } else {
      setInput(input + "@MitigateAI ");
    }
    setShowMention(false);
    inputRef.current?.focus();
  };

  /* ─── IS OWN MESSAGE ─── */
  const isOwn = (msg: ChatMessage) =>
    currentUserId.current !== null && msg.senderId === currentUserId.current;

  /* ═══════════════════ RENDER ═══════════════════ */

  if (loading) {
    return (
      <div className="h-full flex items-center justify-center">
        <Loader2 className="h-6 w-6 animate-spin text-white/40" />
      </div>
    );
  }

  return (
    <div className="h-full flex flex-col">
      {/* ── Messages ── */}
      <div
        ref={scrollAreaRef}
        className="flex-1 overflow-y-auto rounded-xl border border-white/10 bg-[#0b0a0b] p-4 flex flex-col gap-2"
        style={{ minHeight: 0 }}
      >
        {messages.length === 0 && (
          <div className="flex-1 flex items-center justify-center text-sm text-white/25 select-none">
            No messages yet. Start the conversation…
          </div>
        )}

        {messages.map((msg) => {
          const own = isOwn(msg);
          const isAI = msg.sender.role === "SYSTEM";

          return (
            <div
              key={msg.id}
              className={`group flex flex-col gap-0.5 ${
                own ? "items-end" : "items-start"
              }`}
            >
              {/* Sender name + role (only for others) */}
              {!own && (
                <div className="flex items-center gap-1 px-1">
                  <span className="text-[11px] font-medium text-white/60">
                    {isAI ? "MitigateAI" : msg.sender.name}
                  </span>
                  {roleBadge(msg.sender.role)}
                </div>
              )}

              {/* Reply preview */}
              {msg.replyTo && (
                <div
                  className={`max-w-[72%] rounded-lg px-3 py-1.5 text-[11px] border border-white/5 bg-white/[0.03] text-white/40 ${
                    own ? "mr-1" : "ml-1"
                  }`}
                >
                  <span className="font-medium text-white/50">
                    {msg.replyTo.sender.name}
                  </span>
                  <span className="ml-1.5 line-clamp-1">
                    {msg.replyTo.content}
                  </span>
                </div>
              )}

              {/* Bubble + reply button */}
              <div className={`flex items-center gap-1 ${own ? "flex-row-reverse" : "flex-row"}`}>
                <div
                  className={`max-w-[72%] rounded-2xl px-4 py-2.5 text-sm leading-relaxed whitespace-pre-wrap break-words ${
                    own
                      ? "bg-white text-black rounded-br-sm"
                      : isAI
                      ? "bg-purple-500/10 border border-purple-500/20 text-white rounded-bl-sm"
                      : "bg-[#1f1e1f] text-white border border-white/10 rounded-bl-sm"
                  }`}
                >
                  {msg.content}
                </div>

                {/* Reply arrow — visible on hover */}
                <button
                  onClick={() => {
                    setReplyTo(msg);
                    // Auto-fill @MitigateAI when replying to an AI message
                    if (msg.sender.role === "SYSTEM") {
                      setInput("@MitigateAI ");
                    }
                    inputRef.current?.focus();
                  }}
                  className="opacity-0 group-hover:opacity-100 transition p-1 rounded-md text-white/30 hover:text-white/60 hover:bg-white/5"
                  title="Reply"
                >
                  <Reply className="h-3.5 w-3.5" />
                </button>
              </div>

              {/* Timestamp */}
              <span className="text-[10px] text-white/25 px-1">
                {formatTime(msg.createdAt)}
              </span>
            </div>
          );
        })}

        {/* AI typing indicator */}
        {aiTyping && (
          <div className="flex flex-col items-start gap-0.5">
            <div className="flex items-center gap-1 px-1">
              <span className="text-[11px] font-medium text-purple-400">MitigateAI</span>
            </div>
            <div className="bg-purple-500/10 border border-purple-500/20 rounded-2xl rounded-bl-sm px-4 py-3 flex items-center gap-1.5">
              <span className="w-1.5 h-1.5 bg-purple-400/60 rounded-full animate-bounce" style={{ animationDelay: "0ms" }} />
              <span className="w-1.5 h-1.5 bg-purple-400/60 rounded-full animate-bounce" style={{ animationDelay: "150ms" }} />
              <span className="w-1.5 h-1.5 bg-purple-400/60 rounded-full animate-bounce" style={{ animationDelay: "300ms" }} />
            </div>
          </div>
        )}

        <div ref={bottomRef} />
      </div>

      {/* ── Reply preview bar ── */}
      {replyTo && (
        <div className="mt-2 flex items-center gap-2 rounded-lg border border-white/10 bg-[#1a191a] px-3 py-2">
          <Reply className="h-3.5 w-3.5 text-white/40 shrink-0" />
          <div className="flex-1 min-w-0">
            <span className="text-[11px] font-medium text-white/50">
              {replyTo.sender.name}
            </span>
            <p className="text-xs text-white/30 truncate">{replyTo.content}</p>
          </div>
          <button
            onClick={() => setReplyTo(null)}
            className="p-1 rounded-md text-white/30 hover:text-white/60 hover:bg-white/5"
          >
            <X className="h-3.5 w-3.5" />
          </button>
        </div>
      )}

      {/* ── Input area ── */}
      <div className="mt-2 relative">
        {/* Mention autocomplete popup */}
        {showMention && (
          <div className="absolute bottom-full left-0 mb-1 z-10 rounded-lg border border-white/10 bg-[#1f1e1f] shadow-xl overflow-hidden">
            <button
              onClick={insertMention}
              className="flex items-center gap-2 w-full px-4 py-2.5 text-sm text-white hover:bg-white/10 transition"
            >
              <AtSign className="h-4 w-4 text-purple-400" />
              <span className="font-medium">MitigateAI</span>
              <span className="text-[11px] text-white/30 ml-1">Ask AI assistant</span>
            </button>
          </div>
        )}

        <div className="flex items-end gap-2">
          <div className="relative flex-1">
            <TextareaAutosize
              ref={inputRef}
              value={input}
              onChange={(e) => handleInputChange(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === "Enter" && !e.shiftKey) {
                  e.preventDefault();
                  handleSend();
                }
                if (e.key === "Escape" && showMention) {
                  setShowMention(false);
                }
              }}
              disabled={sending}
              maxRows={5}
              className="w-full min-h-[48px] resize-none rounded-lg bg-[#1f1e1f] border border-white/10 px-4 pr-12 py-3 text-sm text-white placeholder:text-white/30 outline-none focus:border-white/20 transition disabled:opacity-50"
              placeholder={sending ? "Sending…" : "Type a message… (@ to mention AI)"}
            />
            <button
              onClick={handleSend}
              disabled={!input.trim() || sending}
              className="absolute right-2 bottom-2 p-2 rounded-lg bg-white text-black hover:bg-neutral-200 transition disabled:opacity-30 disabled:cursor-not-allowed"
              title="Send"
            >
              {sending ? (
                <Loader2 className="h-4 w-4 animate-spin" />
              ) : (
                <Send className="h-4 w-4" />
              )}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
