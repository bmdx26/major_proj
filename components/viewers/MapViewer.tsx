"use client";

import {
  MapContainer,
  TileLayer,
  Marker,
  Popup,
  useMap,
} from "react-leaflet";
import L from "leaflet";
import { useState } from "react";
import "leaflet/dist/leaflet.css";

const redIcon = new L.DivIcon({
  className: "",
  html: `
    <div style="
      width:10px;
      height:10px;
      background:#ef4444;
      border-radius:50%;
      border:2px solid white;
      box-shadow:0 0 0 2px rgba(0,0,0,0.3);
    "></div>
  `,
  iconSize: [10, 10],
  iconAnchor: [5, 5],
});

type Location = {
  id: number;
  title: string;
  lat: number;
  lng: number;
};

const locations: Location[] = [
  { id: 1, title: "Kochi", lat: 9.9312, lng: 76.2673 },
  { id: 2, title: "Bangalore", lat: 12.9716, lng: 77.5946 },
  { id: 3, title: "Mumbai", lat: 19.076, lng: 72.8777 },
  { id: 4, title: "Delhi", lat: 28.6139, lng: 77.209 },
  { id: 5, title: "Hyderabad", lat: 17.385, lng: 78.4867 },
  { id: 6, title: "Chennai", lat: 13.0827, lng: 80.2707 },
  { id: 7, title: "Kolkata", lat: 22.5726, lng: 88.3639 },
  
];

function FlyToLocation({ position }: { position: [number, number] }) {
  const map = useMap();
  map.flyTo(position, 8, { duration: 1.2 });
  return null;
}

export default function MapViewer() {
  const [selected, setSelected] = useState<Location | null>(null);
  const [flyTo, setFlyTo] = useState<[number, number] | null>(null);
  const [copiedId, setCopiedId] = useState<number | null>(null);

  const generateLink = (lat: number, lng: number) =>
    `https://www.google.com/maps?q=${lat},${lng}`;

  const handleCopy = async (id: number, link: string) => {
    await navigator.clipboard.writeText(link);
    setCopiedId(id);
    setTimeout(() => setCopiedId(null), 2000);
  };

  return (
    <div
      style={{
        width: "100%",
        height: "100%",
        display: "flex",
        overflow: "hidden",
        maxHeight: "100%",
      }}
    >
      <div style={{ flex: 1, overflow: "hidden" }}>
        <MapContainer
          center={[22.5937, 78.9629]}
          zoom={5}
          style={{ width: "100%", height: "100%" }}
        >
          <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
          {flyTo && <FlyToLocation position={flyTo} />}

          {locations.map((loc) => (
            <Marker
              key={loc.id}
              position={[loc.lat, loc.lng]}
              icon={redIcon}
              eventHandlers={{
                click: () => {
                  setSelected(loc);
                  setFlyTo([loc.lat, loc.lng]);
                },
              }}
            >
              {selected?.id === loc.id && (
                <Popup>
                  <div>
                    <div style={{ fontWeight: 600 }}>{loc.title}</div>
                    <div style={{ fontSize: 12 }}>
                      {loc.lat.toFixed(4)}, {loc.lng.toFixed(4)}
                    </div>
                  </div>
                </Popup>
              )}
            </Marker>
          ))}
        </MapContainer>
      </div>

      <div
        style={{
          width: 280,
          display: "flex",
          flexDirection: "column",
          borderLeft: "1px solid rgba(255,255,255,0.1)",
          background: "#0b0a0b",
          flexShrink: 0,
          maxHeight: "100%",
        }}
      >
        <div style={{ padding: 16 }}>
          <div style={{ fontSize: 14, fontWeight: 600, color: "white" }}>
            Locations
          </div>
        </div>

        <div
          style={{
            flex: 1,
            overflowY: "auto",
            padding: 16,
          }}
        >
          {locations.map((loc) => (
            <div
              key={loc.id}
              onClick={() => {
                setSelected(loc);
                setFlyTo([loc.lat, loc.lng]);
              }}
              style={{
                padding: 10,
                marginBottom: 8,
                borderRadius: 8,
                cursor: "pointer",
                background:
                  selected?.id === loc.id ? "white" : "#161516",
                color: selected?.id === loc.id ? "black" : "white",
                fontSize: 13,
              }}
            >
              <div style={{ fontWeight: 600 }}>{loc.title}</div>

              <div style={{ fontSize: 11, opacity: 0.7 }}>
                {loc.lat.toFixed(4)}, {loc.lng.toFixed(4)}
              </div>

              <button
  onClick={(e) => {
    e.stopPropagation();
    handleCopy(loc.id, generateLink(loc.lat, loc.lng));
  }}
  style={{
    marginTop: 6,
    fontSize: 11,
    padding: "4px 6px",
    borderRadius: 6,
    border: "none",
    cursor: "pointer",
    background: copiedId === loc.id
      ? "#16a34a"
      : selected?.id === loc.id
        ? "#000"
        : "rgba(255,255,255,0.1)",
    color:
      copiedId === loc.id
        ? "white"
        : selected?.id === loc.id
          ? "white"
          : "white",
  }}
>
  {copiedId === loc.id ? "✓ Copied" : "Copy Link"}
</button>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}