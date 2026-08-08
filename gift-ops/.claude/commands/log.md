---
description: Append a sale, expense, listing stat, or experiment to the correct CSV
argument-hint: what happened, in plain words (e.g. "sold GFT-001 for $50, took 25 min" or "spent $23 on a Printful sample")
allowed-tools: Read, Bash(echo:*), Bash(cat:*), Bash(tail:*)
---

The operator reports: $ARGUMENTS

Classify the report into exactly one CSV in `data/` and append **one row**. CSVs are **append-only**: never edit or delete an existing row; corrections are new rows. Never use Write or Edit on these files — append with `echo '...' >> data/<file>.csv` only.

**Routing:**
- A sale/order → `orders.csv` (`date,order_id,sku,price,pod_cost,fees,contribution,personalization_minutes`)
- Money spent → `expenses.csv` (`date,item,amount,category,running_total`)
- Listing performance snapshot → `listings.csv` (`date,sku,title,views,favorites,sales`)
- A test, decision, sample inspection, gate verdict, or milestone → `experiments.csv` (`date,hypothesis,action,result,decision`)

**Derived fields — compute, don't ask:**
- `date`: today (YYYY-MM-DD) unless the operator states another date.
- orders: if `pod_cost` or `fees` are not stated, take POD cost from `docs/sku-shortlist.md` for that SKU and fees = 13% of price per `docs/unit-economics.md`; `contribution = price − pod_cost − fees` (2 decimals).
- expenses: `running_total` = previous row's `running_total` (0 if none) + `amount`. After appending, compare to the caps in CLAUDE.md: warn if the $600 Gate-B cap is passed, warn loudly if $2,000 is approached.
- listings: `views`/`favorites`/`sales` are cumulative snapshots for that SKU as of the date.

**Rules:**
- Money as plain numbers (no `$`); quote any field containing a comma.
- If genuinely ambiguous which CSV applies, or a required fact is missing and not derivable, ask one short question instead of guessing.
- After appending, echo the exact row written and one line of updated context (e.g. new running total, or total orders to date). This command only writes CSV rows — it never spends money, contacts anyone, or touches Etsy/POD.
