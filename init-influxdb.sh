#!/bin/bash
set -e

# Wait for InfluxDB to be ready
sleep 5

# Create a database
influx -host localhost -execute "CREATE DATABASE mydb"

# Create the admin user (optional if you need more specific roles)
influx -host localhost -execute "CREATE USER admin WITH PASSWORD 'admin123' WITH ALL PRIVILEGES"
