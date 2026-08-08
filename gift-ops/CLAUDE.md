# gift-ops — Venture Constitution

This file cold-starts any session. Read it first, then read the CSVs in `data/` before answering anything about the state of the business. The data files are the source of truth — never answer from memory.

## Thesis

We sell personalized Islamic and Arabic-script occasion art and gifts — custom name calligraphy prints, Eid/Ramadan pieces, wedding and nikah gifts — to the general US Muslim and South Asian market. Every listing is Etsy-first and fulfilled by US print-on-demand (Printful or Printify) with zero inventory. Our differentiator is that the operator reads and writes Arabic and Urdu, so every design ships accuracy-verified — no reversed letters, broken ligatures, or mistranslations that plague competitors.

## Current Phase

**Phase: Pre-Gate A (validation).** Next gate: **Gate A — 15 Sep 2026** (see `docs/gates.md`).

Operator availability: ~5 hrs/week until 15 Sep 2026 (a separate offline sprint has priority), ~10–15 hrs/week after. Operator is in India until ~Oct 2026, then Los Angeles.

Update this section only when a gate is passed or the plan formally changes.

## Hard Exclusion

**No Dawoodi Bohra community channels, networks, or contacts** may be used for marketing, sales, or distribution. This is absolute and applies to every plan, draft, and recommendation.

## Decision Rights

Claude acts **autonomously** on:
- Reading data, computing KPIs, drafting listings, design specs, copy, and checklists
- Appending rows to `data/*.csv` when the operator reports a fact via `/log`
- Recommending PASS/FAIL at gates and proposing next actions

Claude must **ask first** (and never execute) for:
- Any money movement or new expense, however small
- Account creation, listing publication, or any external posting
- Customer or supplier contact of any kind
- Changing gate thresholds, budget caps, or this constitution
- Deleting or editing any existing file or CSV row

All external actions are human-only. Commands produce drafts and checklists; the operator executes.

## Budget Guardrails

- **$600 hard cap** on deployable spend through Gate B.
- **$2,000 absolute ceiling** for the venture, ever.
- Every expense is logged in `data/expenses.csv` with a running total before it is considered spent.
- Budget remaining = cap − last `running_total` in `expenses.csv`. If a proposed expense would breach a cap, flag it and stop.

## Weekly Cadence

1. Daily (when working): `/brief` — 5-line status from the CSVs.
2. As things happen: `/log` — append every sale, expense, listing stat, and experiment.
3. Weekly (pick a fixed day): `/review` — KPIs: sales, conversion, spend vs cap, personalization minutes per order.
4. At each gate date (or early if data is decisive): `/gate` — PASS/FAIL from data.

## Phase Gates

| Gate | Deadline | Criteria (all must hold) | On PASS | On FAIL |
|------|----------|--------------------------|---------|---------|
| A | 15 Sep 2026 | 3 POD samples pass quality inspection; 12 listings drafted; economics confirm ≥40% contribution | Open shop, go to Gate B | Fix or kill before spending more |
| B | 15 Oct 2026 | Shop live; 15 sales in 30 days OR ≥3% listing conversion | Scale listings, go to Gate C | One niche iteration permitted, then kill |
| C | 31 Dec 2026 | Contribution ≥ $800/month | Scale into Ramadan (Feb–Mar 2027) | Wind down |

Full criteria and evaluation rules: `docs/gates.md`.

## Data Rules

- `data/*.csv` are **append-only**. Never edit or delete an existing row. Corrections are new rows.
- Exact headers (do not change):
  - `orders.csv`: `date,order_id,sku,price,pod_cost,fees,contribution,personalization_minutes`
  - `expenses.csv`: `date,item,amount,category,running_total`
  - `listings.csv`: `date,sku,title,views,favorites,sales`
  - `experiments.csv`: `date,hypothesis,action,result,decision`
- Dates are `YYYY-MM-DD`. Money is USD, plain numbers (no `$` inside CSV fields).
- `listings.csv` rows are periodic snapshots per SKU (cumulative views/favorites/sales at that date), not deltas.

## Key Documents

- `docs/unit-economics.md` — worked pricing model; `/listing` prices from it
- `docs/gates.md` — gate criteria and evaluation rules; `/gate` evaluates from it
- `docs/launch-checklist.md` — ordered human-only launch tasks
- `docs/sku-shortlist.md` — the 12 launch SKUs
