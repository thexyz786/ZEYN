---
description: 5-line daily status from the CSVs
allowed-tools: Read
---

Read `CLAUDE.md` (current phase, gates, budget caps) and all four files in `data/` (`orders.csv`, `expenses.csv`, `listings.csv`, `experiments.csv`). Then output **exactly 5 lines**, nothing else:

1. **Phase & gate:** current phase and days remaining until the next gate deadline (today's date vs the deadline in CLAUDE.md).
2. **Budget:** spend to date (last `running_total` in `expenses.csv`, or $0 if only the header exists) vs the $600 Gate-B cap, and remaining.
3. **Sales:** total orders and total contribution from `orders.csv` (all time), plus count in the last 7 days.
4. **Listings:** distinct SKUs in `listings.csv`, and overall conversion (total sales ÷ total views from the latest snapshot per SKU; "n/a" if no views).
5. **Next action:** the first unchecked item in `docs/launch-checklist.md`, or if the checklist is done, the most urgent gap against the next gate's criteria in `docs/gates.md`.

Rules: compute only from the files — never from memory or assumption. If a CSV has only its header row, say so plainly (e.g., "no orders logged yet"). Do not modify any file.
