"use client";

import { useEffect, useRef } from "react";
import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js";
import { OBJLoader } from "three/examples/jsm/loaders/OBJLoader.js";
import { MTLLoader } from "three/examples/jsm/loaders/MTLLoader.js";

type Props = {
  modelPath: string; // FULL absolute URL to the .obj file
  onClose: () => void;
};

export default function ModelViewerOBJ({ modelPath, onClose }: Props) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!containerRef.current) return;

    /* ---------- CLEAN CONTAINER ---------- */
    containerRef.current.innerHTML = "";
    let frameId = 0;

    /* ---------- SCENE ---------- */
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0xf5f5f5);

    const width = containerRef.current.clientWidth;
    const height = containerRef.current.clientHeight;

    const camera = new THREE.PerspectiveCamera(60, width / height, 0.1, 100000);
    camera.position.set(0, 0, 10);

    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(width, height);
    renderer.setPixelRatio(window.devicePixelRatio);
    containerRef.current.appendChild(renderer.domElement);

    /* ---------- LIGHTS (IMPORTANT) ---------- */
    scene.add(new THREE.AmbientLight(0xffffff, 0.6));

    const dirLight = new THREE.DirectionalLight(0xffffff, 0.8);
    dirLight.position.set(10, 20, 10);
    scene.add(dirLight);

    /* ---------- CONTROLS ---------- */
    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;

    /* ---------- LOAD MTL + OBJ (ABSOLUTE URL LOGIC) ---------- */
    const mtlPath = modelPath.replace(".obj", ".mtl");

    console.log("OBJ URL:", modelPath);
    console.log("MTL URL:", mtlPath);

    const mtlLoader = new MTLLoader();

    mtlLoader.load(
      mtlPath,
      (materials) => {
        console.log("✅ MTL loaded");
        materials.preload();

        const objLoader = new OBJLoader();
        objLoader.setMaterials(materials);

        objLoader.load(
          modelPath,
          (object) => {
            console.log("✅ OBJ loaded with materials");

            /* ---------- CENTER MODEL ---------- */
            const box = new THREE.Box3().setFromObject(object);
            const center = box.getCenter(new THREE.Vector3());
            const size = box.getSize(new THREE.Vector3());

            object.position.sub(center);

            /* ---------- FIX ODM MATERIAL ISSUES ---------- */
            object.traverse((child) => {
              if (child instanceof THREE.Mesh) {
                const mat = child.material;
                if (Array.isArray(mat)) {
                  mat.forEach((m) => (m.side = THREE.DoubleSide));
                } else {
                  mat.side = THREE.DoubleSide;
                }
              }
            });

            /* ---------- FIT CAMERA ---------- */
            const maxDim = Math.max(size.x, size.y, size.z);
            camera.position.set(0, maxDim * 0.8, maxDim * 2.5);
            camera.lookAt(0, 0, 0);

            scene.add(object);
            controls.update();
          },
          (xhr) => {
            if (xhr.total) {
              console.log(
                `📦 OBJ ${(xhr.loaded / xhr.total) * 100}% loaded`
              );
            }
          },
          (err) => {
            console.error("❌ OBJ load error:", err);
          }
        );
      },
      undefined,
      (err) => {
        console.error("❌ MTL load error:", err);
      }
    );

    /* ---------- RENDER LOOP ---------- */
    const animate = () => {
      frameId = requestAnimationFrame(animate);
      controls.update();
      renderer.render(scene, camera);
    };
    animate();

    /* ---------- CLEANUP ---------- */
    return () => {
      cancelAnimationFrame(frameId);
      renderer.dispose();
      containerRef.current?.replaceChildren();
    };
  }, [modelPath]);

  return (
    <div className="relative w-full h-full">
      <button
        onClick={onClose}
        className="absolute top-3 right-3 z-10 w-8 h-8 rounded-full bg-black/70 text-white flex items-center justify-center"
      >
        ✕
      </button>

      <div ref={containerRef} className="w-full h-full" />
    </div>
  );
}