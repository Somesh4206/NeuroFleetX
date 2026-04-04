@echo off
REM ============================================================
REM NeuroFleetX - ONE COMMAND STARTUP
REM ============================================================

echo.
echo ========================================
echo   NeuroFleetX - Starting...
echo ========================================
echo.

REM Check if Docker is running
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker is not running!
    echo.
    echo Please start Docker Desktop and try again.
    echo.
    pause
    exit /b 1
)

echo [1/3] Checking Docker...
echo      Docker is running ✓
echo.

echo [2/3] Starting all services with Docker Compose...
echo      This may take 2-3 minutes on first run...
echo.

docker-compose up -d --build

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to start services!
    echo.
    pause
    exit /b 1
)

echo.
echo [3/3] Waiting for services to be ready...
timeout /t 30 /nobreak >nul

echo.
echo ========================================
echo   NeuroFleetX is READY!
echo ========================================
echo.
echo Frontend:  http://localhost:5173
echo Backend:   http://localhost:8080
echo ML Service: http://localhost:5001
echo.
echo ========================================
echo   Demo Login Credentials
echo ========================================
echo.
echo Admin:
echo   Email: admin@neurofleetx.com
echo   Password: Admin@123
echo.
echo Manager:
echo   Email: manager@neurofleetx.com
echo   Password: Manager@123
echo.
echo Driver:
echo   Email: driver@neurofleetx.com
echo   Password: Driver@123
echo.
echo Customer:
echo   Email: customer@neurofleetx.com
echo   Password: Customer@123
echo.
echo ========================================
echo.

REM Open browser
echo Opening browser...
start http://localhost:5173

echo.
echo To stop all services, run: docker-compose down
echo To view logs, run: docker-compose logs -f
echo.
pause
