import { getAuthHeaders } from "@/lib/utils";

const API = process.env.NEXT_PUBLIC_BACKEND_DOMAIN;

/* ─────────── TYPES ─────────── */

export type Reconstruction = {
  version: number;
  outputS3Prefix: string;
};

/* ─────────── API FUNCTIONS ─────────── */

/** GET /odm/projects/:projectId/reconstructions */
export async function fetchReconstructions(
  projectId: string
): Promise<Reconstruction[]> {
  try {
    const res = await fetch(
      `${API}/odm/projects/${projectId}/reconstructions`,
      {
        headers: {
          "ngrok-skip-browser-warning": "true",
          ...getAuthHeaders(),
        },
      }
    );
    if (!res.ok) return [];
    return await res.json();
  } catch {
    return [];
  }
}
