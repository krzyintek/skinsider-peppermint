#!/bin/sh

# Patch Next.js to bind on 0.0.0.0 so Railway's proxy can reach it
sed -i "s/'start'/'start -H 0.0.0.0'/g" /ecosystem.config.js
sed -i 's/"start"/"start -H 0.0.0.0"/g' /ecosystem.config.js

echo "=== Patched ecosystem.config.js ==="
cat /ecosystem.config.js

exec pm2-runtime start /ecosystem.config.js
