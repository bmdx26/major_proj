import { getAuthHeaders } from "@/lib/utils";
import axios from "axios";

const API = process.env.NEXT_PUBLIC_BACKEND_DOMAIN;

/* ─────────── TYPES ─────────── */

/** Incoming request shown in workspace Requests panel */
export type IncomingRequest = {
  id: string;
  userId: string;
  userName: string;
  userEmail: string;
  userDesignation: string;
  status: string;
  createdAt: string;
};

/** Outgoing join request shown in dashboard My Requests column */
export type JoinRequest = {
  id: string;
  projectId: string;
  projectTitle: string;
  role: string;
  status: "PENDING" | "ACCEPTED" | "REJECTED";
};

/* ─────────── WORKSPACE: INCOMING REQUESTS ─────────── */

/** GET /projects/:projectId/members/requests */
export async function fetchIncomingRequests(
  projectId: string
): Promise<IncomingRequest[]> {
  try {
    const res = await axios.get(
      `${API}/projects/${projectId}/members/requests`,
      { headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() } }
    );
    const raw = res.data;
    console.log("fetchIncomingRequests raw:", raw);
    const list = Array.isArray(raw) ? raw : raw.data ?? raw.requests ?? [];
    return list.map((r: { id: string; user: { id: string; name: string; email: string; designation: string }; status: string; createdAt: string }) => ({
      id: r.id,
      userId: r.user.id,
      userName: r.user.name,
      userEmail: r.user.email,
      userDesignation: r.user.designation,
      status: r.status.toLowerCase(),
      createdAt: r.createdAt,
    }));
  } catch {
    return [];
  }
}

/** PATCH /projects/:projectId/members/:userId — action: APPROVE | REJECT */
export async function acceptRequest(
  projectId: string,
  userId: string
): Promise<boolean> {
  try {
    await axios.patch(
      `${API}/projects/${projectId}/members/${userId}`,
      { action: "APPROVE" },
      { headers: { ...getAuthHeaders() } }
    );
    return true;
  } catch {
    return false;
  }
}

export async function rejectRequest(
  projectId: string,
  userId: string
): Promise<boolean> {
  try {
    await axios.patch(
      `${API}/projects/${projectId}/members/${userId}`,
      { action: "REJECT" },
      { headers: { ...getAuthHeaders() } }
    );
    return true;
  } catch {
    return false;
  }
}

/* ─────────── DASHBOARD: OUTGOING REQUESTS ─────────── */

/** GET /projects/my-requests */
export async function fetchMyRequests(): Promise<JoinRequest[]> {
  try {
    const res = await axios.get(`${API}/projects/my-requests`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    
    const raw = res.data;
    console.log("fetchMyRequests raw response:", JSON.stringify(raw));
    // Backend returns flat array: [{ id, projectId, projectTitle, role, status }]
    const list = Array.isArray(raw) ? raw : raw.data ?? raw.requests ?? [];
    return list.map((r: { id: string; projectId: string; projectTitle: string; role: string; status: string }) => ({
      id: r.id,
      projectId: r.projectId,
      projectTitle: r.projectTitle,
      role: r.role,
      status: r.status as JoinRequest["status"],
    }));
  } catch {
    return [];
  }
}

/** GET /projects/:projectId/join-code */
export async function fetchJoinCode(
  projectId: string
): Promise<string | null> {
  try {
    const res = await axios.get(`${API}/projects/${projectId}/join-code`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    return res.data?.joinCode ?? null;
  } catch {
    return null;
  }
}

/** POST /projects/join — join using a join code */
export async function sendJoinRequestByCode(
  joinCode: string
): Promise<boolean> {
  try {
    await axios.post(
      `${API}/projects/join`,
      { joinCode },
      { headers: { "Content-Type": "application/json", ...getAuthHeaders() } }
    );
    return true;
  } catch {
    return false;
  }
}

/** DELETE /projects/:projectId/my-request */
export async function cancelJoinRequest(
  projectId: string
): Promise<boolean> {
  try {
    await axios.delete(`${API}/projects/${projectId}/my-request`, {
      headers: { ...getAuthHeaders() },
    });
    return true;
  } catch {
    return false;
  }
}
