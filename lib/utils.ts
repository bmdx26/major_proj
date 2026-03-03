import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

/**
 * Returns standard auth headers for API calls.
 * Reads the JWT from localStorage and attaches it as a Bearer token.
 * Safe to call server-side (returns empty object when window is unavailable).
 */
export function getAuthHeaders(): Record<string, string> {
  if (typeof window === "undefined") return {};
  const token = localStorage.getItem("authToken");
  if (!token) return {};
  return { Authorization: `Bearer ${token}` };
}
