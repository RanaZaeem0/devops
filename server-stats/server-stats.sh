#!/bin/bash

echo "========================================="
echo " SERVER PERFORMANCE STATS"
echo "========================================="
echo

# CPU Usage

echo "CPU Usage:"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
printf "Total CPU Usage: %.2f%%\n" "$cpu_usage"
echo

# Memory Usage

echo "Memory Usage:"
free -h | awk '
NR==2 {
total=$2;
    used=$3;
    free=$4;
}
END {
    printf "Total: %s\nUsed: %s\nFree: %s\n", total, used, free
}'
mem_percent=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 \* 100}')
echo "Memory Usage: ${mem_percent}%"
echo

# Disk Usage

echo "Disk Usage:"
df -h / | awk '
NR==2 {
print "Total: " $2
print "Used : " $3
print "Free : " $4
print "Usage: " $5
}'
echo

# Top 5 CPU Processes

echo "Top 5 Processes by CPU Usage:"
ps -eo pid,user,comm,%cpu --sort=-%cpu | head -n 6
echo

# Top 5 Memory Processes

echo "Top 5 Processes by Memory Usage:"
ps -eo pid,user,comm,%mem --sort=-%mem | head -n 6
echo

# -------------------------

# Stretch Goals

# -------------------------

echo "OS Version:"
grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'
echo

echo "System Uptime:"
uptime -p
echo

echo "Load Average:"
uptime | awk -F'load average:' '{print $2}'
echo

echo "Logged In Users:"
who
echo

echo "Failed Login Attempts:"
lastb 2>/dev/null | head -5
