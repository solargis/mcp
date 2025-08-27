#!/bin/sh

SERVER="documentation-mcp-server"

# Check if the server process is running
if pgrep -P 0 -a -l -x -f "/app/.venv/bin/python /app/.venv/bin/solargis.$SERVER" > /dev/null; then
  echo -n "$SERVER is running";
  exit 0;
fi;

# Unhealthy
exit 1;
