#!/usr/bin/env bash
# Sepolia Tools — start the local app and open it in your browser.
# Usage:  ./start.sh [port]      (default port 8765)
set -e
PORT="${1:-8765}"
DIR="$(cd "$(dirname "$0")" && pwd)"
URL="http://localhost:${PORT}/"

echo "==============================================="
echo " Sepolia Tools"
echo " Serving: $DIR"
echo " URL:     $URL"
echo " Stop:    Ctrl+C"
echo "==============================================="

# Open the browser shortly after the server comes up (macOS=open, Linux=xdg-open).
( sleep 1
  if command -v open >/dev/null 2>&1; then open "$URL"
  elif command -v xdg-open >/dev/null 2>&1; then xdg-open "$URL"
  fi ) >/dev/null 2>&1 &

cd "$DIR"
exec python3 -m http.server "$PORT"
