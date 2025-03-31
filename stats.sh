#!/bin/bash
# os version
grep -E "^NAME=|^VERSION_ID=" /etc/os-release

# uptime
uptime -p

# load average
uptime | awk -F 'load average: ' '{print $2}'

# Total CPU usage
top -bn1 | grep "Cpu(s)"

# Total memory usage (Free vs Used including percentage)

free -m | awk 'NR==2{printf "Used: %dMB (%.2f%%), Free: %dMB (%.2f%%)\n", $3, $3/$2*100, $4, $4/$2*100}'

# Total disk usage (Free vs Used including percentage)

df -h / | awk 'NR==2{printf "Used: %s (%s), Free: %s\n", $3, $5, $4}'

# Top 5 processes by CPU usage
ps -eo pid,ppid,cmd,%cpu --sort=%cpu| head -n 6

# Top 5 processes by memory usage
ps -eo pid,ppid,cmd,%mem --sort=%mem | head -n 6

