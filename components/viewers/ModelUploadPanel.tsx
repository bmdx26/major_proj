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
  projectId: string;
  setGlobalLoading: (v: boolean) => void;
  onUploadComplete: () => void;
  disabled?: boolean;
};

export default function ModelUploadPanel({
  files,
  dragging,
  setDragging,
  onFiles,
  onRemove,
  projectId,
  setGlobalLoading,
  onUploadComplete,
  disabled = false,
}: Props) {
  function handleDrop(e: DragEvent<HTMLLabelElement>) {
    e.preventDefault();
    setDragging(false);
    onFiles(Array.from(e.dataTransfer.files));
  }

  async function handleUpload(e: React.MouseEvent) {
    e.stopPropagation();
    if (files.length === 0) return;

    setGlobalLoading(true);

    try {
      const formData = new FormData();
      files.forEach((f) => formData.append("images", f.file));

      // 1️⃣ Upload images
      const uploadRes = await fetch(
        `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/api/projects/${projectId}/odm/upload`,
        {
          method: "POST",
          body: formData,
        }
      );

      if (!uploadRes.ok) throw new Error("Upload failed");

      const data = await uploadRes.json();
      const version = data.odm.version;


      // 2️⃣ Start reconstruction
      await fetch(
        `${process.env.NEXT_PUBLIC_BACKENED_DOMAIN}/odm/projects/${projectId}/reconstructions/${version}/run`,
        { method: "POST" }
      );

      onUploadComplete();
    } catch (err) {
      console.error("3D upload failed:", err);
    } finally {
      setGlobalLoading(false);
    }
  }

  return (
    <label
      onDragOver={(e) => {
        if (disabled) return;
        e.preventDefault();
        setDragging(true);
      }}
      onDragLeave={() => setDragging(false)}
      onDrop={disabled ? undefined : handleDrop}
      htmlFor={disabled ? undefined : "photoUpload"}
      className={`h-full border-2 border-dashed rounded-lg p-4 flex flex-col ${
        disabled ? "cursor-not-allowed opacity-50" : "cursor-pointer"
      } ${
        dragging ? "border-white bg-white/5" : "border-white/20"
      }`}
    >
      <input
        type="file"
        accept="image/*"
        multiple
        hidden
        id="photoUpload"
        disabled={disabled}
        onChange={(e) =>
          onFiles(e.target.files ? Array.from(e.target.files) : [])
        }
      />

      <div className="flex flex-col items-center gap-2 text-center pointer-events-none">
        <ImageIcon className="h-6 w-6 text-white/70" />
        <p className="text-sm text-white">
          Upload images for 3D reconstruction
        </p>
        <p className="text-xs text-white/50">
          Drag & drop images or click anywhere
        </p>
      </div>

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

      <Button
        type="button"
        className="mt-4 bg-white text-black"
        disabled={disabled || files.length === 0}
        onClick={handleUpload}
      >
        <Upload className="h-4 w-4 mr-2" />
        Upload & Generate 3D
      </Button>
    </label>
  );
}