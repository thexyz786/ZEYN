# Phase Gates

`/gate` evaluates the current gate (named in CLAUDE.md → Current Phase) against these criteria using only `data/*.csv` and this file. Output is PASS/FAIL per criterion plus a recommendation. Changing any threshold here requires explicit operator approval — never adjust to make a gate pass.

## Gate A — Validation (deadline 15 Sep 2026)

All three must hold:

1. **3 POD samples pass quality inspection.** Evidence: `experiments.csv` rows recording each sample ordered and its inspection result (print sharpness, Arabic/Urdu rendering fidelity, color, frame/packaging). 3 rows with a passing `result` required.
2. **12 listings drafted.** Evidence: 12 distinct SKUs in `listings.csv` (drafted status counts; `views` may be 0) or 12 completed `/listing` drafts recorded in `experiments.csv`.
3. **Economics confirm ≥40% contribution.** Evidence: real sample-order costs logged in `expenses.csv` reconcile with `docs/unit-economics.md` — actual POD cost at target prices still yields ≥40% contribution on the pricing-rule table.

- **PASS →** update CLAUDE.md phase to Pre-Gate B; execute shop-opening steps of `docs/launch-checklist.md`.
- **FAIL →** identify the failing criterion; fix it only if fixable without new spend beyond the $600 cap; otherwise recommend kill before further spend.

## Gate B — Traction (deadline 15 Oct 2026)

1. **Shop live.** Evidence: `experiments.csv` row recording shop launch date; listings in `listings.csv` with nonzero views.
2. **Demand:** within the first 30 days live, **15 sales** (count rows in `orders.csv`) **OR ≥3% listing conversion** (total sales ÷ total views from the latest snapshot per SKU in `listings.csv`).

- **PASS →** update phase to Pre-Gate C; scale listings and double down on converting SKUs.
- **FAIL →** exactly **one niche iteration is permitted** (e.g., narrow to wedding/nikah gifts only, or to one calligraphy style): log it as a row in `experiments.csv`, re-run the 30-day demand test if calendar allows. A second failure = **kill**. No third iteration under any argument.

Budget rule at Gate B: cumulative `running_total` in `expenses.csv` must be ≤ $600. If the cap is hit before the demand test resolves, the test resolves with whatever data exists — no cap increase to buy more time.

## Gate C — Viability (deadline 31 Dec 2026)

1. **Contribution ≥ $800/month.** Evidence: sum of `contribution` in `orders.csv` for the most recent full calendar month ≥ 800. (Per `docs/unit-economics.md`, ≈ 38 orders/month at baseline.)

- **PASS →** scale into Ramadan season (Feb–Mar 2027): expand Ramadan/Eid SKUs, raise ad spend within the $2,000 absolute ceiling, plan the LA-based workflow.
- **FAIL →** **wind down**: stop paid spend immediately, let listings expire, fulfill outstanding orders, close out expenses log with a final row.

## Evaluation Rules

- A gate may be evaluated early if the data is already decisive (e.g., 15 sales before day 30 → Gate B demand PASSES early).
- Missing evidence = FAIL for that criterion, with a note on exactly which rows are missing. Never infer or assume unlogged facts.
- Every `/gate` run's verdict should be logged by the operator as a row in `experiments.csv` (`hypothesis` = "Gate X evaluation").
