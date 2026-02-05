"use client";

import { DragEvent } from "react";
import { Button } from "@/components/ui/button";
import { Loader2, X, ImageIcon, Upload } from "lucide-react";

export type UploadItem = {
  id: string;
  file: File;
  processing: boolean;
};

type Props = {
  files: UploadItem[];
  dragging: boolean;
  setDragging: (v: boolean) => void;
  onFiles: (files: File[]) => void;
  onRemove: (id: string) => void;
};

export default function ModelUploadPanel({
  files,
  dragging,
  setDragging,
  onFiles,
  onRemove,
}: Props) {
  function handleDrop(e: DragEvent<HTMLDivElement>) {
    e.preventDefault();
    setDragging(false);
    onFiles(Array.from(e.dataTransfer.files));
  }

  return (
    <label
      onDragOver={(e) => {
        e.preventDefault();
        setDragging(true);
      }}
      onDragLeave={() => setDragging(false)}
      onDrop={handleDrop}
      htmlFor="photoUpload"
      className={`h-full border-2 border-dashed rounded-lg p-4 flex flex-col cursor-pointer ${
        dragging ? "border-white bg-white/5" : "border-white/20"
      }`}
    >
      {/* FILE INPUT */}
      <input
        type="file"
        accept="image/*"
        multiple
        hidden
        id="photoUpload"
        onChange={(e) =>
          onFiles(e.target.files ? Array.from(e.target.files) : [])
        }
      />

      {/* TOP UPLOAD PROMPT */}
      <div className="flex flex-col items-center gap-2 text-center pointer-events-none">
        <ImageIcon className="h-6 w-6 text-white/70" />
        <p className="text-sm text-white">
          Upload images for 3D reconstruction
        </p>
        <p className="text-xs text-white/50">
          Drag & drop images or click anywhere
        </p>
      </div>

      {/* FILE LIST */}
      <div className="flex-1 mt-4 overflow-auto space-y-2 pointer-events-auto">
        {files.map((item) => (
          <div
            key={item.id}
            className="flex items-center justify-between gap-3 rounded-md border border-white/10 bg-[#191918] px-3 py-2 text-xs"
          >
            <div className="flex items-center gap-2 min-w-0">
              {item.processing ? (
                <Loader2 className="h-3 w-3 animate-spin text-white/70" />
              ) : (
                <ImageIcon className="h-3 w-3 text-white/70" />
              )}
              <span className="truncate text-white/80">
                {item.file.name}
              </span>
            </div>

            <button
              type="button"
              onClick={(e) => {
                e.stopPropagation();
                onRemove(item.id);
              }}
              className="text-white/50 hover:text-white"
            >
              <X className="h-3 w-3" />
            </button>
          </div>
        ))}

        {files.length === 0 && (
          <p className="text-xs text-white/40 text-center mt-6">
            No images selected
          </p>
        )}
      </div>

      {/* FINAL ACTION BUTTON */}
      <Button
        type="button"
        className="mt-4 bg-white text-black"
        disabled={files.length === 0}
        onClick={(e) => {
          e.stopPropagation();
          console.log("Uploading images:", files);
        }}
      >
        <Upload className="h-4 w-4 mr-2" />
        Upload & Generate 3D
      </Button>
    </label>
  );
}
