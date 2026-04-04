# 🔧 Fix Blank Dashboard Issue - Step by Step Guide

## ✅ Current Service Status

All services are running correctly:

| Service | URL | Status |
|---------|-----|--------|
| **Frontend** | http://localhost:5174 | ✅ Running |
| **Backend API** | http://localhost:8081 | ✅ Running |
| **ML Service** | http://localhost:5001 | ✅ Running |
| **MySQL Database** | localhost:3306 | ✅ Running |

---

## 🚨 Why You're Seeing a Blank Dashboard

The blank dashboard is caused by:
1. **Old cached data** in your browser's localStorage pointing to the wrong backend port
2. **Invalid JWT token** from previous login attempts
3. **Browser cache** holding old configuration

---

## 🔧 Solution - Follow These Steps Exactly

### Step 1: Clear Browser Storage

**Option A - Use the Auto-Cleaner (Easiest):**
1. A page should have opened: `CLEAR_BROWSER_STORAGE.html`
2. Click the "Clear Storage & Redirect to Login" button
3. Wait for automatic redirect to login page

**Option B - Manual Clear:**
1. Open http://localhost:5174 in your browser
2. Press `F12` to open Developer Tools
3. Go to the "Application" or "Storage" tab
4. Click "Local Storage" → "http://localhost:5174"
5. Click "Clear All" or delete these items:
   - `jwtToken`
   - `userId`
   - `userRole`
   - `user`
6. Close Developer Tools

### Step 2: Fresh Login

1. Go to: **http://localhost:5174/login**
2. Use one of these demo accounts:

**Admin Account (Recommended for testing):**
```
Email: admin@neurofleetx.com
Password: Admin@123
```

**Manager Account:**
```
Email: manager@neurofleetx.com
Password: Manager@123
```

**Driver Account:**
```
Email: driver@neurofleetx.com
Password: Driver@123
```

**Customer Account:**
```
Email: customer@neurofleetx.com
Password: Customer@123
```

3. Click "Login to Dashboard"
4. You should now see the full dashboard with all components!

---

## 🎯 What You Should See After Login

### Admin Dashboard Features:
- 📊 Fleet Analytics Overview
- 🚗 Vehicle Management (Add, Edit, Delete)
- 👥 User Management
- 📅 Booking Management
- 🔧 Maintenance Tracking
- 📈 Revenue Analytics
- 🗺️ Live Fleet Map
- 📊 Real-time Telemetry
- 🔔 Alert System

### Manager Dashboard Features:
- 🗺️ Route Management
- 🚗 Fleet Overview
- 📅 Booking Oversight
- 🔧 Maintenance Scheduling
- 📊 Analytics & Reports

### Driver Dashboard Features:
- 🗺️ Assigned Routes
- 📍 Live Trip Tracking
- 🚗 Vehicle Status
- 📅 Booking Details

### Customer Dashboard Features:
- 📅 Book Vehicles
- 📜 Booking History
- 📍 Track Live Trips
- 💳 Payment Management
- 🚗 Vehicle Recommendations

---

## 🐛 Still Having Issues?

### Issue: "Invalid credentials" error
**Solution:**
- Wait 10-15 seconds after backend starts
- Make sure you're using the exact credentials (case-sensitive)
- Check that backend is running: http://localhost:8081

### Issue: Dashboard loads but shows "Loading user data..."
**Solution:**
1. Open browser console (F12)
2. Check for errors
3. Verify the API call is going to `http://localhost:8081/api/users/...`
4. If it's going to port 8080, clear storage and login again

### Issue: Components not loading
**Solution:**
1. Check browser console for JavaScript errors
2. Make sure all services are running (see status table above)
3. Try hard refresh: `Ctrl + Shift + R` (Windows) or `Cmd + Shift + R` (Mac)

### Issue: "Network Error" or "Cannot connect"
**Solution:**
1. Verify backend is running:
   ```
   netstat -ano | findstr :8081
   ```
2. If not running, restart backend:
   ```
   start-backend-only.bat
   ```
3. Wait 30-60 seconds for backend to fully start

---

## 🔄 Quick Service Restart Commands

If you need to restart services:

**Restart Backend:**
```batch
start-backend-only.bat
```

**Restart Frontend:**
```batch
cd neurofleetx-frontend
npm run dev
```

**Restart ML Service:**
```batch
cd neurofleetx-ml
python app.py
```

---

## 📝 Technical Details

### Backend Configuration:
- Port: 8081 (changed from 8080 to avoid conflicts)
- Database: MySQL on localhost:3306
- ML Service: http://localhost:5001

### Frontend Configuration:
- Port: 5174 (Vite auto-selected due to 5173 being in use)
- API URL: http://localhost:8081
- WebSocket: http://localhost:8081/ws-*

### Demo Accounts Created:
All accounts are automatically created when the backend starts for the first time. They are stored in the MySQL database with bcrypt-encrypted passwords.

---

## ✅ Success Checklist

After following the steps above, you should have:
- [ ] Cleared browser storage
- [ ] Logged in with demo credentials
- [ ] Seeing the full dashboard with components
- [ ] No console errors in browser
- [ ] All services running (check status table)

---

**Need more help?** Check the browser console (F12) for specific error messages and share them for further troubleshooting.

**Enjoy exploring NeuroFleetX! 🚗💨**
