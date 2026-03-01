"use client";

import { useEffect, useState } from "react";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card";
import { Loader2, Phone, Mail, MapPin, Building2, ShieldAlert, Flame, HeartPulse } from "lucide-react";

type Service = {
  id: number;
  department: string;
  name: string;
  district: string;
  phone: string;
  email: string;
  category: string;
  ownership: string;
  lat: number;
  lng: number;
};

type ApiResponse = {
  locality: string;
  count: number;
  services: Service[];
};

function getCategoryIcon(category: string) {
  const c = category?.toLowerCase() ?? "";
  if (c.includes("fire")) return <Flame className="h-4 w-4 text-yellow-500" />;
  if (c.includes("police") || c.includes("law")) return <ShieldAlert className="h-4 w-4 text-[#a08c5b]" />;
  if (c.includes("hospital") || c.includes("health") || c.includes("medical") || c.includes("ambulance"))
    return <HeartPulse className="h-4 w-4 text-green-500" />;
  return <Building2 className="h-4 w-4 text-white/50" />;
}

function getCategoryBorder(category: string) {
  const c = category?.toLowerCase() ?? "";
  if (c.includes("fire")) return "border-yellow-700/30";
  if (c.includes("police") || c.includes("law")) return "border-[#7a6040]/40";
  if (c.includes("hospital") || c.includes("health") || c.includes("medical") || c.includes("ambulance"))
    return "border-green-700/30";
  return "border-white/10";
}

function getCategoryBg(category: string): string {
  const c = category?.toLowerCase() ?? "";
  if (c.includes("fire")) return "rgba(120, 90, 0, 0.12)";
  if (c.includes("police") || c.includes("law")) return "rgba(80, 60, 20, 0.15)";
  if (c.includes("hospital") || c.includes("health") || c.includes("medical") || c.includes("ambulance"))
    return "rgba(0, 80, 30, 0.15)";
  return "rgba(255,255,255,0.03)";
}

export function ContactCards() {
  const [services, setServices] = useState<Service[]>([]);
  const [locality, setLocality] = useState("");
  const [loading, setLoading] = useState(true);
  const [wakingUp, setWakingUp] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [attempt, setAttempt] = useState(0);

  useEffect(() => {
    const lat = localStorage.getItem("projectLat");
    const lng = localStorage.getItem("projectLng");

    if (!lat || !lng) {
      setError("Location not available. Please create a project first.");
      setLoading(false);
      return;
    }

    let cancelled = false;
    setLoading(true);
    setError(null);

    const MAX_RETRIES = 5;
    const RETRY_DELAY = 8000; // 8s between retries (Render cold start ~30-50s)

    async function fetchWithRetry(retriesLeft: number) {
      try {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 12000); // 12s per attempt

        const res = await fetch(
          `/api/emergency?lat=${lat}&lng=${lng}`,
          { signal: controller.signal }
        );
        clearTimeout(timeoutId);

        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        const data = (await res.json()) as ApiResponse;

        if (cancelled) return;
        setServices(data.services ?? []);
        setLocality(data.locality ?? "");
        setLoading(false);
        setWakingUp(false);
      } catch (err) {
        if (cancelled) return;
        if (retriesLeft > 0) {
          setWakingUp(true);
          setTimeout(() => {
            if (!cancelled) fetchWithRetry(retriesLeft - 1);
          }, RETRY_DELAY);
        } else {
          setError("Emergency service is unavailable. Please try again.");
          setLoading(false);
          setWakingUp(false);
        }
      }
    }

    fetchWithRetry(MAX_RETRIES);

    return () => { cancelled = true; };
  }, [attempt]);

  if (loading) {
    return (
      <div className="flex flex-col items-center justify-center gap-3 py-16 text-white/50">
        <Loader2 className="h-6 w-6 animate-spin" />
        <p className="text-sm">
          {wakingUp ? "Waking up emergency service… this may take up to 60s" : "Loading nearby emergency services…"}
        </p>
        {wakingUp && (
          <p className="text-xs text-white/30">Render free-tier cold start — please wait</p>
        )}
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex flex-col items-center justify-center gap-3 py-16">
        <p className="text-sm text-red-400">{error}</p>
        <button
          onClick={() => setAttempt((a) => a + 1)}
          className="text-xs px-4 py-2 rounded-lg border border-white/20 text-white/70 hover:bg-white/10 transition"
        >
          Retry
        </button>
      </div>
    );
  }

  if (services.length === 0) {
    return (
      <div className="flex items-center justify-center py-16">
        <p className="text-sm text-white/40">No emergency services found nearby.</p>
      </div>
    );
  }

  return (
    <div className="flex flex-col gap-4">
      {locality && (
        <div className="flex items-center gap-2 text-xs text-white/50">
          <MapPin className="h-3 w-3" />
          <span>
            Showing services near <span className="text-white/80">{locality}</span>
          </span>
        </div>
      )}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {services.map((service) => (
          <Card
            key={service.id}
            className={`border flex flex-col justify-between text-white ${getCategoryBorder(service.category)}`}
            style={{ backgroundColor: getCategoryBg(service.category) }}
          >
            <CardHeader className="pb-2">
              <div className="flex items-center gap-2 mb-1">
                {getCategoryIcon(service.category)}
                <span className="text-[10px] uppercase tracking-wide text-white/40 font-medium">
                  {service.category}
                </span>
              </div>
              <CardTitle className="text-sm leading-snug">{service.name}</CardTitle>
              <CardDescription className="text-white/50 text-xs">
                {service.department}
              </CardDescription>
            </CardHeader>

            <CardContent className="text-xs text-white/70 space-y-1.5 pt-0">
              {service.district && (
                <div className="flex items-center gap-1.5">
                  <MapPin className="h-3 w-3 shrink-0 text-white/40" />
                  <span>{service.district}</span>
                </div>
              )}
              {service.phone && (
                <div className="flex items-center gap-1.5">
                  <Phone className="h-3 w-3 shrink-0 text-white/40" />
                  <a
                    href={`tel:${service.phone}`}
                    className="hover:text-white transition"
                  >
                    {service.phone}
                  </a>
                </div>
              )}
              {service.email && (
                <div className="flex items-center gap-1.5">
                  <Mail className="h-3 w-3 shrink-0 text-white/40" />
                  <a
                    href={`mailto:${service.email}`}
                    className="hover:text-white transition truncate"
                  >
                    {service.email}
                  </a>
                </div>
              )}
              {service.ownership && (
                <div className="flex items-center gap-1.5">
                  <Building2 className="h-3 w-3 shrink-0 text-white/40" />
                  <span className="capitalize">{service.ownership}</span>
                </div>
              )}
              {service.lat && service.lng && (
                <a
                  href={`https://www.google.com/maps/search/${encodeURIComponent(
                    [service.name, service.department, service.district].filter(Boolean).join(", ")
                  )}/@${service.lat},${service.lng},16z`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-1.5 mt-1 transition"
                  title="View on Google Maps"
                >
                  <MapPin className="h-3 w-3 shrink-0 text-blue-400" />
                  <span className="text-blue-400 hover:text-blue-300">View on map</span>
                </a>
              )}
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
