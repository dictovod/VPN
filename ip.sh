#!/bin/bash
SEC=${1:-5}
while true; do
    IP=$(curl -s --max-time 3 https://api.ipify.org 2>/dev/null || echo "unavailable")
    echo "$(date '+%Y-%m-%d %H:%M:%S') IP: $IP"
    sleep "$SEC"
done
