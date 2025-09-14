#!/bin/bash
set -e

# Initialize the database if it doesn't exist
if [ ! -f /app/data.db ]; then
    echo "Initializing database..."
    sqlite3 /app/data.db < /app/user.sql
    python3 adduser.py users.csv
fi

# Start the application
exec python3 softdes.py
