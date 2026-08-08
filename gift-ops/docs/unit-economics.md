# Unit Economics

Worked model for the standard order. `/listing` prices from this file. All figures USD.

## Baseline Order

| Line | Amount | Basis |
|------|--------|-------|
| Sale price (AOV, ships free) | $50.00 | Target average across the 12 SKUs |
| POD cost (product + US shipping) | −$22.00 | Printful/Printify framed print or canvas, mid size |
| Etsy fees (planning rate 13%) | −$6.50 | Breakdown below |
| **Contribution per order** | **$21.50** | **43.0% of price** ✅ ≥ 40% required |

## Etsy Fee Breakdown (on a $50 free-shipping order)

| Fee | Rate | Amount |
|-----|------|--------|
| Transaction fee | 6.5% of order total | $3.25 |
| Payment processing (US) | 3% + $0.25 | $1.75 |
| Listing fee | $0.20 per sale (renewal) | $0.20 |
| Exact subtotal | 10.4% | $5.20 |
| **Planning rate used** | **13%** | **$6.50** |

The 2.6-point cushion ($1.30/order) absorbs Offsite Ads fees (15% on attributed orders, unavoidable once eligible), occasional refunds/reships, and currency/fee drift. Plan at 13%; anything better is upside.

## Pricing Rule (used by /listing)

Contribution = price × (1 − 0.13) − POD cost. Require contribution ≥ 40% of price:

**Minimum price = POD cost ÷ 0.47 (≈ 2.13 × POD cost), rounded up to the next whole dollar.**

| POD cost | Minimum price | At minimum: contribution |
|----------|---------------|--------------------------|
| $12 (unframed print / mug) | $26 | $10.62 (40.8%) |
| $18 (small framed) | $39 | $15.93 (40.8%) |
| $22 (baseline) | $47 | $18.89 (40.2%) |
| $30 (canvas / large framed) | $64 | $25.68 (40.1%) |

List at or above the SKU's target price in `docs/sku-shortlist.md`, never below the minimum from this table.

## Contribution at Volume ($21.50/order baseline)

| Orders/month | Contribution/month | Personalization time @20 min/order | Covers |
|--------------|--------------------|------------------------------------|--------|
| 10 | $215 | ~3.3 hrs | Recoups the $150 promoted-listings test in <1 month |
| 30 | $645 | ~10 hrs | Recoups the full $600 Gate-B budget in <1 month |
| 100 | $2,150 | ~33 hrs | Beyond solo capacity at 10–15 hrs/week — raise prices or narrow SKUs before chasing this |

## Gate C Math

Gate C requires contribution ≥ $800/month: $800 ÷ $21.50 = **38 orders/month (~9/week)**. At 20 personalization minutes per order that is ~12.7 hrs/month of design time — feasible within 10–15 hrs/week post-September. If `/review` shows personalization minutes per order trending above ~30, the model breaks at Gate C volume; fix the workflow or raise prices.

## Watch Numbers

- Contribution % per order (from `orders.csv`): red flag below 40% on any SKU two orders in a row.
- Personalization minutes per order: target ≤ 20, hard ceiling 30.
- Listing conversion (sales ÷ views from `listings.csv`): Gate B alternative threshold is ≥ 3%.
