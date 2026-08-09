---
description: Weekly review — 7-day numbers, experiment verdicts, next week's focus
---

Run the weekly review for gift-ops (normally Sunday). Work only inside gift-ops/.

1. **Read** all `data/*.csv`, `state/learnings.md`, `state/backlog.md`, `curriculum.md`, `docs/gates.md`.

2. **Compute the week** (last 7 days, CSV rows only — never estimate; empty → "no data logged"):
   - Orders: count, revenue, contribution, average personalization minutes.
   - Expenses: week total, cumulative, budget remaining vs $600.
   - Listings: views, favorites, sales; conversion (sales ÷ views) if views > 0.
   - Experiments: rows added this week and their results.
   - Curriculum: days completed this week vs 7.

3. **Experiment verdicts:** for each experiments.csv row with a result but no decision, propose a decision (adopt / iterate / kill) grounded in the logged result, and ask the operator to confirm before appending an updated decision row (append a new row; never edit the old one).

4. **Gate pace check:** for each criterion of the next gate, state current count vs required, and whether the remaining days suffice at this week's pace.

5. **Next week's focus:** propose the top 3 priorities (gate-critical > curriculum > backlog) and append them under `## Tomorrow seeds` in `state/backlog.md` (replacing prior seeds).

6. If the week produced new evidence, append distilled insights to `state/learnings.md` (`date | insight | evidence | change adopted`). Append-only.

Print the review as short plain-text sections in the order above. No external actions; no dashboard regeneration.
