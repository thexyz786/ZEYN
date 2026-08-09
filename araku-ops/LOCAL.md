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

## The current layout

The repository now holds two ventures side by side — `araku-ops/` (this one) and `gift-ops/`.
Both define `/daily`, `/log`, `/review` and `/gate`, so **neither sits at the repository root**;
the root holds only a signpost `CLAUDE.md`. Open Claude Code from `araku-ops/` and the four
skills load exactly as before. Open it from the root and none of them exist — the same symptom
described above, from a different cause.

Clone to `~/zeyn`, not `~/araku-ops`, or the local path doubles to `~/araku-ops/araku-ops/`.

## Setup, once

```
git clone https://github.com/thexyz786/ZEYN ~/zeyn
cd ~/zeyn/araku-ops && bash setup.sh
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
cd ~/zeyn/araku-ops && claude
/daily
/log sold 2 bags at the stall to a stranger, 400 each
/review
/gate
```

## What runs on its own

| When | What | Where the output goes |
|---|---|---|
| 07:00 every day | `/daily` | `state/today.md`, appended to `logs/` |
| 18:00 every Sunday | `/review` | `state/learnings.md`, `state/tasks.md`, `logs/` |

Each run commits `data/` and `state/` to your local git history so the day is durable and your
working tree stays clean. It never pushes — nothing leaves the machine unless you push it.

Change the times by editing your crontab (`crontab -e`); remove the schedule entirely with:

```
crontab -l | grep -v '# araku-ops' | crontab -
```

`/log` and `/gate` stay human-triggered. `/log` needs facts only you have, and a gate verdict
that nobody reads is not a verdict.

**Check the first scheduled run landed.** `/daily` and `/gate` were both verified running
headlessly through `scripts/run.sh`, including from a fresh clone, but the cron *installation*
could not be tested where this migration was prepared — that machine had no `crontab`. After
the first 07:00, confirm `logs/` has an entry and `state/today.md` is dated today. If not, run
`crontab -l` to check the two entries are there.

**macOS:** cron may need Full Disk Access for `/usr/sbin/cron` under System Settings →
Privacy & Security. This is the most likely reason for a silent no-op on a Mac.

**Windows:** `setup.sh` needs Git Bash. Install the schedule with:

```
schtasks /create /tn "araku-daily" /tr "\"C:\Program Files\Git\bin\bash.exe\" -lc \"cd ~/zeyn/araku-ops && ./scripts/run.sh /daily\"" /sc daily /st 07:00
```

## Permissions

`.claude/settings.json` enforces the constitution at the tool layer, so the rules hold even
in an unattended run rather than depending on Claude choosing to follow them:

- **Allowed** — reading and writing files in this repository, local git commits.
- **Ask first** — `WebFetch`, `WebSearch`, `git push`, `git remote`. This is the
  "Stop and ask before … any network action beyond reading" and "touching git remotes" rules.
  The plan needs you to verify the FSSAI fee and supplier prices, and to back this repository
  up, so none of these are forbidden — each one just surfaces to you before it happens. In an
  unattended cron run there is nobody to ask, so they are skipped rather than guessed at.
- **Blocked** — `curl`, `wget`, `rm`, and any installer. This is the "NEVER send, post, or
  transmit anything to anyone" rule made mechanical: a drafted WhatsApp or supplier message
  has no route off this machine, and rows cannot be deleted from `data/` via the shell.

## Claude in Chrome

Claude in Chrome runs against claude.ai in your browser, not against this repository — it
cannot read `data/` or run `/daily`. It is useful for the research half of the sprint that
`CLAUDE.md` forbids Claude Code from guessing at: IndiaMart trader listings, the FSSAI portal,
competitor shelf prices in Vizag. Bring what you find back with `/log`, which is what writes
it into the ledger. Anything not in `data/` does not exist to `/gate`.
