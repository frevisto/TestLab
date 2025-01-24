# Use an official InfluxDB image for the database
FROM influxdb:1.8.10 as influxdb
# Add any custom configurations (optional)
# COPY ./influxdb.conf /etc/influxdb/influxdb.conf


# For Grafana, ensure the correct version and settings
FROM grafana/grafana:latest as grafana

# Add Loki image
FROM grafana/loki:2.7.3 as loki

# Add Promtail image
FROM grafana/promtail:2.7.3 as promtail

# For K6, add a custom K6 build if needed
FROM grafana/k6:latest as k6