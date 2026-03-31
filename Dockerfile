FROM pepperlabs/peppermint:latest

# Patch PM2 ecosystem config to bind Next.js to all interfaces (0.0.0.0)
# so Railway's proxy can reach it via IPv4
RUN if [ -f /app/ecosystem.config.js ]; then \
      sed -i "s/args: 'start'/args: 'start -H 0.0.0.0'/g" /app/ecosystem.config.js; \
    fi

EXPOSE 3000
