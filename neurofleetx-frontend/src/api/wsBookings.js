import SockJS from "sockjs-client";
import { Stomp } from "@stomp/stompjs";
import { config } from "../config/config";

let stompClient = null;

export const connectBookingSocket = (onMessage) => {
  const wsBaseUrl = config.API_URL.replace(/^http/, "ws");
  const socket = new SockJS(
    `${wsBaseUrl}/ws`
  );
  stompClient = Stomp.over(socket);
  stompClient.connect({}, () => {
    stompClient.subscribe("/topic/bookings", (msg) => {
      const data = JSON.parse(msg.body);
      onMessage(data);
    });
  });
};

export const disconnectBookingSocket = () => {
  if (stompClient) stompClient.disconnect();
};
