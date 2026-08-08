---
description: Weekly KPI review — sales, conversion, spend vs cap, personalization minutes per order
allowed-tools: Read
---

Read `CLAUDE.md`, `docs/gates.md`, `docs/unit-economics.md`, and all four CSVs in `data/`. Produce the weekly review, computed only from the files:

## KPIs (this week = last 7 days; also show all-time)

1. **Sales:** order count, revenue, and total contribution from `orders.csv`; average contribution % vs the ≥40% requirement.
2. **Conversion:** total sales ÷ total views using the latest snapshot per SKU in `listings.csv`, vs the 3% Gate-B threshold. Name the best and worst converting SKU (need ≥1 snapshot with views; otherwise "no view data yet").
3. **Spend vs cap:** last `running_total` in `expenses.csv` vs the $600 Gate-B cap and $2,000 ceiling; burn this week; weeks of headroom at the current burn rate.
4. **Personalization minutes per order:** average from `orders.csv`, vs the ≤20 target and 30-minute ceiling in `docs/unit-economics.md`.

## Read-out

- **Gate trajectory:** 2–3 sentences — on current data, is the next gate (per CLAUDE.md) on track for its deadline? Cite the specific criterion most at risk.
- **One recommendation:** the single highest-leverage action for the coming week, consistent with the operator's hours in CLAUDE.md and requiring no spend beyond what's already planned in `docs/launch-checklist.md`.
- **Log prompt:** if any experiment in `experiments.csv` has an `action` but no `result`, list it and remind the operator to `/log` the outcome.

Rules: missing data is reported as missing, never estimated. Do not modify any file. Keep the whole output under 30 lines.
