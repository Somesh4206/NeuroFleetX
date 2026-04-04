// Purpose: Connect to backend stomp endpoint and subscribe to /topic/routes
import { Client } from "@stomp/stompjs";
import SockJS from "sockjs-client";
import { config } from "../config/config";

let stompClient = null;

export function connectRouteSocket(onMessage) {
  if (stompClient && stompClient.active) return;

  const wsBaseUrl = config.API_URL.replace(/^http/, "ws");
  const socket = new SockJS(
    `${wsBaseUrl}/ws`
  );
  stompClient = new Client({
    webSocketFactory: () => socket,
    reconnectDelay: 5000,
    debug: (s) => {
      /* console.log(s) */
    },
  });

  stompClient.onConnect = () => {
    stompClient.subscribe("/topic/routes", (msg) => {
      const data = JSON.parse(msg.body);
      onMessage(data);
    });
  };

  stompClient.activate();
}

export function disconnectRouteSocket() {
  if (stompClient) stompClient.deactivate();
}
