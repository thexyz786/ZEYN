# gift-ops — Constitution

## Thesis
Personalized wooden and engraved gifts for American Muslim households (~1.5–2M households, $170.8B annual consumer spend — DinarStandard 2025), sold on Etsy with Printify print-on-demand fulfillment, targeting the premium third of an income barbell. The operator's edge is accuracy-verified Arabic/Urdu script and strict adab compliance — a trust signal competitors demonstrably lack. Growth is staged behind evidence gates: POD first, in-house laser only after Gate B, Indian artisan batches only after Gate C.

## Honesty Clause
This system improves its knowledge and plans from logged outcomes and cited research. It does not sell. The operator sells.

## Current Phase
**Phase: Foundation (pre-Gate A).** Next gate: **Gate A — 15 Sep 2026** (see docs/gates.md).
Operator is in India until ~Oct 2026, then Los Angeles. Capacity: ~5 hrs/week until 15 Sep 2026 (a separate sprint has priority), 10–15 hrs/week after.

To cold-start a session: read this file, then `state/learnings.md`, `state/backlog.md`, `curriculum.md`, and `data/expenses.csv` (budget remaining = $600 − sum of amounts).

## Decision Rights
- **Operator only (human-only, always):** all money movement, account creation, listing publication, customer contact, sample orders, any purchase. Commands produce drafts, steps, and checklists — they never execute externally and never claim an external action was performed.
- **System (Claude):** compute metrics from CSVs, research with citations, draft listings/specs, plan daily actions, regenerate the dashboard, maintain the curriculum.
- **Frozen without explicit operator instruction:** gate thresholds, budget caps, adab guardrails, learnings history.

## Budget Guardrails
- **$600 cap** on deployable spend through Gate B. **$2,000 absolute ceiling.**
- Every expense is logged in `data/expenses.csv` before or immediately after it happens. No unlogged spend.
- No new paid service, subscription, or tool without an explicit operator decision logged in `data/experiments.csv`.

## Weekly Cadence
- **Daily (morning, ~2 min read):** run `/daily`, read `dashboard/index.html`, execute Today's Top 3.
- **Daily (evening, ~5 min):** run `/reflect`.
- **Weekly (Sunday):** run `/review` — week's numbers, experiment verdicts, next week's focus.
- **At each gate date:** run `/gate` — verdict from CSV data only.

## Phase Gates
| Gate | Deadline | Pass criteria | On PASS | On FAIL |
|---|---|---|---|---|
| A | 15 Sep 2026 | ≥20 competitor listings audited (logged), 12 SKU designs across 3 tiers, 3 POD samples pass QC, unit economics ≥40% contribution | Open shop, start selling | Fix the failing item before opening |
| B | 31 Oct 2026 | Shop live; 15 sales in 30 days OR ≥3% conversion | Decide diode laser purchase ($700–1,200) | One niche iteration, then kill |
| C | 31 Dec 2026 | ≥$800/mo contribution | Scale into Ramadan: assets frozen mid-Jan, live 8 Feb 2027; artisan imports unlocked | Wind down |

Full detail: `docs/gates.md`.

## The Adab Rule
Ayat of the Qur'an and the Names of Allah are **never** placed on floor items, cutting boards, coasters, or any item routinely soiled or discarded. Utility items carry names, duas, and geometry only. Ayat are reserved for wall pieces. This policy is stated on every listing and checked per order (`docs/adab-guardrails.md`). This rule is non-negotiable and overrides any sales consideration.

## Hard Exclusions
- No Dawoodi Bohra community channels, networks, or contacts for marketing, sales, or distribution.
- Metrics come only from `data/*.csv` — never estimated, never fabricated. Empty data reads "no data logged".
- `data/*.csv` rows and `state/learnings.md` entries are append-only: never edited, never deleted.
