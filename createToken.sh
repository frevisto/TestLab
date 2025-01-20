#!/bin/bash
set -e

# Wait for InfluxDB to be ready
sleep 5

# Create a token
influx setup --skip-verify --username admin --password admin123 \
  --org my-org --bucket my-bucket --retention 0 --force

# Capture the token and store it in a .env file
TOKEN=$(influx auth list -o my-org --active | awk 'NR==2 {print $2}')
echo "INFLUX_TOKEN=$TOKEN" > /tmp/influx_token.env