---
description: Evaluate the current phase gate from data — PASS/FAIL per criterion + recommendation
allowed-tools: Read
---

1. Read `CLAUDE.md` → Current Phase to determine which gate applies (A, B, or C).
2. Read `docs/gates.md` for that gate's criteria and evaluation rules, and all four CSVs in `data/` for evidence.
3. For **each criterion**, output one line: **PASS** or **FAIL**, the measured value vs the threshold, and the exact evidence rows used (or the missing evidence). Per `docs/gates.md`: missing evidence = FAIL for that criterion — never infer unlogged facts.
4. Output the **overall verdict** (PASS only if every criterion passes) and days remaining to the deadline.
5. Output a **recommendation** (≤5 lines): on PASS, the "On PASS" path from `docs/gates.md` including the CLAUDE.md phase update the operator should approve; on FAIL, whether the gap is closable before the deadline without breaching the $600/$2,000 budget caps — and if not, say "kill" or "wind down" plainly per the gate's FAIL path. For Gate B, state whether the single permitted niche iteration is available or already used (check `experiments.csv`).

Rules:
- Never adjust a threshold, deadline, or criterion to make a gate pass — thresholds change only by explicit operator edit of `docs/gates.md`.
- Early evaluation is allowed when data is already decisive (e.g., 15 sales logged before day 30).
- This command reads and reports only. It does not update CLAUDE.md, append CSV rows, or execute anything — remind the operator to `/log` the verdict as an `experiments.csv` row.
