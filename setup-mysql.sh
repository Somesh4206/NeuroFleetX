#!/bin/bash
# NeuroFleetX MySQL Setup & Connection Script

echo "==============================================="
echo "NeuroFleetX - MySQL Database Setup"
echo "==============================================="

# Check if MySQL is running
echo ""
echo "[1] Checking MySQL connection..."
mysql -u root -proot123 -e "SELECT 1" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✓ MySQL is running and credentials work!"
else
    echo "✗ Cannot connect to MySQL with root/root123"
    echo "  Please ensure MySQL is installed and running."
    exit 1
fi

# Create database
echo ""
echo "[2] Creating database 'neurofleetx'..."
mysql -u root -proot123 << EOF
CREATE DATABASE IF NOT EXISTS neurofleetx CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
EOF
echo "✓ Database created/verified"

# List databases
echo ""
echo "[3] Verifying database..."
mysql -u root -proot123 -e "SHOW DATABASES LIKE 'neurofleetx';"

# Show database info
echo ""
echo "[4] Database Info:"
mysql -u root -proot123 -e "SELECT @@version AS 'MySQL Version', DATABASE() AS 'Current DB';" neurofleetx

echo ""
echo "==============================================="
echo "✓ MySQL Setup Complete!"
echo "==============================================="
echo ""
echo "Next steps:"
echo "1. Ensure .env file has: DB_USERNAME=root, DB_PASSWORD=root123"
echo "2. Run backend with: cd neurofleetx-backend && ./mvnw spring-boot:run"
echo ""
