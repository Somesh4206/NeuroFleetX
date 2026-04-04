# MySQL Database Connection Guide — NeuroFleetX

## ✅ Current Configuration

Your MySQL credentials have been configured as:
- **Host**: localhost
- **Port**: 3306
- **Username**: root
- **Password**: root123
- **Database**: neurofleetx

These credentials are now set in:
1. `.env` file (root directory)
2. `neurofleetx-backend/src/main/resources/application.properties`

## 🔧 Troubleshooting MySQL Connection

### 1. Verify MySQL is Running

**Windows:**
```powershell
# Check if MySQL service is running
Get-Service MySQL80

# Or check port 3306
netstat -ano | findstr :3306
```

**Expected Output:**
```
TCP    0.0.0.0:3306    0.0.0.0:0    LISTENING    [PID]
```

### 2. Test MySQL Connection

If MySQL client is installed:
```bash
mysql -u root -proot123 -e "SELECT VERSION();"
```

### 3. Create Database Manually (if needed)

```sql
-- Log into MySQL
mysql -u root -proot123

-- Then run these commands:
CREATE DATABASE IF NOT EXISTS neurofleetx CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
SHOW DATABASES;
EXIT;
```

### 4. Reset MySQL Credentials

If you need to change the root password:

**Windows Command Line:**
```bash
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';"
```

## 🚀 Start Backend with Database

### Option 1: Command Line (Windows)

```batch
cd neurofleetx-backend
set DB_USERNAME=root
set DB_PASSWORD=root123
mvnw.cmd spring-boot:run
```

### Option 2: Docker Compose (Recommended)

```bash
cd NeuroFleetX-MySQL-Custom
docker-compose up --build
```

### Option 3: IDEs (VS Code, IntelliJ)

Set environment variables before running:
- `DB_USERNAME=root`
- `DB_PASSWORD=root123`

Then run Spring Boot via IDE's Run button.

## 📋 Spring Boot Startup Checklist

Watch for these messages in Spring Boot startup logs:

```
✓ HikariPool-1 - Starting...
✓ HikariPool-1 - Connection is alive...
✓ Successfully created prepared statement
✓ Hibernate is instantiating transient instances...
✓ Started NeuroFleetXApplication in 10.xxx seconds
```

## ❌ Common Connection Errors & Solutions

| Error | Cause | Solution |
|-------|-------|----------|
| `Can't connect to server` | MySQL not running | Check service: `Get-Service MySQL80` |
| `Access denied for user 'root'` | Wrong password | Update `.env` with correct `DB_PASSWORD` |
| `Unknown database 'neurofleetx'` | Database not created | Run init.sql or create manually |
| `Connection timeout` | Firewall blocking port 3306 | Allow localhost:3306 through firewall |

## 📊 Verify Database Connection in Backend

Once backend starts, test endpoints:

```bash
# Check if backend is running
curl http://localhost:8080/actuator/health

# Get all vehicles (requires auth token in production)
curl http://localhost:8080/api/vehicles
```

## 🐳 Using Docker Alternative

If local MySQL has issues, use Docker:

```bash
# Start MySQL container only
docker-compose up db -d

# View logs
docker logs -f neurofleetx-mysql

# Connect to container MySQL
docker exec -it neurofleetx-mysql mysql -u root -proot123
```

## ✨ Files Modified

The following files have been updated with your credentials:

1. **`.env`** - Root environment file with `DB_USERNAME=root` and `DB_PASSWORD=root123`
2. **`neurofleetx-backend/src/main/resources/application.properties`** - Updated default password to `root123`
3. **`docker-compose.yml`** - Will use `.env` variables when running

## 🔒 Security Notes

⚠️ **Important**: These credentials are for **local development only**!

For production:
- Use strong, unique passwords
- Store credentials in secure vaults (AWS Secrets Manager, Azure Key Vault)
- Never commit `.env` to Git (protected by `.gitignore`)
- Use database user with minimal privileges instead of root
