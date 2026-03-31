#!/bin/sh

# Find the ecosystem config
echo "=== Searching for ecosystem.config.js ==="
find / -name "ecosystem.config.js" 2>/dev/null

echo "=== /app contents ==="
ls /app 2>/dev/null || echo "no /app"

echo "=== / contents ==="
ls /

# Don't start PM2 yet — just show us the file structure
