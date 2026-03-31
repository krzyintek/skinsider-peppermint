#!/bin/sh

# Patch ecosystem.config.js to add HOSTNAME: "0.0.0.0" to the client env
# so Next.js binds on all interfaces, not just IPv6
node -e "
const fs = require('fs');
let content = fs.readFileSync('/ecosystem.config.js', 'utf8');
// Add HOSTNAME to the client env block (the one with PORT: 3000)
content = content.replace(
  'PORT: 3000,',
  'PORT: 3000,\n        HOSTNAME: \"0.0.0.0\",'
);
fs.writeFileSync('/ecosystem.config.js', content);
console.log('Patched ecosystem.config.js');
"

echo "=== Final ecosystem.config.js ==="
cat /ecosystem.config.js

exec pm2-runtime start /ecosystem.config.js
