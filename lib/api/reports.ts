import { getAuthHeaders } from "@/lib/utils";

const API = process.env.NEXT_PUBLIC_BACKENED_DOMAIN;

/* ─────────── TYPES ─────────── */

export type ReportVersion = {
  id: string;
  projectId: string;
  version: number;
  content: string;
};

/* ─────────── API FUNCTIONS ─────────── */

/** GET /reports/:projectId — fetch all report versions */
export async function fetchReportVersions(
  projectId: string
): Promise<ReportVersion[]> {
  try {
    const res = await fetch(`${API}/reports/${projectId}`, {
      headers: {
        "ngrok-skip-browser-warning": "true",
        ...getAuthHeaders(),
      },
    });
    if (!res.ok) return [];
    const json: { success: boolean; count: number; data: ReportVersion[] } =
      await res.json();
    return json.data ?? [];
  } catch {
    return [];
  }
}

/** POST /reports/projects/:projectId/report — generate a new report (streaming) */
export async function generateReportStream(
  projectId: string
): Promise<Response> {
  return fetch(
    `${API}/reports/projects/${projectId}/report`,
    { method: "POST", headers: { ...getAuthHeaders() } }
  );
}
