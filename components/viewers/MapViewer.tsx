"use client";

import {
  MapContainer,
  TileLayer,
  Marker,
  Popup,
  useMap,
} from "react-leaflet";
import L from "leaflet";
import { getAuthHeaders } from "@/lib/utils";
import { useEffect, useMemo, useState } from "react";
import "leaflet/dist/leaflet.css";
import { Loader2, Phone, Mail, MapPin, Building2, ShieldAlert, Flame, HeartPulse } from "lucide-react";

/* ---------- TYPES ---------- */

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

/* ---------- CATEGORY HELPERS ---------- */

function getCategoryColor(category: string): string {
  const c = category?.toLowerCase() ?? "";
  if (c.includes("fire")) return "#eab308";
  if (c.includes("police") || c.includes("law")) return "#a08c5b";
  if (c.includes("hospital") || c.includes("health") || c.includes("medical") || c.includes("ambulance"))
    return "#22c55e";
  return "#94a3b8";
}

function getCategoryIcon(category: string) {
  const c = category?.toLowerCase() ?? "";
  if (c.includes("fire")) return <Flame className="h-3.5 w-3.5 text-yellow-400" />;
  if (c.includes("police") || c.includes("law")) return <ShieldAlert className="h-3.5 w-3.5 text-[#a08c5b]" />;
  if (c.includes("hospital") || c.includes("health") || c.includes("medical") || c.includes("ambulance"))
    return <HeartPulse className="h-3.5 w-3.5 text-green-400" />;
  return <Building2 className="h-3.5 w-3.5 text-white/50" />;
}

function getCategoryBg(category: string): string {
  const c = category?.toLowerCase() ?? "";
  if (c.includes("fire")) return "rgba(120,90,0,0.18)";
  if (c.includes("police") || c.includes("law")) return "rgba(80,60,20,0.2)";
  if (c.includes("hospital") || c.includes("health") || c.includes("medical") || c.includes("ambulance"))
    return "rgba(0,80,30,0.18)";
  return "rgba(255,255,255,0.04)";
}

function makeDivIcon(color: string, active: boolean) {
  const size = active ? 16 : 12;
  const anchor = size / 2;
  return new L.DivIcon({
    className: "",
    html: `<div style="
      width:${size}px;
      height:${size}px;
      background:${color};
      border-radius:50%;
      border:2.5px solid white;
      box-shadow:0 0 0 2px ${color},0 2px 6px rgba(0,0,0,0.55);
      transition:all 0.2s;
    "></div>`,
    iconSize: [size, size],
    iconAnchor: [anchor, anchor],
  });
}

/* ---------- FLY TO ---------- */

function FlyToLocation({ position }: { position: [number, number] }) {
  const map = useMap();
  useEffect(() => {
    map.flyTo(position, 14, { duration: 1.2 });
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [position[0], position[1]]);
  return null;
}

/* ---------- MAIN COMPONENT ---------- */

export default function MapViewer() {
  const disasterIcon = useMemo(() => new L.DivIcon({
    className: "",
    html: `
      <div style="position:relative;width:28px;height:28px;">
        <div style="
          position:absolute;inset:0;
          background:rgba(239,68,68,0.25);
          border-radius:50%;
          animation:pulse-ring 1.6s ease-out infinite;
        "></div>
        <div style="
          position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);
          width:14px;height:14px;
          background:#ef4444;
          border-radius:50%;
          border:2.5px solid white;
          box-shadow:0 0 0 2px rgba(239,68,68,0.6),0 2px 6px rgba(0,0,0,0.5);
        "></div>
      </div>
      <style>
        @keyframes pulse-ring{
          0%{transform:scale(0.6);opacity:0.8}
          100%{transform:scale(2.2);opacity:0}
        }
      </style>
    `,
    iconSize: [28, 28],
    iconAnchor: [14, 14],
  }), []);

  const [services, setServices] = useState<Service[]>([]);
  const [locality, setLocality] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selected, setSelected] = useState<Service | null>(null);
  const [flyTo, setFlyTo] = useState<[number, number] | null>(null);
  const [center, setCenter] = useState<[number, number]>([20.5937, 78.9629]);
  const [disasterPos, setDisasterPos] = useState<{ lat: number; lng: number } | null>(null);

  useEffect(() => {
    const lat = localStorage.getItem("projectLat");
    const lng = localStorage.getItem("projectLng");

    if (!lat || !lng) {
      setError("Location not available. Please create a project first.");
      setLoading(false);
      return;
    }

    setCenter([parseFloat(lat), parseFloat(lng)]);
    setDisasterPos({ lat: parseFloat(lat), lng: parseFloat(lng) });

    fetch(`/api/emergency?lat=${lat}&lng=${lng}`, { headers: { ...getAuthHeaders() } })
      .then((r) => { if (!r.ok) throw new Error(); return r.json(); })
      .then((data) => {
        setLocality(data.locality ?? "");
        setServices(Array.isArray(data.services) ? data.services : []);
        setLoading(false);
      })
      .catch(() => {
        setError("Failed to load service locations.");
        setLoading(false);
      });
  }, []);

  const handleSelect = (svc: Service) => {
    setSelected(svc);
    setFlyTo([svc.lat, svc.lng]);
  };

  const generateLink = (svc: Service) =>
    `https://www.google.com/maps/search/${encodeURIComponent(
      [svc.name, svc.department, svc.district].filter(Boolean).join(", ")
    )}/@${svc.lat},${svc.lng},16z`;

  if (loading) {
    return (
      <div className="w-full h-full flex flex-col items-center justify-center gap-3 text-white/50">
        <Loader2 className="h-6 w-6 animate-spin" />
        <p className="text-sm">Loading service locations...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="w-full h-full flex items-center justify-center text-white/40 text-sm px-6 text-center">
        {error}
      </div>
    );
  }

  return (
    <div style={{ width: "100%", height: "100%", display: "flex", overflow: "hidden" }}>
      {/* MAP */}
      <div style={{ flex: 1, height: "100%", overflow: "hidden" }}>
        <MapContainer
          center={center}
          zoom={11}
          style={{ width: "100%", height: "100%" }}
        >
          <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
          {flyTo && <FlyToLocation position={flyTo} />}

          {/* Disaster area marker */}
          {disasterPos && (
            <Marker
              position={[disasterPos.lat, disasterPos.lng]}
              icon={disasterIcon}
              zIndexOffset={1000}
            >
              <Popup>
                <div style={{ minWidth: 140 }}>
                  <div style={{ fontWeight: 700, fontSize: 13, marginBottom: 4, color: "#ef4444" }}>Disaster Area</div>
                  <div style={{ fontSize: 11 }}>{disasterPos.lat.toFixed(5)}, {disasterPos.lng.toFixed(5)}</div>
                  {locality && <div style={{ fontSize: 11, marginTop: 3, color: "#555" }}>{locality}</div>}
                </div>
              </Popup>
            </Marker>
          )}

          {services.map((svc) => (
            <Marker
              key={svc.id}
              position={[svc.lat, svc.lng]}
              icon={makeDivIcon(getCategoryColor(svc.category), selected?.id === svc.id)}
              eventHandlers={{ click: () => handleSelect(svc) }}
            >
              {selected?.id === svc.id && (
                <Popup>
                  <div style={{ minWidth: 160 }}>
                    <div style={{ fontWeight: 700, fontSize: 13, marginBottom: 2 }}>{svc.name}</div>
                    <div style={{ fontSize: 11, color: "#666", marginBottom: 4 }}>{svc.department}</div>
                    <div style={{ fontSize: 11 }}>{svc.district}</div>
                    {svc.phone && <div style={{ fontSize: 11 }}>Tel: {svc.phone}</div>}
                    {svc.email && <div style={{ fontSize: 11 }}>{svc.email}</div>}
                    <a
                      href={generateLink(svc)}
                      target="_blank"
                      rel="noopener noreferrer"
                      style={{ display: "inline-flex", alignItems: "center", gap: 3, marginTop: 6, fontSize: 11, color: "#3b82f6", textDecoration: "none" }}
                    >
                      View on map
                    </a>
                  </div>
                </Popup>
              )}
            </Marker>
          ))}
        </MapContainer>
      </div>

      {/* SIDEBAR */}
      <div style={{
        width: 300, display: "flex", flexDirection: "column",
        borderLeft: "1px solid rgba(255,255,255,0.08)",
        background: "#0b0a0b", flexShrink: 0,
        height: "100%", overflow: "hidden",
      }}>
        {/* Disaster area section */}
        {disasterPos && (
          <div style={{
            padding: "12px 16px",
            borderBottom: "1px solid rgba(239,68,68,0.2)",
            background: "rgba(239,68,68,0.07)",
          }}>
            <div style={{ display: "flex", alignItems: "center", gap: 6, marginBottom: 4 }}>
              <div style={{ width: 9, height: 9, borderRadius: "50%", background: "#ef4444", boxShadow: "0 0 0 2px rgba(239,68,68,0.35)", flexShrink: 0 }} />
              <span style={{ fontSize: 11, fontWeight: 600, color: "#f87171" }}>Disaster Area</span>
            </div>
            {locality && (
              <div style={{ fontSize: 10, color: "rgba(255,255,255,0.5)", marginBottom: 3, lineHeight: 1.4 }}>
                {locality}
              </div>
            )}
            <div style={{ fontSize: 10, color: "rgba(255,255,255,0.3)", fontVariantNumeric: "tabular-nums" }}>
              {disasterPos.lat.toFixed(5)},&nbsp;{disasterPos.lng.toFixed(5)}
            </div>
          </div>
        )}
        {/* Header */}
        <div style={{ padding: "14px 16px 10px", borderBottom: "1px solid rgba(255,255,255,0.07)" }}>
          <div style={{ fontSize: 13, fontWeight: 600, color: "white" }}>Service Locations</div>
          {locality && (
            <div style={{ fontSize: 11, color: "rgba(255,255,255,0.4)", marginTop: 3 }}>
              {locality}
            </div>
          )}
          {/* Legend */}
          <div style={{ display: "flex", gap: 10, marginTop: 8, flexWrap: "wrap" }}>
            {[
              { label: "Fire", color: "#eab308" },
              { label: "Police", color: "#a08c5b" },
              { label: "Hospital", color: "#22c55e" },
            ].map(({ label, color }) => (
              <div key={label} style={{ display: "flex", alignItems: "center", gap: 4, fontSize: 10, color: "rgba(255,255,255,0.45)" }}>
                <div style={{ width: 8, height: 8, borderRadius: "50%", background: color }} />
                {label}
              </div>
            ))}
          </div>
        </div>

        {/* List */}
        <div style={{ flex: 1, minHeight: 0, overflowY: "auto", padding: "10px 12px" }}>
          {services.length === 0 ? (
            <p style={{ color: "rgba(255,255,255,0.3)", fontSize: 12, textAlign: "center", paddingTop: 24 }}>
              No services found nearby
            </p>
          ) : (
            services.map((svc) => {
              const isActive = selected?.id === svc.id;
              return (
                <div
                  key={svc.id}
                  onClick={() => handleSelect(svc)}
                  style={{
                    padding: "10px 12px", marginBottom: 6, borderRadius: 10, cursor: "pointer",
                    background: isActive ? "rgba(255,255,255,0.12)" : getCategoryBg(svc.category),
                    border: `1px solid ${isActive ? "rgba(255,255,255,0.25)" : "rgba(255,255,255,0.05)"}`,
                    transition: "all 0.15s",
                  }}
                >
                  {/* Name + icon */}
                  <div style={{ display: "flex", alignItems: "center", gap: 6, marginBottom: 3 }}>
                    {getCategoryIcon(svc.category)}
                    <span style={{ fontSize: 12, fontWeight: 600, color: "white", lineHeight: 1.3 }}>
                      {svc.name}
                    </span>
                  </div>

                  {/* Department */}
                  <div style={{ fontSize: 10, color: "rgba(255,255,255,0.45)", marginBottom: 2 }}>
                    {svc.department}
                  </div>

                  {/* District */}
                  <div style={{ display: "flex", alignItems: "center", gap: 4, fontSize: 10, color: "rgba(255,255,255,0.38)", marginBottom: 4 }}>
                    <MapPin size={9} />
                    {svc.district}
                  </div>

                  {/* Phone */}
                  {svc.phone && (
                    <div style={{ display: "flex", alignItems: "center", gap: 4, fontSize: 10, color: "rgba(255,255,255,0.38)", marginBottom: 2 }}>
                      <Phone size={9} />
                      <a href={`tel:${svc.phone}`} onClick={(e) => e.stopPropagation()} style={{ color: "inherit", textDecoration: "none" }}>
                        {svc.phone}
                      </a>
                    </div>
                  )}

                  {/* Email */}
                  {svc.email && (
                    <div style={{ display: "flex", alignItems: "center", gap: 4, fontSize: 10, color: "rgba(255,255,255,0.38)", marginBottom: 6 }}>
                      <Mail size={9} />
                      <a href={`mailto:${svc.email}`} onClick={(e) => e.stopPropagation()} style={{ color: "inherit", textDecoration: "none" }}>
                        {svc.email}
                      </a>
                    </div>
                  )}

                  {/* Coords + map link */}
                  <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginTop: 4 }}>
                    <span style={{ fontSize: 9, color: "rgba(255,255,255,0.22)" }}>
                      {svc.lat.toFixed(4)}, {svc.lng.toFixed(4)}
                    </span>
                    <a
                      href={generateLink(svc)}
                      target="_blank"
                      rel="noopener noreferrer"
                      onClick={(e) => e.stopPropagation()}
                      style={{ display: "flex", alignItems: "center", gap: 3, fontSize: 9, color: "#60a5fa", textDecoration: "none" }}
                    >
                      <MapPin size={9} />
                      View on map
                    </a>
                  </div>
                </div>
              );
            })
          )}
        </div>
      </div>
    </div>
  );
}
