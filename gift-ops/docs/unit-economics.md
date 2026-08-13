# Unit Economics

Working assumptions until real orders overwrite them with logged data. Fees: **13% of price all-in** (Etsy transaction + payment processing + listing amortization).

> **Verified 2026-08-13.** Etsy's actual base fees are $0.20 listing + 6.5% transaction + 3% & $0.25 processing = **10.3% at $55**. The 13% planning figure is deliberately kept as a conservative buffer — every contribution number below is therefore a floor, not a forecast. **Exception: Offsite Ads.** An attributed sale adds 15% (12% and mandatory once the shop passes $10k/yr, permanently), which drops POD contribution to 30.7% and fails the Gate A bar. Opt out while eligible. Detail and sources: `knowledge/etsy-operator-basics.md`.

## Fulfillment routes

| Route | COGS (% of AOV) | Operator min/order | Capex | Available |
|---|---|---|---|---|
| POD (Printify) | 44% | 8 | $0 | Now |
| In-house diode laser | 18% | 30 | $900 (range $700–1,200) | After Gate B PASS only |
| Artisan hybrid (Indian batches, personalized stateside) | 32% | 15 | $400 | After Gate C PASS only |

## Contribution per order at $55 AOV

contribution = price − COGS − fees(13%)

| Route | COGS | Fees | Contribution | Margin |
|---|---|---|---|---|
| POD | $24.20 | $7.15 | **$23.65** | 43% |
| Laser | $9.90 | $7.15 | **$37.95** | 69% |
| Artisan hybrid | $17.60 | $7.15 | **$30.25** | 55% |

POD clears the Gate A bar of ≥40% contribution at $55 AOV — but barely; price discipline matters. Anything under $45 AOV on POD fails the bar.

## Breakeven / payback at $55 AOV

| Orders | POD (cum. contribution) | Laser (after $900 capex) | Artisan (after $400 capex) |
|---|---|---|---|
| 10 | $237 | −$521 | −$98 |
| 40 | $946 | $618 | $810 |
| 120 | $2,838 | $3,654 | $3,230 |

- **Laser payback: ~24 orders** ($900 ÷ $37.95). Crossover vs POD (where laser's total beats POD's): ~63 orders — the laser only wins if Gate B proves demand.
- **Artisan payback: ~14 orders** ($400 ÷ $30.25); crossover vs POD ~61 orders — and it unlocks the Premium tier ($150–400) where the math is far better.

## Operator time ceiling — flagged

**60 hr/month ceiling.** At 8 min/order (POD) that caps ~450 orders/mo — not binding. At 30 min/order (laser) the ceiling is **~120 orders/mo**, and that ignores photography, listings, and support: laser at scale eats the operator. This is a standing argument for POD-first and for hybrid routing (laser only for premium SKUs) after Gate B.

## Price ladder recap
Entry $35–65 (engraved wood) · Mid $65–130 (layered laser designs, POD-produced until Gate B) · Premium $150–400 (hand-carved artisan, post-Gate C). Every /listing price must show ≥40% contribution at the chosen route.
