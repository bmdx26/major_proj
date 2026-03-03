import { getAuthHeaders } from "@/lib/utils";

const API = process.env.NEXT_PUBLIC_BACKENED_DOMAIN;

/* ─────────── TYPES ─────────── */

/** Incoming request shown in workspace Requests panel */
export type IncomingRequest = {
  id: string;
  userId: string;
  userName: string;
  userDesignation: string;
  status: "pending" | "accepted" | "rejected";
  createdAt: string;
};

/** Outgoing join request shown in dashboard My Requests column */
export type JoinRequest = {
  id: string;
  projectId: string;
  projectTitle: string;
  status: "pending" | "accepted" | "rejected";
  createdAt: string;
};

/* ─────────── WORKSPACE: INCOMING REQUESTS ─────────── */

/** GET /projects/:projectId/requests/incoming */
export async function fetchIncomingRequests(
  projectId: string
): Promise<IncomingRequest[]> {
  try {
    const res = await fetch(
      `${API}/projects/${projectId}/requests/incoming`,
      { headers: { ...getAuthHeaders() } }
    );
    if (!res.ok) return [];
    return await res.json();
  } catch {
    return [];
  }
}

/** POST /projects/:projectId/requests/:requestId/accept */
export async function acceptRequest(
  projectId: string,
  requestId: string
): Promise<boolean> {
  try {
    const res = await fetch(
      `${API}/projects/${projectId}/requests/${requestId}/accept`,
      { method: "POST", headers: { ...getAuthHeaders() } }
    );
    return res.ok;
  } catch {
    return false;
  }
}

/** POST /projects/:projectId/requests/:requestId/reject */
export async function rejectRequest(
  projectId: string,
  requestId: string
): Promise<boolean> {
  try {
    const res = await fetch(
      `${API}/projects/${projectId}/requests/${requestId}/reject`,
      { method: "POST", headers: { ...getAuthHeaders() } }
    );
    return res.ok;
  } catch {
    return false;
  }
}

/* ─────────── DASHBOARD: OUTGOING REQUESTS ─────────── */

/** GET /projects/requests */
export async function fetchMyRequests(): Promise<JoinRequest[]> {
  try {
    const res = await fetch(`${API}/projects/requests`, {
      headers: { ...getAuthHeaders() },
    });
    if (!res.ok) return [];
    return await res.json();
  } catch {
    return [];
  }
}

/** POST /projects/:projectId/join */
export async function sendJoinRequest(
  projectId: string
): Promise<boolean> {
  try {
    const res = await fetch(`${API}/projects/${projectId}/join`, {
      method: "POST",
      headers: { ...getAuthHeaders() },
    });
    return res.ok;
  } catch {
    return false;
  }
}

/** DELETE /projects/requests/:requestId */
export async function cancelJoinRequest(
  requestId: string
): Promise<boolean> {
  try {
    const res = await fetch(`${API}/projects/requests/${requestId}`, {
      method: "DELETE",
      headers: { ...getAuthHeaders() },
    });
    return res.ok;
  } catch {
    return false;
  }
}
