# 🚀 NeuroFleetX — AI-Driven Urban Mobility Optimization System

> **Stack:** Spring Boot 3.5 · MySQL 8 · React 19 · Python Flask ML · WebSocket · JWT · Razorpay

---

## 📐 Architecture Overview

```
neurofleetx-backend/    → Spring Boot REST API + WebSocket server
neurofleetx-frontend/   → React 19 + Vite + TailwindCSS SPA
neurofleetx-ml/         → Python Flask ML service (ETA, maintenance, recommendations)
docker-compose.yml      → Full stack orchestration with MySQL 8
init.sql                → MySQL database initialization
```

### Key Features
| Feature | Details |
|---------|---------|
| **Auth** | JWT-based, Role-based (ADMIN, MANAGER, DRIVER, CUSTOMER) |
| **Booking** | Multi-step wizard, time slots, availability calendar |
| **Fleet** | Live telemetry via WebSocket, health scoring |
| **AI/ML** | ETA prediction, predictive maintenance, vehicle recommendations |
| **Payments** | Razorpay integration |
| **Analytics** | Heatmaps, revenue analytics, maintenance charts |
| **Email** | SMTP password reset, booking confirmations |

---

## 📋 Prerequisites

| Tool | Version |
|------|---------|
| Java | 21+ |
| Maven | 3.8+ (or use included `mvnw`) |
| Node.js | 20+ |
| MySQL | 8.0+ |
| Python | 3.10+ |
| Docker + Compose | Optional (recommended) |

---

## ⚡ Quick Start — Option A: Docker Compose (Recommended)

```bash
# 1. Clone / extract the project
cd NeuroFleetX-MySQL-Custom

# 2. Create your .env from the example
cp .env.example .env
# Open .env and fill in your passwords, API keys, etc.

# 3. Build and start everything
docker-compose up --build

# Services will be available at:
#   Frontend:  http://localhost:5173
#   Backend:   http://localhost:8080
#   ML:        http://localhost:5000
#   MySQL:     localhost:3306
```

---

## 🔧 Quick Start — Option B: Manual Local Setup

### 1. MySQL Setup

```sql
CREATE DATABASE neurofleetx CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'neurofleetx'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON neurofleetx.* TO 'neurofleetx'@'localhost';
FLUSH PRIVILEGES;
```

### 2. Backend Setup

```bash
cd neurofleetx-backend
# Edit .env with your credentials, then:
./mvnw spring-boot:run
# Backend starts at: http://localhost:8080
```

Key `.env` variables:
```env
DB_URL=jdbc:mysql://localhost:3306/neurofleetx?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
DB_USERNAME=neurofleetx
DB_PASSWORD=your_password
JWT_SECRET=at-least-32-characters-change-in-production!
RAZORPAY_KEY_ID=rzp_test_...
RAZORPAY_KEY_SECRET=...
SMTP_USERNAME=your@gmail.com
SMTP_PASSWORD=your-gmail-app-password
```

### 3. ML Service Setup

```bash
cd neurofleetx-ml
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt
python app.py
# ML service starts at: http://localhost:5000
```

### 4. Frontend Setup

```bash
cd neurofleetx-frontend
npm install
cp .env .env.local    # then edit VITE_API_URL=http://localhost:8080
npm run dev
# Frontend starts at: http://localhost:5173
```

---

## 🗄️ Database Notes

Tables are auto-created by Hibernate (`ddl-auto=update`). No SQL migration needed for first run.

```bash
# Export DB
mysqldump -u root -p neurofleetx > backup.sql
# Restore DB
mysql -u root -p neurofleetx < backup.sql
```

---

## 🐳 Docker Tips

```bash
docker-compose logs -f backend           # watch backend logs
docker exec -it neurofleetx-mysql mysql -u root -p neurofleetx   # MySQL shell
docker-compose down -v                   # full reset (deletes data)
```

---

## 🔒 Security Checklist

- Change `JWT_SECRET` (32+ chars) before any deployment
- Never commit `.env` files — protected by `.gitignore`
- For production, enable MySQL SSL: `useSSL=true`
- Switch Razorpay from `rzp_test_*` keys to live keys
- Lock down CORS origins in `SecurityConfig.java`

---

## 🛠️ Troubleshooting

| Problem | Fix |
|---------|-----|
| MySQL connection refused | Ensure MySQL is running, check `DB_URL` |
| Access denied | Verify user/password match the MySQL grant |
| Unknown column errors | Use `JPA_DDL_AUTO=update` and restart |
| JWT errors | Ensure `JWT_SECRET` is consistent across restarts |
| ML not responding | Run `python app.py` in `neurofleetx-ml/` |
| WebSocket fails | Set `VITE_ENABLE_WEBSOCKET=true` in frontend `.env.local` |
