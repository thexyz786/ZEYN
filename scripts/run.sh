#!/usr/bin/env bash
# Run one Araku command headlessly and keep the result. Used by cron; safe to run by hand.
# Usage: scripts/run.sh /daily
set -euo pipefail

# The daily brief is published to this page. It is the same URL every day, so a bookmark
# and the morning auto-open both keep working. Change it only if you republish elsewhere.
ARTIFACT_URL="https://claude.ai/code/artifact/bf3d8aea-f510-4e83-ac43-d00ab8e1f2d5"

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
  echo "claude CLI not found. Run bash setup.sh from $REPO." >&2
  exit 1
fi

# /daily also refreshes the published brief, in place, at the URL above.
PROMPT="$CMD"
if [ "$CMD" = "/daily" ]; then
  PROMPT="$CMD

Then refresh the published brief. Rewrite state/today.html with today's numbers and text,
keeping that file's existing structure, CSS and token names exactly as they are — only the
content changes. Publish it with the Artifact tool, passing url=\"$ARTIFACT_URL\" so it
updates that same page rather than minting a new one, and force:true — the page is
regenerated from data/ every morning by a different session than the one that last
published it, so a version conflict is expected and there is nothing to merge."
fi

mkdir -p logs
LOG="logs/$(date +%Y-%m).log"
{
  echo "=== $(date '+%Y-%m-%d %H:%M') $CMD ==="
  "$CLAUDE_BIN" -p "$PROMPT" --permission-mode acceptEdits
  echo
} >>"$LOG" 2>&1

# Commit locally so the run is durable and your working tree stays clean.
# A failed commit must not fail the run — the brief is already written either way.
if [ -n "$(git status --porcelain -- data state 2>/dev/null)" ]; then
  git add data state
  git commit -q -m "${CMD#/}: automated run $(date '+%Y-%m-%d')" \
    || echo "note: could not commit (set git user.name/user.email)" >>"$LOG"
fi

# Push, so the ledger has an off-machine copy and the scheduled cloud brief reads current
# numbers instead of stale ones. Best-effort: no credentials or no network is not a failure.
# Set ARAKU_NO_PUSH=1 to keep everything strictly on this machine.
if [ "${ARAKU_NO_PUSH:-0}" != "1" ]; then
  git push -q origin HEAD 2>>"$LOG" || echo "note: push skipped or failed" >>"$LOG"
fi

# Open the refreshed brief. Best-effort — cron often has no display, and that is fine.
if [ "$CMD" = "/daily" ]; then
  if command -v open >/dev/null 2>&1; then
    open "$ARTIFACT_URL" 2>/dev/null || true
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$ARTIFACT_URL" 2>/dev/null || true
  fi
fi
