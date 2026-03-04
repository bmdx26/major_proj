import { getAuthHeaders } from "@/lib/utils";
import axios from "axios";

const API = process.env.NEXT_PUBLIC_BACKEND_DOMAIN;

/* ─────────── TYPES ─────────── */

export type CurrentUser = {
  name: string;
  designation: string;
};

/* ─────────── API FUNCTIONS ─────────── */

/** GET /users/me — fetch logged-in user's profile */
export async function fetchCurrentUser(): Promise<CurrentUser | null> {
  try {
    const res = await axios.get(`${API}/users/me`, {
      headers: { "ngrok-skip-browser-warning": "true", ...getAuthHeaders() },
    });
    return res.data as CurrentUser;
  } catch {
    return null;
  }
}

/** POST /users/update — save user profile (name & designation) */
export async function updateUserProfile(
  name: string,
  designation: string
): Promise<boolean> {
  try {
    const res = await fetch(`${API}/users/update`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json", ...getAuthHeaders() },
      body: JSON.stringify({ name, designation }),
    });
    console.log("updateUserProfile response:", res);
    return res.ok;
  } catch {
    return false;
  }
}
