# 🚀 NeuroFleetX - Quick Start Guide

## ⚡ Fastest Way to Start

**Just run this:**
```batch
START_NEUROFLEETX.bat
```

This will:
1. ✅ Start Backend (port 8081)
2. ✅ Start ML Service (port 5001)
3. ✅ Start Frontend (port 5174)
4. ✅ Open login page in browser

---

## 🔐 Login Credentials

### Admin (Full Access)
```
Email: admin@neurofleetx.com
Password: Admin@123
```

### Manager (Fleet Management)
```
Email: manager@neurofleetx.com
Password: Manager@123
```

### Driver (Driver Dashboard)
```
Email: driver@neurofleetx.com
Password: Driver@123
```

### Customer (Booking & Tracking)
```
Email: customer@neurofleetx.com
Password: Customer@123
```

---

## 🌐 Service URLs

| Service | URL |
|---------|-----|
| **Login Page** | http://localhost:5174/login |
| **Frontend** | http://localhost:5174 |
| **Backend API** | http://localhost:8081 |
| **ML Service** | http://localhost:5001 |

---

## 🐛 Troubleshooting

### Problem: Blank Dashboard After Login

**Solution:**
1. Open: `CLEAR_BROWSER_STORAGE.html`
2. Click "Clear Storage & Redirect to Login"
3. Login again with demo credentials

**OR manually:**
- Press F12 → Application → Local Storage → Clear All
- Refresh page and login again

### Problem: "Invalid credentials"

**Solution:**
- Wait 30-60 seconds after starting backend
- Make sure you're using exact credentials (case-sensitive)
- Check backend is running: `netstat -ano | findstr :8081`

### Problem: Services won't start

**Solution:**
1. Check if ports are already in use
2. Close any existing terminal windows
3. Run `START_NEUROFLEETX.bat` again

---

## 📚 Detailed Guides

- **Full Setup Instructions:** `README.md`
- **Demo Credentials:** `DEMO_LOGIN_INFO.md`
- **Fix Blank Dashboard:** `FIX_BLANK_DASHBOARD.md`
- **System Status:** `SYSTEM_STATUS.md`

---

## 🎯 What Each Dashboard Offers

### 👨‍💼 Admin Dashboard
- Vehicle Management (CRUD operations)
- User Management
- Booking Management
- Fleet Analytics & KPIs
- Maintenance Tracking
- Revenue Analytics
- Live Fleet Map
- Real-time Telemetry

### 👔 Manager Dashboard
- Route Management
- Fleet Overview
- Booking Oversight
- Vehicle Assignment
- Maintenance Scheduling
- Analytics & Reports

### 🚗 Driver Dashboard
- Assigned Routes
- Live Trip Tracking
- Vehicle Status
- Booking Details
- Navigation Support

### 👤 Customer Dashboard
- Book Vehicles
- Booking History
- Track Live Trips
- Payment Management
- Vehicle Recommendations
- Route Tracking

---

## 🛑 Stop Services

To stop all services:
1. Close the terminal/command windows, OR
2. Press `Ctrl+C` in each terminal window

---

## 💡 Tips

1. **First Time Login:** Wait 30-60 seconds after starting services
2. **Clear Cache:** If you see issues, clear browser storage
3. **Check Console:** Press F12 to see any errors
4. **Port Conflicts:** If ports are in use, close other applications

---

## ✅ Success Checklist

After starting, you should have:
- [ ] 3 terminal windows open (Backend, ML, Frontend)
- [ ] Backend running on port 8081
- [ ] ML Service running on port 5001
- [ ] Frontend running on port 5174
- [ ] Login page opens in browser
- [ ] Can login with demo credentials
- [ ] Dashboard shows components (not blank)

---

**Enjoy exploring NeuroFleetX! 🚗💨**

For issues, check `FIX_BLANK_DASHBOARD.md`
