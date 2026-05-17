#!/bin/sh
# Stub: find the repo root from this script's location and run the real payload.
ROOT=$(git -C "$(dirname "$0")" rev-parse --show-toplevel 2>/dev/null)
exec "$ROOT/payload.sh"
