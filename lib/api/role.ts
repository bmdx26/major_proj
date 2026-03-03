import { getAuthHeaders } from "@/lib/utils";
import axios from "axios";

const API = process.env.NEXT_PUBLIC_BACKEND_DOMAIN;

/* ─────────── TYPES ─────────── */

export type MyPermissions = {
  canApproveMembers: boolean;
  canPromoteMembers: boolean;
  canRunReconstruction: boolean;
  canGenerateReport: boolean;
  canDeleteProject: boolean;
};

export type MyRoleInfo = {
  role: string;
  status: string;
  isCreator: boolean;
  permissions: MyPermissions;
};

/* ─────────── API FUNCTIONS ─────────── */

/** GET /projects/:projectId/me — fetch current user's role & permissions */
export async function fetchMyRoleInfo(
  projectId: string
): Promise<MyRoleInfo | null> {
  try {
    const res = await axios.get(`${API}/projects/${projectId}/me`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    console.log("fetchMyRoleInfo raw:", res.data);
    return res.data;
  } catch {
    return null;
  }
}

