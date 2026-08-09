---
description: Morning engine — read data, compute metrics, pick top 3 actions, research one backlog item, advance curriculum, regenerate the dashboard
---

Run the daily engine for gift-ops. Execute these steps **in this exact order**. Work only inside gift-ops/.

## Algorithm

**(a) Read state.** Read every file in `data/` (orders.csv, expenses.csv, listings.csv, experiments.csv), `state/learnings.md`, `state/backlog.md`, `curriculum.md`, and `CLAUDE.md` (for phase and gate context).

**(b) Compute metrics — CSVs are the only source. Never estimate.**
- Budget: spent = sum of expenses.csv amounts; remaining = $600 − spent.
- Yesterday: orders, revenue, contribution, expenses, listing views/favorites — filtered to yesterday's date from the CSVs. If a CSV has no matching rows, that metric is "no data logged".
- Days to next gate: next gate date (docs/gates.md) minus today's date.
- Gate progress: count audited listings in experiments.csv, sales in orders.csv, etc., against the current gate's criteria.

**(c) Select today's Top 3 actions.** Priority order: **gate-critical > curriculum > backlog**. An action is gate-critical if the next gate's deadline is at risk on current pace. Each action must include: what, **exact click-by-click execution steps** (assume zero platform knowledge — name the button, the menu, the field), estimated minutes, and why it matters. All external actions (accounts, purchases, publishing, customer contact) are steps for the **operator** to do — never claim they were done.

**(d) Research ONE backlog item.** If web search is available: take the top open item in `state/backlog.md`, answer it in **≤3 queries**, write the findings into the matching `knowledge/` file with source name/URL and today's date, and mark the backlog item answered (append the date; do not delete the question). If web search is unavailable, note "research skipped" in today's dashboard Watchlist and move on.

**(e) Learnings.** Append to `state/learnings.md` **only if new evidence exists** (a logged outcome in the CSVs or a cited research finding from step d). Format: `date | insight | evidence | change adopted`. Never edit or delete existing entries. No new evidence → skip this step silently.

**(f) Advance the curriculum pointer.** In `curriculum.md`: if the current day's lesson checkbox is checked, move the "Current day" pointer to the next unchecked day. If unchecked, leave the pointer and make the lesson one of today's Top 3 (curriculum priority).

**(g) Regenerate `dashboard/index.html` wholesale.** Overwrite the entire file. Requirements: single self-contained HTML file, zero external assets (no CDN links, no web fonts, no images), renders offline, phone-legible (readable at 390px width), dark walnut/gold palette. Sections in this exact order:
1. **Header** — today's date, current phase, days to next gate, budget bar showing $spent / $600.
2. **Yesterday** — the numbers from step (b), or "no data logged".
3. **Today's Top 3** — what, exact steps, minutes, why it matters.
4. **Curriculum Day N** — card for the current lesson.
5. **One Lesson** — the latest entry in state/learnings.md, or if none, an insight from the current curriculum day.
6. **Watchlist** — risks, upcoming deadlines, gate-pace warnings, "research skipped" if applicable.

The dashboard opens in the browser by itself — a `PostToolUse` hook in `.claude/settings.json` watches for writes to `dashboard/index.html`. Do not run `open` yourself.

**(h) Print exactly one line and nothing else after it:**

```
Dashboard updated — open gift-ops/dashboard/index.html
```

## Hard rules
- Metrics only from CSVs. Empty data → "no data logged". Never fabricate numbers, reviews, or progress.
- Append-only: CSV rows and learnings entries are never edited or deleted.
- ≤3 web queries total; researched claims carry source + date.
- Never perform or claim any external action (money, accounts, publishing, customer contact).
