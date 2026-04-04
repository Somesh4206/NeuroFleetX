# NeuroFleetX - Frontend, Backend & Database Linking Guide

## ✅ Current Architecture

```
┌─────────────────────────────────────────────────────────────┐
│              Frontend (React + Vite)                        │
│              http://localhost:5174                          │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           │ HTTP/REST + WebSocket
                           │ (Port 8081)
                           ▼
┌─────────────────────────────────────────────────────────────┐
│         Backend (Spring Boot 3.5)                           │
│         http://localhost:8081                               │
│         Connected to:                                       │
│         - MySQL 8.0 Database                                │
│         - ML Service (port 5000)                            │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           │ JDBC Connection
                           │ (Port 3306)
                           ▼
┌─────────────────────────────────────────────────────────────┐
│              MySQL 8.0 Database                             │
│              localhost:3306                                 │
│              Database: neurofleetx                          │
│              User: root / root123                           │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔗 Connection Details

### 1. Frontend → Backend Connection

**Configuration File**: `neurofleetx-frontend/src/config/config.js`

```javascript
export const config = {
  API_URL: "http://localhost:8081",           // ✅ Backend API
  ML_SERVICE_URL: "http://localhost:5000",    // ML Service
  WS_TELEMETRY_URL: "http://localhost:8081/ws-telemetry",
  WS_MAINTENANCE_URL: "http://localhost:8081/ws-maintenance",
};
```

**HTTP Client**: `neurofleetx-frontend/src/api/axiosInstance.js`

```javascript
const axiosInstance = axios.create({
  baseURL: `${config.API_URL}/api`,    // http://localhost:8081/api
  timeout: 30000,
});
```

**Auth API**: `neurofleetx-frontend/src/api/auth.js`

```javascript
const API_URL = `${config.API_URL}/auth`;  // http://localhost:8081/api/auth

export const registerUser = (data) => 
  axios.post(`${API_URL}/register`, data);  // POST to backend
```

---

### 2. Backend → Database Connection

**Configuration File**: `neurofleetx-backend/src/main/resources/application.properties`

```properties
# MySQL Connection
spring.datasource.url=jdbc:mysql://localhost:3306/neurofleetx?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8
spring.datasource.username=root
spring.datasource.password=root123
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# HikariCP Connection Pool
spring.datasource.hikari.maximum-pool-size=10
spring.datasource.hikari.minimum-idle=2

# Hibernate Schema Creation
spring.jpa.hibernate.ddl-auto=create  # Auto-creates tables
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
```

**Environment Override** (`.env` file):

```env
DB_USERNAME=root
DB_PASSWORD=root123
DB_URL=jdbc:mysql://localhost:3306/neurofleetx?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8
```

---

## 🔄 Data Flow Example - User Registration

### Step 1: User submits registration form
```
Frontend: http://localhost:5174/register
```

### Step 2: Frontend sends HTTP POST
```
POST http://localhost:8081/api/auth/register
Content-Type: application/json

{
  "fullName": "John Doe",
  "email": "john@example.com",
  "password": "secure123",
  "role": "CUSTOMER"
}
```

### Step 3: Backend receives & processes request
```
Spring Boot (port 8081)
├─ AuthController.register()
├─ UserService.registerUser()
└─ Stores user in database
```

### Step 4: Backend connects to MySQL
```
Connection: localhost:3306
Database: neurofleetx
Insert: INSERT INTO users (email, password, fullName)
VALUES ('john@example.com', 'hashed_password', 'John Doe')
```

### Step 5: Backend returns response
```
HTTP 200 OK
{
  "id": 1,
  "message": "User registered successfully",
  "email": "john@example.com"
}
```

### Step 6: Frontend receives & displays message
```
Frontend displays: "User registered successfully!"
Redirects to login page after 2 seconds
```

---

## 🧪 Test Each Connection

### Test 1: Frontend Health
```bash
# Browser
http://localhost:5174

# Expected: React app loads
```

### Test 2: Backend Health
```bash
# Browser/curl
http://localhost:8081/actuator/health

# Expected: 
{
  "status": "UP",
  "components": {
    "db": {"status": "UP"}
  }
}
```

### Test 3: Database Connection
```bash
# Terminal
mysql -u root -proot123 -e "SELECT VERSION();"
mysql -u root -proot123 -e "USE neurofleetx; SHOW TABLES;"

# Expected: MySQL version and list of tables
```

### Test 4: API Test (Registration)
```bash
curl -X POST http://localhost:8081/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "fullName": "Test User",
    "email": "test@example.com",
    "password": "Test@123",
    "role": "CUSTOMER"
  }'

# Expected: 201 Created response with user data
```

---

## 🛑 Service Ports Summary

| Service | Port | Localhost URL | Status |
|---------|------|---------------|--------|
| MySQL | 3306 | - | ✅ Running |
| Backend | 8081 | http://localhost:8081 | ✅ Running |
| Frontend | 5174 | http://localhost:5174 | ✅ Running |
| ML Service | 5000 | http://localhost:5000 | (Optional) |
| Apache HTTP | 8080 | http://localhost:8080 | (Blocked) |

---

## 📝 Key Files Modified for Linking

### Frontend
1. ✅ `src/config/config.js` - API_URL changed to localhost:8081
2. ✅ `src/api/auth.js` - Uses config.API_URL
3. ✅ `src/api/axiosInstance.js` - baseURL from config
4. ✅ `src/api/vehicleApi.js` - Uses axiosInstance
5. ✅ `src/api/bookingApi.js` - Uses axiosInstance
6. ✅ `src/utils/wsRoutes.js` - WebSocket URL from config

### Backend
1. ✅ `application.properties` - MySQL connection details
2. ✅ `.env` - Environment credentials
3. ✅ `pom.xml` - MySQL driver included

### Database
1. ✅ `.env` - Root user created
2. ✅ `neurofleetx` database created
3. ✅ Tables auto-created by Hibernate

---

## 🚀 How to Verify Full Linkage

### 1. All Services Running?
```bash
netstat -ano | findstr "3306"    # MySQL
netstat -ano | findstr "8081"    # Backend
netstat -ano | findstr "5174"    # Frontend
```

### 2. Frontend → Backend Connection?
1. Open http://localhost:5174 in browser
2. Open DevTools (F12)
3. Go to Network tab
4. Register a new user
5. You should see POST request to `http://localhost:8081/api/auth/register`

### 3. Backend → Database Connection?
1. Check Spring Boot startup logs in terminal
2. Look for: "✅ HikariPool-1 - Connection is alive"
3. In MySQL: `SHOW PROCESSLIST;` should show active connections

---

## ✨ System is Now Fully Linked!

All three components are connected and communicating:
- ✅ Frontend talks to Backend
- ✅ Backend talks to MySQL
- ✅ Data flows bidirectionally
- ✅ Ready for testing!

**Access your application**: http://localhost:5174
