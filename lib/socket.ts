"use client";

import { io, Socket } from "socket.io-client";

let socket: Socket | null = null;

/**
 * Get or create a singleton Socket.IO connection.
 * Authenticates using the JWT from localStorage.
 */
export function getSocket(): Socket {
  if (socket && socket.connected) return socket;

  const API = process.env.NEXT_PUBLIC_BACKEND_DOMAIN ?? "";
  const token = typeof window !== "undefined" ? localStorage.getItem("authToken") : null;

  socket = io(API, {
    auth: { token: token ?? "" },
    transports: ["websocket", "polling"],
    reconnection: true,
    reconnectionAttempts: 10,
    reconnectionDelay: 1000,
  });

  socket.on("connect", () => {
    console.log("[Socket] connected:", socket?.id);
  });

  socket.on("disconnect", (reason) => {
    console.log("[Socket] disconnected:", reason);
  });

  socket.on("connect_error", (err) => {
    console.error("[Socket] connection error:", err.message);
  });

  return socket;
}

/**
 * Disconnect and clean up the socket instance.
 */
export function disconnectSocket() {
  if (socket) {
    socket.disconnect();
    socket = null;
  }
}
