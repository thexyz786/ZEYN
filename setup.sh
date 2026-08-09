#!/usr/bin/env bash
# One-time local setup. Run once, from this directory:  bash setup.sh
# Pass --no-schedule to skip installing the cron entries.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO"

echo "Araku Ops — local setup"
echo "Repository: $REPO"
echo

# 1. Claude Code must be installed.
CLAUDE_BIN="$(command -v claude || true)"
if [ -z "$CLAUDE_BIN" ]; then
  for p in "$HOME/.local/bin/claude" "$HOME/.claude/local/claude" \
           /opt/homebrew/bin/claude /usr/local/bin/claude; do
    [ -x "$p" ] && CLAUDE_BIN="$p" && break
  done
fi
if [ -z "$CLAUDE_BIN" ]; then
  echo "Claude Code is not installed. Install it, then re-run bash setup.sh:"
  echo "  curl -fsSL https://claude.ai/install.sh | bash"
  exit 1
fi
echo "  claude          $CLAUDE_BIN"

# 2. Record the absolute path so cron can find it later.
printf 'CLAUDE_BIN="%s"\n' "$CLAUDE_BIN" >scripts/env.local

# Restore the executable bit. These files were published through the GitHub API, which
# stores everything as non-executable, so a fresh clone cannot run ./setup.sh directly.
# Record it in git too, so the repository self-heals and the fix is not re-applied forever.
chmod +x scripts/run.sh setup.sh
if git update-index --chmod=+x setup.sh scripts/run.sh 2>/dev/null &&
   [ -n "$(git diff --cached --name-only)" ]; then
  git commit -q -m "Restore executable bit on setup.sh and scripts/run.sh" 2>/dev/null \
    && echo "  exec bit      restored and committed"
fi

# 3. Sanity-check the layout the four commands depend on.
missing=0
for f in CLAUDE.md plan/sprint.md state/tasks.md data/sales.csv \
         .claude/skills/daily/SKILL.md .claude/skills/log/SKILL.md \
         .claude/skills/review/SKILL.md .claude/skills/gate/SKILL.md; do
  [ -f "$f" ] || { echo "  MISSING       $f"; missing=1; }
done
[ "$missing" -eq 0 ] && echo "  layout        ok (4 commands, 4 data files, plan, state)"

# 4. A git identity, so the unattended commits in run.sh succeed on a fresh machine.
if [ -z "$(git config user.email || true)" ]; then
  git config user.email "araku-ops@localhost"
  git config user.name "Araku Ops"
  echo "  git identity  set for this repository only"
fi

# 5. Trust this workspace.
# Until a workspace is trusted, Claude Code ignores the permissions.allow list in
# .claude/settings.json — a scheduled run would then stall on prompts nobody can answer.
# Interactively that is one dialog; here we record the same answer up front.
TRUST_SCRIPT='
const fs = require("fs"), os = require("os"), path = require("path");
const f = path.join(os.homedir(), ".claude.json");
let j = {};
try { j = JSON.parse(fs.readFileSync(f, "utf8")); } catch (e) {}
j.projects = j.projects || {};
j.projects[process.argv[1]] = j.projects[process.argv[1]] || {};
if (j.projects[process.argv[1]].hasTrustDialogAccepted) { console.log("already"); process.exit(0); }
j.projects[process.argv[1]].hasTrustDialogAccepted = true;
fs.writeFileSync(f, JSON.stringify(j, null, 2));
console.log("set");
'
if command -v node >/dev/null 2>&1; then
  case "$(node -e "$TRUST_SCRIPT" "$REPO" 2>/dev/null)" in
    set)     echo "  trust         granted for this directory (~/.claude.json)" ;;
    already) echo "  trust         already granted" ;;
    *)       echo "  trust         COULD NOT SET — run 'claude' here once and accept the dialog" ;;
  esac
else
  echo "  trust         run 'claude' here once and accept the trust dialog"
fi

# 6. Schedule the recurring runs.
if [ "${1:-}" = "--no-schedule" ]; then
  echo "  schedule      skipped (--no-schedule)"
else
  if command -v crontab >/dev/null 2>&1; then
    NEW="$(crontab -l 2>/dev/null | grep -v '# araku-ops' || true)"
    NEW="$NEW
0 7 * * * cd $REPO && ./scripts/run.sh /daily   # araku-ops
0 18 * * 0 cd $REPO && ./scripts/run.sh /review # araku-ops"
    printf '%s\n' "$NEW" | crontab -
    echo "  schedule      /daily 07:00 daily, /review 18:00 Sundays"
    echo "                remove with: crontab -l | grep -v '# araku-ops' | crontab -"
  else
    echo "  schedule      no crontab on this system — see LOCAL.md for Windows"
  fi
fi

echo
echo "Done. Nothing else to configure."
echo "  claude          then type /daily"
echo "  /log sold 2 bags at the stall to a stranger, 400 each"
