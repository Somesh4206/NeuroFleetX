import { defineConfig, loadEnv } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), "");
  const backendUrl = env.VITE_API_URL || "http://localhost:8080";

  return {
    plugins: [react(), tailwindcss()],
    define: {
      global: "window", // required by stompjs
    },
    server: {
      port: 5173,
      proxy: {
        // WebSocket proxy to Spring Boot
        "/ws-telemetry": {
          target: backendUrl,
          changeOrigin: true,
          ws: true,
        },
        "/ws-maintenance": {
          target: backendUrl,
          changeOrigin: true,
          ws: true,
        },
        // REST API proxy
        "/api": {
          target: backendUrl,
          changeOrigin: true,
        },
      },
    },
  };
});
