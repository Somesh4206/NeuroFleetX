@echo off
echo Starting NeuroFleetX Backend on port 8081...

set JAVA_HOME=C:\Program Files\Microsoft\jdk-17.0.16.8-hotspot
set DB_USERNAME=root
set DB_PASSWORD=root123
set DB_URL=jdbc:mysql://localhost:3306/neurofleetx?useSSL=false^&allowPublicKeyRetrieval=true^&serverTimezone=UTC^&characterEncoding=UTF-8
set SERVER_PORT=8081
set ML_SERVICE_URL=http://localhost:5001
set JWT_SECRET=ThisIsA256BitSecretKeyForNeuroFleetXChangeThisInProduction!!

cd neurofleetx-backend
call mvnw.cmd spring-boot:run
