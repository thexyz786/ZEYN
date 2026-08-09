#!/usr/bin/env bash
# Run one Araku command headlessly and keep the result. Used by cron; safe to run by hand.
# Usage: scripts/run.sh /daily
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO"

CMD="${1:?usage: scripts/run.sh /daily|/review|/gate}"

# cron gives a near-empty PATH, so resolve the binary the way setup.sh recorded it.
[ -f scripts/env.local ] && . scripts/env.local
CLAUDE_BIN="${CLAUDE_BIN:-$(command -v claude || true)}"
if [ -z "$CLAUDE_BIN" ]; then
  for p in "$HOME/.local/bin/claude" "$HOME/.claude/local/claude" \
           /opt/homebrew/bin/claude /usr/local/bin/claude; do
    [ -x "$p" ] && CLAUDE_BIN="$p" && break
  done
fi
if [ -z "$CLAUDE_BIN" ]; then
  echo "claude CLI not found. Run ./setup.sh from $REPO." >&2
  exit 1
fi

mkdir -p logs
LOG="logs/$(date +%Y-%m).log"
{
  echo "=== $(date '+%Y-%m-%d %H:%M') $CMD ==="
  "$CLAUDE_BIN" -p "$CMD" --permission-mode acceptEdits
  echo
} >>"$LOG" 2>&1

# Commit locally so the run is durable and your working tree stays clean.
# Never pushes — nothing leaves this machine.
# A failed commit must not fail the run — the brief is already written either way.
if [ -n "$(git status --porcelain -- data state 2>/dev/null)" ]; then
  git add data state
  git commit -q -m "${CMD#/}: automated run $(date '+%Y-%m-%d')" \
    || echo "note: could not commit (set git user.name/user.email)" >>"$LOG"
fi
