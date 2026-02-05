"use client";

import { useEffect, useRef } from "react";
import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";
import { OBJLoader } from "three/examples/jsm/loaders/OBJLoader";

type Props = {
  modelPath: string;
  onClose: () => void;
};

export default function ModelViewerOBJ({ modelPath, onClose }: Props) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!containerRef.current) return;

    containerRef.current.innerHTML = "";
    let frameId: number;

    const scene = new THREE.Scene();
    scene.background = new THREE.Color("#f5f5f5");

    const { clientWidth: width, clientHeight: height } = containerRef.current;

    const camera = new THREE.PerspectiveCamera(60, width / height, 0.1, 1000);
    camera.position.set(0, 1.5, 3);

    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(width, height);
    renderer.setPixelRatio(window.devicePixelRatio);
    containerRef.current.appendChild(renderer.domElement);

    scene.add(new THREE.AmbientLight(0xffffff, 0.8));
    const light = new THREE.DirectionalLight(0xffffff, 0.8);
    light.position.set(5, 5, 5);
    scene.add(light);

    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;

    new OBJLoader().load(modelPath, (obj) => {
      scene.add(obj);

      const box = new THREE.Box3().setFromObject(obj);
      const center = box.getCenter(new THREE.Vector3());
      const size = box.getSize(new THREE.Vector3());

      obj.position.sub(center);
      camera.position.z = Math.max(size.x, size.y, size.z) * 2.2;
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
