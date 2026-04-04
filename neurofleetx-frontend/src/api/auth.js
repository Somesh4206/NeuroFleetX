import axios from "axios";
import axiosInstance from "./axiosInstance";
import { config } from "../config/config";

const API_URL = `${config.API_URL}/auth`;

export const registerUser = (data) => axiosInstance.post("/auth/register", data);

// All auth-related API calls
const authApi = {
  login: (email, password) =>
    axiosInstance.post("/auth/login", { email, password }),
  getProfile: () => axiosInstance.get("/auth/me"),

  // Password Reset Endpoints
  forgotPassword: (email) =>
    axiosInstance.post("/auth/forgot-password", { email }),
  verifyResetToken: (token) =>
    axiosInstance.get(`/auth/verify-reset-token?token=${token}`),
  resetPassword: (token, newPassword) =>
    axiosInstance.post("/auth/reset-password", { token, newPassword }),
};

export default authApi;
