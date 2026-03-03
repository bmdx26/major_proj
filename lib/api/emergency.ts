import { getAuthHeaders } from "@/lib/utils";

/* ─────────── API FUNCTIONS ─────────── */

/**
 * GET /api/emergency?lat=...&lng=... (Next.js API route)
 * Returns emergency services near the given coordinates.
 */
export async function fetchEmergencyServices(
  lat: string,
  lng: string,
  signal?: AbortSignal
): Promise<Response> {
  return fetch(`/api/emergency?lat=${lat}&lng=${lng}`, {
    signal,
    headers: { ...getAuthHeaders() },
  });
}
