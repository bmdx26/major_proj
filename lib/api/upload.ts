import { getAuthHeaders } from "@/lib/utils";

const API = process.env.NEXT_PUBLIC_BACKENED_DOMAIN;

/* ─────────── API FUNCTIONS ─────────── */

/** POST /projects/:projectId/upload — upload project files */
export async function uploadProjectFiles(
  projectId: string,
  formData: FormData
): Promise<boolean> {
  try {
    const res = await fetch(`${API}/projects/${projectId}/upload`, {
      method: "POST",
      headers: { ...getAuthHeaders() },
      body: formData,
    });
    return res.ok;
  } catch {
    return false;
  }
}

/** POST /projects/:projectId/analyze — run analysis pipeline */
export async function runAnalyzePipeline(
  projectId: string
): Promise<boolean> {
  try {
    const res = await fetch(`${API}/projects/${projectId}/analyze`, {
      method: "POST",
      headers: { ...getAuthHeaders() },
    });
    return res.ok;
  } catch {
    return false;
  }
}

/** POST /projects/:projectId/event-summary — run event-summary pipeline */
export async function runEventSummaryPipeline(
  projectId: string
): Promise<boolean> {
  try {
    const res = await fetch(`${API}/projects/${projectId}/event-summary`, {
      method: "POST",
      headers: { ...getAuthHeaders() },
    });
    return res.ok;
  } catch {
    return false;
  }
}

/** POST /api/projects/:projectId/odm/upload — upload images for ODM reconstruction */
export async function uploadODMImages(
  projectId: string,
  formData: FormData
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): Promise<{ odm: { version: number } } | null> {
  try {
    const res = await fetch(
      `${API}/api/projects/${projectId}/odm/upload`,
      {
        method: "POST",
        headers: { ...getAuthHeaders() },
        body: formData,
      }
    );
    if (!res.ok) return null;
    return await res.json();
  } catch {
    return null;
  }
}

/** POST /odm/projects/:projectId/reconstructions/:version/run */
export async function startReconstruction(
  projectId: string,
  version: number
): Promise<boolean> {
  try {
    const res = await fetch(
      `${API}/odm/projects/${projectId}/reconstructions/${version}/run`,
      { method: "POST", headers: { ...getAuthHeaders() } }
    );
    return res.ok;
  } catch {
    return false;
  }
}
