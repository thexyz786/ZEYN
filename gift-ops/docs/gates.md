# Phase Gates

Evidence gates. /gate evaluates them strictly from CSV data. Thresholds and deadlines are frozen — changing them requires an explicit operator instruction and a learnings entry.

## Gate A — Foundation → Shop-ready · deadline 15 Sep 2026
Pass criteria (all required):
1. **Audit:** ≥20 competitor listings audited and logged in data/experiments.csv (via /audit).
2. **Designs:** 12 SKU designs specified across the three tiers (via /design-spec, logged in experiments.csv).
3. **Samples:** 3 POD samples ordered, received, and passing the adab-guardrails QC checklist (logged).
4. **Economics:** unit economics show ≥40% contribution at target prices (docs/unit-economics.md, or real order rows once they exist).

PASS → open the shop and start selling (curriculum days 5–7 flow).
FAIL → fix the failing criterion before opening; the deadline slips, the criteria do not.

## Gate B — Shop live → Fulfillment decision · deadline 31 Oct 2026
Pass criteria:
1. Shop live (published listings in data/listings.csv).
2. **15 sales within 30 days** of going live, OR **≥3% conversion** (sales ÷ views from listings.csv).

PASS → decide the in-house diode laser purchase ($700–1,200; docs/unit-economics.md payback math).
FAIL → **one** niche iteration (new angle: different occasion, product type, or audience slice within the market), re-test; if it fails again, **kill** the venture cleanly.

## Gate C — Traction → Scale · deadline 31 Dec 2026
Pass criteria:
1. **≥$800/month contribution** (orders.csv, last full month).

PASS → scale into Ramadan 2027: campaign assets frozen mid-Jan 2027, everything live **8 Feb 2027**; artisan imports (Premium tier) unlocked.
FAIL → wind down: fulfill outstanding orders, close cleanly, write the post-mortem to state/learnings.md.

## Budget alignment
$600 deployable cap through Gate B; $2,000 absolute ceiling. The $150 promoted-listings test and any laser purchase are explicit operator decisions logged in experiments.csv and expenses.csv.
