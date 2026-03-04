import { getAuthHeaders } from "@/lib/utils";
import axios from "axios";

const API = process.env.NEXT_PUBLIC_BACKEND_DOMAIN;

/* ─────────── TYPES ─────────── */

export type Project = {
  id: string;
  title: string;
  createdAt: string;
  latitude?: number;
  longitude?: number;
};

export type JoinedProject = {
  id: string;
  title: string;
  role: string;
  latitude?: number;
  longitude?: number;
};

/** Raw item returned by GET /projects/my */
type ProjectItem = {
  id: string;
  title: string;
  createdAt: string;
  role: string;
  latitude?: number;
  longitude?: number;
};

export type SearchResult = {
  id: string;
  title: string;
};

export type CreateProjectPayload = {
  title: string;
  location: string;
  latitude: number;
  longitude: number;
  disasterType: string;
};

/* ─────────── API FUNCTIONS ─────────── */

/** Shared helper — GET /projects/my (returns all projects with role) */
async function fetchAllProjects(): Promise<ProjectItem[]> {
  try {
    const res = await axios.get(`${API}/projects/my`, {
        
      headers: { 
        "ngrok-skip-browser-warning": "true",
        ...getAuthHeaders() },
    });
    const raw = res.data;
    console.log("fetchAllProjects raw:", JSON.stringify(raw, null, 2));

    // Normalise: backend may return an array directly, or wrap it
    if (Array.isArray(raw)) return raw;
    if (Array.isArray(raw.projects)) return raw.projects;
    if (Array.isArray(raw.data)) return raw.data;
    console.warn("fetchAllProjects: unexpected shape", raw);
    return [];
  } catch {
    return [];
  }
}

/** Projects where the current user is the creator */
export async function fetchMyProjects(): Promise<Project[]> {
  const all = await fetchAllProjects();
  return all
    .filter((p) => p.role.toUpperCase() === "CREATOR")
    .map(({ id, title, createdAt, latitude, longitude }) => ({ id, title, createdAt, latitude, longitude }));
}

/** Projects where the current user is a coordinator or member */
export async function fetchJoinedProjects(): Promise<JoinedProject[]> {
  const all = await fetchAllProjects();
  return all
    .filter((p) => {
      const r = p.role.toUpperCase();
      return r === "COORDINATOR" || r === "MEMBER";
    })
    .map(({ id, title, role, latitude, longitude }) => ({ id, title, role, latitude, longitude }));
}

/** GET /projects/search?q=<query> */
export async function searchProjects(
  query: string
): Promise<SearchResult[]> {
  if (!query.trim()) return [];
  try {
    const res = await fetch(
      `${API}/projects/search?q=${encodeURIComponent(query)}`,
      { headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() } }
    );
    if (!res.ok) return [];
    console.log("searchProjects response:", res);
    return await res.json();
  } catch {
    return [];
  }
}

/** POST /projects/ — create a new project */
export async function createProject(
  payload: CreateProjectPayload
): Promise<{ id: string } | null> {
  try {
    const response = await axios.post(`${API}/projects/`, payload, {
      headers: {
        "Content-Type": "application/json",
        ...getAuthHeaders(),
      },
    });
    return response.data;
  } catch {
    return null;
  }
}

/** GET /projects/:projectId — fetch full project details */
export async function fetchProjectDetails(
  projectId: string
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): Promise<any | null> {
  // PLACEHOLDER: Expected response: { id, title, location, disasterType, status, createdAt, ... }
  try {
    const res = await fetch(`${API}/projects/${projectId}`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    if (!res.ok) return null;
    return await res.json();
  } catch {
    return null;
  }
}

/** GET /projects/:projectId/event-summary */
export async function fetchEventSummary(
  projectId: string
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): Promise<any | null> {
  // PLACEHOLDER: Expected response: { summary, timeline, affectedArea, ... }
  try {
    const res = await fetch(`${API}/projects/${projectId}/event-summary`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    if (!res.ok) return null;
    return await res.json();
  } catch {
    return null;
  }
}

/** GET /projects/:projectId/media */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export async function fetchProjectMedia(projectId: string): Promise<any[]> {
  // PLACEHOLDER: Expected response: [{ id, filename, type, url, uploadedAt }, ...]
  try {
    const res = await fetch(`${API}/projects/${projectId}/media`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    if (!res.ok) return [];
    return await res.json();
  } catch {
    return [];
  }
}

/** PATCH /projects/:projectId/status */
export async function updateProjectStatus(
  projectId: string,
  status: string
): Promise<boolean> {
  // PLACEHOLDER: Body: { status }
  try {
    const res = await fetch(`${API}/projects/${projectId}/status`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json", ...getAuthHeaders() },
      body: JSON.stringify({ status }),
    });
    return res.ok;
  } catch {
    return false;
  }
}

/** DELETE /projects/:projectId */
export async function deleteProject(projectId: string): Promise<boolean> {
  try {
    const res = await fetch(`${API}/projects/${projectId}`, {
      method: "DELETE",
      headers: { ...getAuthHeaders() },
    });
    return res.ok;
  } catch {
    return false;
  }
}
