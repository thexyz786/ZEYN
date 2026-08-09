# Running locally

## Why the commands were broken

The repository contained one file: `files.zip`, holding a second zip, holding the project
under a doubled `araku-ops/araku-ops/` path. Claude Code discovers commands by reading
`.claude/skills/*/SKILL.md` **at the repository root**. It found a zip file, so `/daily`,
`/log`, `/review` and `/gate` did not exist in any session — cloud or local.

The cloud container made it worse in a second, separate way: it is reclaimed after a period
of inactivity and re-cloned from git on the next session. Every row `/log` appended to a CSV
and every brief `/daily` wrote to `state/today.md` was discarded unless it had been committed
and pushed first. A ledger that forgets is not a ledger, which is what broke the autonomous
loop the project was built around.

Both are fixed by the same move: the files now sit at the repository root, on your disk.

## Setup, once

```
git clone https://github.com/thexyz786/ZEYN ~/araku-ops
cd ~/araku-ops && bash setup.sh
```

Nothing else to configure. `setup.sh` is idempotent — re-run it any time. It:

1. Locates your `claude` binary and records the absolute path in `scripts/env.local`,
   because cron runs with a near-empty `PATH` and would not otherwise find it.
   It also restores the executable bit on itself and `scripts/run.sh` and commits that,
   because these files were published through the GitHub API, which stores everything
   non-executable. That is why the command above is `bash setup.sh` and not `./setup.sh`
   — after the first run, `./setup.sh` works too.
2. Verifies all eight files the four commands depend on are present.
3. Sets a git identity **for this repository only**, if you have no global one, so the
   unattended commits succeed.
4. Marks this directory trusted in `~/.claude.json` — the one file it touches outside this
   repository. Until a workspace is trusted, Claude Code ignores the `permissions.allow` list
   in `.claude/settings.json`, and a 07:00 run would stall on prompts nobody is awake to
   answer. Interactively this is a single dialog; the script records the same answer up front.
   Skip it by running `claude` here once and accepting the dialog yourself.
5. Installs the two cron entries.

## Daily use

```
cd ~/araku-ops && claude
/daily
/log sold 2 bags at the stall to a stranger, 400 each
/review
/gate
```

## The brief

**https://claude.ai/code/artifact/bf3d8aea-f510-4e83-ac43-d00ab8e1f2d5**

Bookmark it. That URL never changes — every run republishes the same page in place, so the
link in your bookmarks bar and on your phone is always this morning's brief. It is private
until you share it from the page's own share menu.

## What runs on its own

Two layers, deliberately. The local one owns the ledger; the cloud one guarantees the brief
reaches you even when your laptop is shut.

| When | Where | What | Output |
|---|---|---|---|
| 07:00 daily | your machine (cron) | `/daily` | writes `state/today.md`, republishes the brief, opens it in your browser |
| 18:00 Sundays | your machine (cron) | `/review` | rewrites `state/learnings.md` and `state/tasks.md` |
| 07:40 daily | cloud (Routine `Araku daily brief`) | `/daily`, plus `/review` on Sundays and `/gate` on 14–15 Sep | republishes the same page, pushes the brief to your phone and inbox |

Each local run commits `data/` and `state/` to git and pushes. The push is what lets the cloud
Routine read real numbers instead of stale ones — it runs 40 minutes after the local one for
exactly that reason. Set `ARAKU_NO_PUSH=1` to keep everything strictly on this machine; the
cloud brief will then only ever see what you last pushed by hand.

**Provenance is printed on the page.** The cloud Routine can only see rows that reached
GitHub, so its footer states the date of the last commit touching `data/` and says plainly
when anything logged since then is missing. A brief that cannot see your latest sales will
tell you so rather than quietly under-reporting.

Manage the Routine at [claude.ai/settings/routines](https://claude.ai/settings/routines) —
pause it, change the time, or delete it there. The cloud times are stored in UTC (02:10 UTC
is 07:40 IST); if you move to Los Angeles, both the Routine and your local crontab need
resetting.

Change the local times by editing your crontab (`crontab -e`); remove the local schedule
entirely with:

```
crontab -l | grep -v '# araku-ops' | crontab -
```

`/log` stays human-triggered — it needs facts only you have.

**Check the first scheduled run landed.** `/daily` and `/gate` were both verified running
headlessly through `scripts/run.sh`, including from a fresh clone of `main`, and the artifact
republish was verified end to end. The cron *installation* could not be tested where this was
prepared — that machine had no `crontab`. After the first 07:00, confirm `logs/` has an entry
and `state/today.md` is dated today. If not, run `crontab -l` to check the two entries.

**macOS:** cron may need Full Disk Access for `/usr/sbin/cron` under System Settings →
Privacy & Security. This is the most likely reason for a silent no-op on a Mac.

**Windows:** `setup.sh` needs Git Bash. Install the schedule with:

```
schtasks /create /tn "araku-daily" /tr "\"C:\Program Files\Git\bin\bash.exe\" -lc \"cd ~/araku-ops && ./scripts/run.sh /daily\"" /sc daily /st 07:00
```

## Permissions

`.claude/settings.json` enforces the constitution at the tool layer, so the rules hold even
in an unattended run rather than depending on Claude choosing to follow them:

- **Allowed** — reading and writing files in this repository, local git commits, and
  `Artifact`. Publishing the brief needs that last one: without it the 07:00 run stalls on a
  confirmation prompt nobody is awake to answer, and the page silently never updates. It is
  narrow — it publishes the brief to your own private page and nothing else.
- **Ask first** — `WebFetch`, `WebSearch`, `git push`, `git remote`. This is the
  "Stop and ask before … any network action beyond reading" and "touching git remotes" rules.
  The plan needs you to verify the FSSAI fee and supplier prices, and to back this repository
  up, so none of these are forbidden — each one just surfaces to you before it happens. In an
  unattended cron run there is nobody to ask, so they are skipped rather than guessed at.
  The automatic push is done by `scripts/run.sh` itself, not by Claude, so it is not gated by
  this rule — the rule governs what Claude may do, not what a script you scheduled does.
- **Blocked** — `curl`, `wget`, `rm`, and any installer. This is the "NEVER send, post, or
  transmit anything to anyone" rule made mechanical: a drafted WhatsApp or supplier message
  has no route off this machine, and rows cannot be deleted from `data/` via the shell.

## Claude in Chrome

Claude in Chrome runs against claude.ai in your browser, not against this repository — it
cannot read `data/` or run `/daily`. It is useful for the research half of the sprint that
`CLAUDE.md` forbids Claude Code from guessing at: IndiaMart trader listings, the FSSAI portal,
competitor shelf prices in Vizag. Bring what you find back with `/log`, which is what writes
it into the ledger. Anything not in `data/` does not exist to `/gate`.
