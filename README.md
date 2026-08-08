# Araku Ops

Operating system for the six-week sprint, 7 Aug – 15 Sep 2026. Runs inside Claude Code.

## Setup, once
1. Unzip anywhere, e.g. `~/araku-ops`
2. `cd araku-ops && claude`
3. Type `/daily`

## Rhythm
`/daily` each morning · `/log` after every sale, expense, or supplier contact (from stall notes or WhatsApp screenshots, same evening) · `/review` each Sunday · `/gate` on 14–15 Sep.

Everything Claude may and may not do is in `CLAUDE.md`, which loads automatically every session. The plan of record is `plan/sprint.md`. Data lives in append-only CSVs under `data/`; the `stranger` column in `sales.csv` is the experiment.

Optional: schedule the morning brief with Claude Code's non-interactive mode (`claude -p "/daily"` from this directory via cron or Task Scheduler) — verify it on your machine first. Everything else stays human-triggered by design.

On 15 September this repo, unchanged, is the handover pack for your sister.
