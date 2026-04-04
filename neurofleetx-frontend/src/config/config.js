// src/config/config.js
// Values are read from .env / .env.local (Vite prefix: VITE_)
// Fallback to localhost for local development.

export const config = {
  ENABLE_WEBSOCKET: import.meta.env.VITE_ENABLE_WEBSOCKET === "true",
  API_URL: import.meta.env.VITE_API_URL || "http://localhost:8080",
  ML_SERVICE_URL: import.meta.env.VITE_ML_SERVICE_URL || "http://localhost:5000",
  WS_TELEMETRY_URL:
    import.meta.env.VITE_WS_TELEMETRY_URL ||
    "http://localhost:8080/ws-telemetry",
  WS_MAINTENANCE_URL:
    import.meta.env.VITE_WS_MAINTENANCE_URL ||
    "http://localhost:8080/ws-maintenance",
  GOOGLE_MAPS_API_KEY: import.meta.env.VITE_GOOGLE_MAPS_API_KEY || "",
  RAZORPAY_KEY_ID: import.meta.env.VITE_RAZORPAY_KEY_ID || "",
};
