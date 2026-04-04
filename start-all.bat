@echo off
REM Start NeuroFleetX - Complete Stack

echo.
echo ===============================================
echo NeuroFleetX - Full Stack Startup
echo ===============================================
echo.

REM Set environment variables
set DB_USERNAME=root
set DB_PASSWORD=root123
set DB_URL=jdbc:mysql://localhost:3306/neurofleetx?useSSL=false^&allowPublicKeyRetrieval=true^&serverTimezone=UTC^&characterEncoding=UTF-8
set SERVER_PORT=8081
set ML_SERVICE_URL=http://localhost:5001
set JWT_SECRET=ThisIsA256BitSecretKeyForNeuroFleetXChangeThisInProduction!!

echo [1] Starting MySQL Database...
echo     MySQL running on: localhost:3306
echo.

echo [2] Starting Spring Boot Backend...
echo     Starting backend with credentials: %DB_USERNAME%
echo     URL: %DB_URL%
cd neurofleetx-backend
start cmd /k "title NeuroFleetX Backend & mvnw.cmd spring-boot:run"
cd ..

timeout /t 5 /nobreak

echo [3] Starting React Frontend...
cd neurofleetx-frontend
start cmd /k "title NeuroFleetX Frontend & npm run dev"
cd ..

echo.
echo ===============================================
echo Services Starting...
echo ===============================================
echo.
echo Frontend: http://localhost:5173
echo Backend:  http://localhost:8080
echo MySQL:    localhost:3306
echo.
echo Press Ctrl+C to stop, or close the individual terminal windows.
echo.

pause
