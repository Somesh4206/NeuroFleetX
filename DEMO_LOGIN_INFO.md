# 🚀 NeuroFleetX - Demo Login Information

## ✅ Services Running

All services are now running and ready to use:

| Service | URL | Status |
|---------|-----|--------|
| **Frontend** | http://localhost:5173 | ✅ Running |
| **Backend API** | http://localhost:8081 | ✅ Running |
| **ML Service** | http://localhost:5001 | ✅ Running |
| **MySQL Database** | localhost:3306 | ✅ Running |

---

## 🔐 Demo Login Credentials

### Admin Account
- **Email:** `admin@neurofleetx.com`
- **Password:** `Admin@123`
- **Role:** ADMIN (Full system access)

### Manager Account
- **Email:** `manager@neurofleetx.com`
- **Password:** `Manager@123`
- **Role:** MANAGER (Fleet management)

### Driver Account
- **Email:** `driver@neurofleetx.com`
- **Password:** `Driver@123`
- **Role:** DRIVER (Driver dashboard)

### Customer Account
- **Email:** `customer@neurofleetx.com`
- **Password:** `Customer@123`
- **Role:** CUSTOMER (Booking and tracking)

---

## 📝 How to Login

1. Open your browser and go to: **http://localhost:5174**
2. You should see the NeuroFleetX login page
3. Enter any of the demo credentials above
4. Click "Login to Dashboard"
5. You'll be redirected to the appropriate dashboard based on your role

---

## 🎯 What Each Role Can Do

### Admin Dashboard
- ✅ User Management (Create, Edit, Delete users)
- ✅ Vehicle Management (Full fleet control)
- ✅ Booking Management (View and manage all bookings)
- ✅ Fleet Analytics & Reports
- ✅ Maintenance Tracking
- ✅ Route Optimization
- ✅ Payment Management
- ✅ Real-time Telemetry

### Manager Dashboard
- ✅ Fleet Overview
- ✅ Route Management
- ✅ Booking Oversight
- ✅ Vehicle Assignment
- ✅ Analytics & Reports
- ✅ Maintenance Scheduling

### Driver Dashboard
- ✅ Assigned Routes
- ✅ Live Trip Tracking
- ✅ Vehicle Status
- ✅ Booking Details
- ✅ Navigation Support

### Customer Dashboard
- ✅ Book Vehicles
- ✅ View Booking History
- ✅ Track Live Trips
- ✅ Payment Management
- ✅ Vehicle Recommendations
- ✅ Route Tracking

---

## 🛑 To Stop Services

To stop the running services:
1. Close the terminal/command windows running the services
2. Or press `Ctrl+C` in each terminal

---

## 📌 Important Notes

- All demo accounts are automatically created on first backend startup
- The database is automatically initialized with roles and basic data
- All services are configured to work together locally
- Frontend is on port 5173
- Backend API is on port 8081 (changed from 8080 due to port conflict)
- ML service is on port 5001

---

## 🔧 Troubleshooting

If you can't login:
1. Check that all services are running (see URLs above)
2. Open browser console for errors (F12)
3. Verify backend is accessible: http://localhost:8081
4. Check that MySQL service is running
5. Make sure you're using the correct credentials (case-sensitive)

If you see "Invalid credentials":
- Double-check the email and password
- Make sure the backend has fully started (wait 30-60 seconds after starting)
- Check the backend terminal for any errors

---

**Enjoy exploring NeuroFleetX! 🚗💨**
