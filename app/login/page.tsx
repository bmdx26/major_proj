"use client";

import { useState, useEffect, FormEvent } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { ArrowLeft, Loader2, CheckCircle2 } from "lucide-react";
import { updateUserProfile } from "@/lib/api";

/* ─── Google "G" logo as inline SVG ─── */
function GoogleIcon({ className }: { className?: string }) {
  return (
    <svg className={className} viewBox="0 0 48 48">
      <path
        fill="#EA4335"
        d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"
      />
      <path
        fill="#4285F4"
        d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"
      />
      <path
        fill="#FBBC05"
        d="M10.53 28.59a14.5 14.5 0 0 1 0-9.18l-7.98-6.19a24.0 24.0 0 0 0 0 21.56l7.98-6.19z"
      />
      <path
        fill="#34A853"
        d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"
      />
    </svg>
  );
}

/* ─── Steps ─── */
type Step = "google" | "signing-in" | "profile";

export default function LoginPage() {
  const router = useRouter();

  const [step, setStep] = useState<Step>("google");
  const [name, setName] = useState("");
  const [designation, setDesignation] = useState("");
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState("");

  const BACKEND_URL = process.env.NEXT_PUBLIC_BACKEND_DOMAIN;

  /* ── Google OAuth: redirect to backend ── */
  function handleGoogleSignIn() {
    setStep("signing-in");
    window.location.href = `${BACKEND_URL}/auth/google?origin=${window.location.origin}`;
  }

  /* ── Handle OAuth callback token on mount ── */
  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const token = params.get("token");
    if (token) {
      localStorage.setItem("authToken", token);
      // Clean the URL
      window.history.replaceState({}, "", "/login");
      setStep("profile");
    }
  }, []);

  /* ── Save profile info ── */
  async function handleProfileSubmit(e: FormEvent) {
    e.preventDefault();
    setError("");

    if (!name.trim() || !designation.trim()) {
      setError("Please fill in all fields.");
      return;
    }

    setSubmitting(true);
    const ok = await updateUserProfile(name.trim(), designation.trim());
    if (ok) {
      localStorage.setItem("userName", name.trim());
      localStorage.setItem("userDesignation", designation.trim());
      router.push("/dashboard");
    } else {
      setError("Failed to save profile. Please try again.");
    }
    setSubmitting(false);
  }

  return (
    <div className="relative flex min-h-screen flex-col items-center justify-center bg-[#0a0a0a] text-white overflow-hidden">
      {/* Grid bg */}
      <div
        className="pointer-events-none absolute inset-0 opacity-[0.03]"
        style={{
          backgroundImage:
            "linear-gradient(white 1px, transparent 1px), linear-gradient(90deg, white 1px, transparent 1px)",
          backgroundSize: "64px 64px",
        }}
      />

      {/* Back button */}
      <div className="absolute top-4 left-4 z-20">
        <Link href="/">
          <Button
            variant="ghost"
            size="sm"
            className="text-white/60 hover:text-white hover:bg-white/5 cursor-pointer"
          >
            <ArrowLeft className="mr-1 size-4" />
            Back
          </Button>
        </Link>
      </div>

      {/* ─────────── Step: Google Sign-In ─────────── */}
      {step === "google" && (
        <div className="relative z-10 flex w-full max-w-sm flex-col items-center gap-6 rounded-2xl border border-white/5 bg-white/[0.02] p-8">
          <div className="flex flex-col gap-1 text-center">
            <h1 className="text-2xl font-bold tracking-tight">Welcome</h1>
            <p className="text-sm text-white/40">
              Sign in with your Google account to continue
            </p>
          </div>

          <Button
            onClick={handleGoogleSignIn}
            className="mt-2 flex w-full items-center justify-center gap-3 rounded-lg border border-white/10 bg-white text-black hover:bg-white/90 cursor-pointer"
            size="lg"
          >
            <GoogleIcon className="size-5" />
            Continue with Google
          </Button>
        </div>
      )}

      {/* ─────────── Step: Signing in (loading) ─────────── */}
      {step === "signing-in" && (
        <div className="relative z-10 flex w-full max-w-sm flex-col items-center gap-6 rounded-2xl border border-white/5 bg-white/[0.02] p-8">
          <Loader2 className="size-8 animate-spin text-white/60" />
          <p className="text-sm text-white/40">
            Authenticating with Google…
          </p>
        </div>
      )}

      {/* ─────────── Step: Profile Details ─────────── */}
      {step === "profile" && (
        <form
          onSubmit={handleProfileSubmit}
          className="relative z-10 flex w-full max-w-sm flex-col gap-6 rounded-2xl border border-white/5 bg-white/[0.02] p-8"
        >
          {/* Success badge */}
          <div className="flex flex-col items-center gap-2 text-center">
            <CheckCircle2 className="size-6 text-green-400" />
            <h1 className="text-2xl font-bold tracking-tight">
              Almost there
            </h1>
            <p className="text-sm text-white/40">
              Tell us a bit about yourself
            </p>
          </div>

          {/* Name */}
          <div className="flex flex-col gap-2">
            <label
              htmlFor="name"
              className="text-xs font-medium text-white/60"
            >
              Full Name
            </label>
            <Input
              id="name"
              type="text"
              placeholder="John Doe"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="bg-[#191918] border-white/10 text-white placeholder:text-white/30 focus-visible:ring-1 focus-visible:ring-white/20"
            />
          </div>

          {/* Designation */}
          <div className="flex flex-col gap-2">
            <label
              htmlFor="designation"
              className="text-xs font-medium text-white/60"
            >
              Designation
            </label>
            <Input
              id="designation"
              type="text"
              placeholder="e.g. Field Officer, Analyst"
              value={designation}
              onChange={(e) => setDesignation(e.target.value)}
              className="bg-[#191918] border-white/10 text-white placeholder:text-white/30 focus-visible:ring-1 focus-visible:ring-white/20"
            />
          </div>

          {/* Error */}
          {error && (
            <p className="text-xs text-red-400 text-center">{error}</p>
          )}

          {/* Submit */}
          <Button
            type="submit"
            disabled={submitting}
            className="mt-2 bg-white text-black hover:bg-white/90 disabled:opacity-50 cursor-pointer"
          >
            {submitting ? (
              <>
                <Loader2 className="mr-2 size-4 animate-spin" />
                Saving…
              </>
            ) : (
              "Continue to Dashboard"
            )}
          </Button>
        </form>
      )}

      {/* Bottom accent */}
      <div className="absolute bottom-0 left-0 right-0 h-px bg-gradient-to-r from-transparent via-white/10 to-transparent" />
    </div>
  );
}
