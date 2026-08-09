---
description: Gate verdict — evaluate the next phase gate strictly from CSV data
---

Evaluate the current phase gate for gift-ops. Work only inside gift-ops/. Verdict comes **only** from logged CSV data — never from estimates, impressions, or unlogged claims.

1. **Identify the active gate** from `CLAUDE.md` (current phase) and `docs/gates.md` (criteria and deadlines).

2. **Evaluate each criterion from data:**
   - Gate A: competitor listings audited = experiments.csv rows logged by /audit (count ≥20?); SKU designs = design specs recorded (experiments.csv or listings.csv rows; 12 across 3 tiers?); POD samples passing QC = experiments.csv rows with a QC-pass result (≥3?); contribution margin = average contribution ÷ price from orders.csv, or from documented unit economics if no orders yet (≥40%?).
   - Gate B: shop live (listings.csv has published listings); sales in last 30 days from orders.csv (≥15?) OR conversion = sales ÷ views from listings.csv (≥3%?).
   - Gate C: contribution in the last full month from orders.csv (≥$800?).

3. **Print the verdict table:** one row per criterion — required, actual (with the CSV rows that prove it), PASS/FAIL/NO DATA. Then the overall verdict:
   - **PASS** — every criterion met by logged data. State the unlocked next step from docs/gates.md (e.g. Gate B PASS → laser decision).
   - **FAIL** — any criterion unmet at the deadline. State the prescribed consequence (fix / one niche iteration then kill / wind down).
   - **PENDING** — deadline not yet reached: show days remaining and pace needed per criterion.

4. **Append** the verdict to `data/experiments.csv` as a row: date, hypothesis = "Gate X criteria met", action = "/gate evaluation", result = per-criterion summary, decision = verdict.

Never alter gate thresholds or deadlines — if the operator asks to change them, stop and confirm explicitly, then record the change as a learnings entry. The verdict is a recommendation; the operator decides what happens next.
