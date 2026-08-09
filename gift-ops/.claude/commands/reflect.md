---
description: Evening reflection — 3 questions, append answers to learnings, seed tomorrow's actions
---

Run the evening reflection for gift-ops. Work only inside gift-ops/.

1. Ask the operator these 3 questions, one at a time, and wait for answers:
   1. **What happened today?** (actions taken, anything logged or shipped)
   2. **What worked, and what failed?**
   3. **What should we try tomorrow?**

2. **Append** the answers to `state/learnings.md` in the ledger format, one row per distinct insight:
   `date | insight | evidence | change adopted`
   - Evidence is what the operator reported or what the CSVs show — never invented.
   - Append-only: never edit or delete existing entries.

3. If the operator reported completing today's curriculum lesson, check its checkbox in `curriculum.md` (leave the "Current day" pointer for /daily to advance).

4. **Seed tomorrow's actions:** add a short "Seeded for tomorrow" note at the bottom of `state/backlog.md` (under a `## Tomorrow seeds` heading, replacing yesterday's seeds) listing 1–3 candidate actions drawn from the answers. /daily will consider these when picking the Top 3.

5. If the operator mentioned any spend, remind them to log it via `/log` — do not write expenses.csv rows yourself unless they give you the exact figures to append.

Close with one short line confirming what was appended and seeded. Never claim any external action was performed.
