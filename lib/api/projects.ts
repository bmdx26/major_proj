import { getAuthHeaders } from "@/lib/utils";
import axios from "axios";

const API = process.env.NEXT_PUBLIC_BACKENED_DOMAIN;

/* ─────────── TYPES ─────────── */

export type Project = {
  id: string;
  title: string;
  createdAt: string;
};

export type JoinedProject = {
  id: string;
  title: string;
  role: string;
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

/** GET /projects/my */
export async function fetchMyProjects(): Promise<Project[]> {
  try {
    const res = await fetch(`${API}/projects/projects/my`, {
        method: "GET",
      headers: { ...getAuthHeaders() },
    });
    if (!res.ok) return [];
    console.log("fetchMyProjects response:", res);
    return await res.json();
  } catch {
    return [];
  }
}

/** GET /projects/joined */
export async function fetchJoinedProjects(): Promise<JoinedProject[]> {
  try {
    const res = await fetch(`${API}/projects/joined`, {
      method: "GET",
      headers: { ...getAuthHeaders() },
    });
    if (!res.ok) return [];
    console.log("fetchJoinedProjects response:", res);
    return await res.json();
  } catch {
    return [];
  }
}

/** GET /projects/search?q=<query> */
export async function searchProjects(
  query: string
): Promise<SearchResult[]> {
  if (!query.trim()) return [];
  try {
    const res = await fetch(
      `${API}/projects/search?q=${encodeURIComponent(query)}`,
      { headers: { ...getAuthHeaders() } }
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
      headers: { ...getAuthHeaders() },
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
      headers: { ...getAuthHeaders() },
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
      headers: { ...getAuthHeaders() },
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
