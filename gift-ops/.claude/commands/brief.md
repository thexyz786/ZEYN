---
description: On-demand status brief — phase, budget, gate pace, and today's focus in plain text
---

Print a compact status brief for gift-ops, from files only. Work only inside gift-ops/. Do NOT regenerate the dashboard (that's /daily).

Read `CLAUDE.md`, `data/*.csv`, `state/learnings.md`, `state/backlog.md`, `curriculum.md`, `docs/gates.md`. Then print, in plain text:

1. **Phase & gate** — current phase, next gate, days remaining, pass criteria status (each criterion: met / on pace / at risk, computed from CSV rows only).
2. **Budget** — $spent / $600 cap (sum of expenses.csv), remaining.
3. **Numbers** — totals to date: orders, revenue, contribution, listings, audits logged. Empty CSV → "no data logged".
4. **Curriculum** — current day N, lesson title, checked/unchecked.
5. **Focus** — the single most gate-critical open item right now, in one sentence.

Rules: metrics only from CSVs, never estimated. No file writes. No external actions.
