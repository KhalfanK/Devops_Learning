#!/bin/bash

# This script monitors system resources and logs the information to a file.

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="system_monitor_$timestamp.log"

echo "System Monitor Log - $timestamp" > "$log_file"
echo "----------------------------------------" >> "$log_file"

echo "CPU Usage:" >> "$log_file"
top -bn2 -d 0.01 | grep "Cpu(s)" | tail -1 | awk '{print 100 - $8 "%"}'>> "$log_file"
echo "----------------------------------------" >> "$log_file"

echo "Memory Usage:" >> "$log_file"
free -h | awk '/^Mem:/ {print "Total: " $2 ", Used: " $3 ", Free: " $4}' >> "$log_file"
echo "----------------------------------------" >> "$log_file"

echo "Disk Usage:" >> "$log_file"
df -h | awk 'NR==2 {print "Total: " $2 ", Used: " $3 ", Free: " $4}' >> "$log_file"
echo "----------------------------------------" >> "$log_file"

echo "Top 5 Processes by Memory Usage:" >> "$log_file"
ps aux --sort=-%mem | tail -n +2 | head -n 6 | awk '{print "Process: " $11 ", PID: " $2 ", Memory Usage: " $4}' >> "$log_file"
echo "----------------------------------------" >> "$log_file"

echo "System monitoring completed. Log saved to $log_file"

cat "$log_file"


