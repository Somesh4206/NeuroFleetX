# 🚀 NeuroFleetX - One Command Startup

## ⚡ The Fastest Way to Run NeuroFleetX

You can now start the entire NeuroFleetX application with **just ONE command**!

---

## 📋 Prerequisites

### Required:
- **Docker Desktop** installed and running
  - Download: https://www.docker.com/products/docker-desktop

### That's it! Everything else is handled automatically.

---

## 🎯 One Command Startup

### Windows:
```batch
RUN.bat
```

### Linux/Mac:
```bash
chmod +x RUN.sh
./RUN.sh
```

### Or use Docker Compose directly:
```bash
docker-compose up -d --build
```

---

## ⏱️ What Happens

1. ✅ Checks if Docker is running
2. ✅ Builds all Docker images (first time only, ~3-5 minutes)
3. ✅ Starts MySQL database
4. ✅ Starts Spring Boot backend
5. ✅ Starts Python ML service
6. ✅ Starts React frontend
7. ✅ Opens browser automatically
8. ✅ Shows login credentials

**Total time:**
- First run: 3-5 minutes (building images)
- Subsequent runs: 30-60 seconds

---

## 🌐 Access URLs

After startup, access the application at:

| Service | URL |
|---------|-----|
| **Frontend** | http://localhost:5173 |
| **Backend API** | http://localhost:8080 |
| **ML Service** | http://localhost:5001 |
| **MySQL** | localhost:3307 |

---

## 🔐 Demo Login Credentials

The application automatically creates these demo accounts:

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

## 🛑 Stop the Application

### Stop all services:
```bash
docker-compose down
```

### Stop and remove all data (fresh start):
```bash
docker-compose down -v
```

---

## 📊 View Logs

### View all logs:
```bash
docker-compose logs -f
```

### View specific service logs:
```bash
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f ml
docker-compose logs -f db
```

---

## 🔄 Restart Services

### Restart all:
```bash
docker-compose restart
```

### Restart specific service:
```bash
docker-compose restart backend
```

---

## 🐛 Troubleshooting

### Issue: "Docker is not running"
**Solution:**
1. Start Docker Desktop
2. Wait for it to fully start (whale icon in system tray)
3. Run the command again

### Issue: "Port already in use"
**Solution:**
```bash
# Stop any existing containers
docker-compose down

# Check what's using the ports
netstat -ano | findstr ":8080 :5173 :5001"

# Kill the process or change ports in docker-compose.yml
```

### Issue: "Build failed"
**Solution:**
```bash
# Clean everything and rebuild
docker-compose down -v
docker system prune -a
docker-compose up -d --build
```

### Issue: "Services not responding"
**Solution:**
```bash
# Check service status
docker-compose ps

# View logs for errors
docker-compose logs

# Restart services
docker-compose restart
```

---

## 📦 What's Included

The Docker setup includes:

- ✅ **MySQL 8.0** - Database with auto-initialization
- ✅ **Spring Boot 3.5** - Backend API with JWT auth
- ✅ **React 19 + Vite** - Modern frontend
- ✅ **Python Flask** - ML service with trained models
- ✅ **WebSocket** - Real-time updates
- ✅ **Auto-configuration** - Everything pre-configured

---

## 🎨 Features Available

After login, you can access:

### Admin Dashboard:
- Vehicle Management (CRUD)
- User Management
- Booking Management
- Fleet Analytics
- Maintenance Tracking
- Revenue Reports
- Live Fleet Map
- Real-time Telemetry

### Manager Dashboard:
- Route Management
- Fleet Overview
- Booking Oversight
- Maintenance Scheduling
- Analytics & Reports

### Driver Dashboard:
- Assigned Routes
- Live Trip Tracking
- Vehicle Status
- Booking Details

### Customer Dashboard:
- Book Vehicles
- Booking History
- Track Live Trips
- Payment Management
- Vehicle Recommendations

---

## 🔧 Advanced Configuration

### Custom Environment Variables

Create a `.env` file in the root directory:

```env
# Database
DB_USERNAME=neurofleetx
DB_PASSWORD=your_password

# JWT
JWT_SECRET=your_secret_key_here

# Email (optional)
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=your-app-password

# Razorpay (optional)
RAZORPAY_KEY_ID=your_key
RAZORPAY_KEY_SECRET=your_secret
```

### Change Ports

Edit `docker-compose.yml`:

```yaml
ports:
  - "YOUR_PORT:8080"  # Backend
  - "YOUR_PORT:5173"  # Frontend
  - "YOUR_PORT:5001"  # ML Service
```

---

## 📝 Notes

### First Run:
- Docker will download base images (~2GB)
- Build all services (~3-5 minutes)
- Initialize database
- Create demo accounts

### Subsequent Runs:
- Uses cached images
- Starts in 30-60 seconds
- Data persists in Docker volumes

### Data Persistence:
- Database data is stored in Docker volume `mysql_data`
- Survives container restarts
- To reset: `docker-compose down -v`

---

## ✅ Success Checklist

After running the startup command, verify:

- [ ] Docker Desktop is running
- [ ] All 4 containers are running: `docker-compose ps`
- [ ] Frontend opens in browser
- [ ] Can login with demo credentials
- [ ] Dashboard shows components (not blank)
- [ ] No errors in logs: `docker-compose logs`

---

## 🎉 That's It!

You now have a fully functional NeuroFleetX system running with just one command!

**Enjoy exploring the application! 🚗💨**

---

## 📚 Additional Resources

- **Full Documentation:** README.md
- **Troubleshooting:** FIX_BLANK_DASHBOARD.md
- **Manual Setup:** QUICK_START_GUIDE.md
- **ML Models:** neurofleetx-ml/README_MODELS.md

---

## 🔗 Useful Commands

```bash
# Start
docker-compose up -d

# Stop
docker-compose down

# Restart
docker-compose restart

# View logs
docker-compose logs -f

# Check status
docker-compose ps

# Fresh start
docker-compose down -v && docker-compose up -d --build

# Access container shell
docker exec -it neurofleetx-backend bash
docker exec -it neurofleetx-mysql mysql -u root -p
```

---

**Need help?** Check the logs or open an issue on GitHub!
