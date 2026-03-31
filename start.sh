#!/bin/sh

# Patch Next.js to bind on 0.0.0.0 so Railway's proxy can reach it
# Find the ecosystem config and add -H 0.0.0.0 to the next start args
for f in /app/ecosystem.config.js /app/apps/client/ecosystem.config.js; do
  if [ -f "$f" ]; then
    echo "Patching $f"
    sed -i "s/'start'/'start -H 0.0.0.0'/g" "$f"
    sed -i 's/"start"/"start -H 0.0.0.0"/g' "$f"
  fi
done

# Show what we ended up with
find /app -name "ecosystem.config.js" 2>/dev/null | head -5

# Start PM2 (original entrypoint)
exec pm2-runtime start /app/ecosystem.config.js
