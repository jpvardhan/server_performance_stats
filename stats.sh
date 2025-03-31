#!/bin/bash
# os version

grep -E "^NAME=|^VERSION_ID=" /etc/os-release
echo   # Blank line

# uptime
echo "system is up from"
uptime -p
echo   # Blank line

# load average
echo "Load average from last 1 min 5min 15min"
uptime | awk -F 'load average: ' '{print $2}'
echo   # Blank line

# Total CPU usage
echo "CPU usage is"
top -bn1 | grep "Cpu(s)"
echo   # Blank line

# Total memory usage (Free vs Used including percentage)
echo "Memory usage is"
free -m | awk 'NR==2{printf "Used: %dMB (%.2f%%), Free: %dMB (%.2f%%)\n", $3, $3/$2*100, $4, $4/$2*100}'
echo   # Blank line

# Total disk usage (Free vs Used including percentage)
echo "Disk usage is"
df -h / | awk 'NR==2{printf "Used: %s (%s), Free: %s\n", $3, $5, $4}'
echo   # Blank line

# Top 5 processes by CPU usage
echo "Top 5 process per CPU usage"
ps -eo pid,ppid,cmd,%cpu --sort=%cpu| head -n 6
echo   # Blank line

# Top 5 processes by memory usage
echo "Top 5 process per Memory Usage"
ps -eo pid,ppid,cmd,%mem --sort=%mem | head -n 6
echo   # Blank line
