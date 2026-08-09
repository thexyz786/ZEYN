# Araku Ops

Operating system for the six-week sprint, 7 Aug – 15 Sep 2026. Runs inside Claude Code, on your own machine.

## Setup, once
```
git clone -b claude/cloud-to-local-migration-lh8z36 https://github.com/thexyz786/ZEYN ~/araku-ops
cd ~/araku-ops && ./setup.sh
```
Then `claude`, and type `/daily`. See `LOCAL.md` for what runs on its own and how to change it.

## Rhythm
`/daily` each morning · `/log` after every sale, expense, or supplier contact (from stall notes or WhatsApp screenshots, same evening) · `/review` each Sunday · `/gate` on 14–15 Sep.

Everything Claude may and may not do is in `CLAUDE.md`, which loads automatically every session. The plan of record is `plan/sprint.md`. Data lives in append-only CSVs under `data/`; the `stranger` column in `sales.csv` is the experiment.

`setup.sh` schedules the morning brief for 07:00 and the Sunday retro for 18:00 via cron, running Claude Code non-interactively from this directory and committing the result locally. `/log` and `/gate` stay human-triggered by design.

On 15 September this repo, unchanged, is the handover pack for your sister.
