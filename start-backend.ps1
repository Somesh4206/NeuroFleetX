$env:JAVA_HOME = "C:\Program Files\Microsoft\jdk-17.0.16.8-hotspot"
$env:SERVER_PORT = "8081"
$env:ML_SERVICE_URL = "http://localhost:5001"
Set-Location neurofleetx-backend
./mvnw.cmd spring-boot:run
