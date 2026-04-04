#!/bin/bash

# ============================================================
# NeuroFleetX - ONE COMMAND STARTUP
# ============================================================

echo ""
echo "========================================"
echo "  NeuroFleetX - Starting..."
echo "========================================"
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "[ERROR] Docker is not running!"
    echo ""
    echo "Please start Docker and try again."
    echo ""
    exit 1
fi

echo "[1/3] Checking Docker..."
echo "     Docker is running ✓"
echo ""

echo "[2/3] Starting all services with Docker Compose..."
echo "     This may take 2-3 minutes on first run..."
echo ""

docker-compose up -d --build

if [ $? -ne 0 ]; then
    echo ""
    echo "[ERROR] Failed to start services!"
    echo ""
    exit 1
fi

echo ""
echo "[3/3] Waiting for services to be ready..."
sleep 30

echo ""
echo "========================================"
echo "  NeuroFleetX is READY!"
echo "========================================"
echo ""
echo "Frontend:   http://localhost:5173"
echo "Backend:    http://localhost:8080"
echo "ML Service: http://localhost:5001"
echo ""
echo "========================================"
echo "  Demo Login Credentials"
echo "========================================"
echo ""
echo "Admin:"
echo "  Email: admin@neurofleetx.com"
echo "  Password: Admin@123"
echo ""
echo "Manager:"
echo "  Email: manager@neurofleetx.com"
echo "  Password: Manager@123"
echo ""
echo "Driver:"
echo "  Email: driver@neurofleetx.com"
echo "  Password: Driver@123"
echo ""
echo "Customer:"
echo "  Email: customer@neurofleetx.com"
echo "  Password: Customer@123"
echo ""
echo "========================================"
echo ""

# Open browser (works on most Linux/Mac systems)
if command -v xdg-open > /dev/null; then
    xdg-open http://localhost:5173
elif command -v open > /dev/null; then
    open http://localhost:5173
fi

echo "To stop all services, run: docker-compose down"
echo "To view logs, run: docker-compose logs -f"
echo ""
