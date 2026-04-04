@echo off
echo.
echo ========================================
echo   NeuroFleetX - Quick Start
echo ========================================
echo.

REM Check if services are already running
netstat -ano | findstr ":8081" >nul
if %errorlevel% equ 0 (
    echo [!] Backend already running on port 8081
) else (
    echo [1/3] Starting Backend on port 8081...
    start cmd /k "title NeuroFleetX Backend & start-backend-only.bat"
    timeout /t 5 /nobreak >nul
)

netstat -ano | findstr ":5001" >nul
if %errorlevel% equ 0 (
    echo [!] ML Service already running on port 5001
) else (
    echo [2/3] Starting ML Service on port 5001...
    cd neurofleetx-ml
    start cmd /k "title NeuroFleetX ML Service & python app.py"
    cd ..
    timeout /t 3 /nobreak >nul
)

echo [3/3] Starting Frontend...
cd neurofleetx-frontend
start cmd /k "title NeuroFleetX Frontend & npm run dev"
cd ..

echo.
echo ========================================
echo   Services Starting...
echo ========================================
echo.
echo Frontend will be available at:
echo   http://localhost:5173 or http://localhost:5174
echo.
echo Backend API:
echo   http://localhost:8081
echo.
echo ML Service:
echo   http://localhost:5001
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
echo Wait 30-60 seconds for all services to start,
echo then open http://localhost:5174 in your browser
echo.
echo Press any key to open the login page...
pause >nul

start http://localhost:5174/login

echo.
echo To stop services, close the terminal windows
echo or press Ctrl+C in each window.
echo.
pause
