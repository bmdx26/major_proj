"use client";

import { useEffect, useRef } from "react";
import * as THREE from "three";
import { OrbitControls } from "three/addons/controls/OrbitControls.js";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";

type Props = {
  modelPath: string;
  onClose: () => void;
};

export default function ModelViewer({ modelPath, onClose }: Props) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!containerRef.current || !modelPath) return;

    containerRef.current.innerHTML = "";
    let frameId: number;

    const scene = new THREE.Scene();
    scene.background = new THREE.Color("#f5f5f5");

    const { clientWidth: width, clientHeight: height } = containerRef.current;

    const camera = new THREE.PerspectiveCamera(60, width / height, 0.1, 1000);
    camera.position.set(0, 1.5, 3);

    const renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
    renderer.setSize(width, height);
    renderer.setPixelRatio(window.devicePixelRatio);
    containerRef.current.appendChild(renderer.domElement);

    scene.add(new THREE.AmbientLight(0xffffff, 0.7));
    const dirLight = new THREE.DirectionalLight(0xffffff, 0.8);
    dirLight.position.set(5, 5, 5);
    scene.add(dirLight);

    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;

    scene.add(new THREE.AxesHelper(1.5));

    new GLTFLoader().load(modelPath, (gltf) => {
      const model = gltf.scene;
      scene.add(model);

      const box = new THREE.Box3().setFromObject(model);
      const center = box.getCenter(new THREE.Vector3());
      const size = box.getSize(new THREE.Vector3());

      model.position.sub(center);
      camera.position.z = Math.max(size.x, size.y, size.z) * 2;
      controls.update();
    });

    const animate = () => {
      frameId = requestAnimationFrame(animate);
      controls.update();
      renderer.render(scene, camera);
    };
    animate();

    return () => {
      cancelAnimationFrame(frameId);
      renderer.dispose();
      containerRef.current?.replaceChildren();
    };
  }, [modelPath]);

  return (
    <div className="relative w-full h-full overflow-hidden">
      {/* ❌ Close button */}
      <button
        onClick={onClose}
        className="absolute top-3 right-3 z-10 w-8 h-8 rounded-full bg-black/70 text-white flex items-center justify-center hover:bg-black"
      >
        ✕
      </button>

      <div ref={containerRef} className="w-full h-full" />
    </div>
  );
}
