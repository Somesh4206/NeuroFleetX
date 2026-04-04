@echo off
REM NeuroFleetX MySQL Setup & Connection Script for Windows

echo.
echo ===============================================
echo NeuroFleetX - MySQL Database Setup
echo ===============================================
echo.

REM Check if MySQL client is available
where mysql >nul 2>&1
if errorlevel 1 (
    echo [ERROR] MySQL client not found in PATH
    echo Please add MySQL bin directory to your PATH or use Docker
    pause
    exit /b 1
)

REM Create database using MySQL
echo [1] Creating database 'neurofleetx'...
mysql -u root -proot123 -e "CREATE DATABASE IF NOT EXISTS neurofleetx CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
if errorlevel 1 (
    echo [ERROR] Failed to create database. Check MySQL is running.
    echo MySQL Service Status:
    sc query MySQL80
    pause
    exit /b 1
)
echo [SUCCESS] Database created/verified

REM Verify database exists
echo.
echo [2] Verifying database...
mysql -u root -proot123 -e "SHOW DATABASES LIKE 'neurofleetx';"

REM Show MySQL version
echo.
echo [3] MySQL Info:
mysql -u root -proot123 -e "SELECT @@version AS 'MySQL Version';"

echo.
echo ===============================================
echo [SUCCESS] MySQL Setup Complete!
echo ===============================================
echo.
echo Environment:
echo   - Host: localhost
echo   - Port: 3306
echo   - Database: neurofleetx
echo   - Username: root
echo   - Password: root123
echo.
echo .env file has been created with these credentials.
echo.
echo Next steps to start NeuroFleetX:
echo 1. Start Backend: cd neurofleetx-backend ^&^& set DB_USERNAME=root ^&^& set DB_PASSWORD=root123 ^&^& mvnw.cmd spring-boot:run
echo 2. Start ML Service: cd neurofleetx-ml ^&^& python app.py
echo 3. Start Frontend: cd neurofleetx-frontend ^&^& npm install ^&^& npm run dev
echo.
pause
