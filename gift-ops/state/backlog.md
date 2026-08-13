# Research Backlog

Open questions for /daily's research step (one item per run, ≤3 queries). When answered: write findings to the named knowledge/ file with source + date, then mark the item here with `ANSWERED YYYY-MM-DD` — do not delete the question.

## Open questions
1. **Printify wood/engraved catalog** — What wood, engraved, and wood-look products does Printify currently offer, from which print providers, at what per-item cost and production time? → `knowledge/etsy-operator-basics.md` — **ANSWERED 2026-08-09** (catalog mechanics, production times, printed-vs-engraved caveat; exact per-item costs are in-app only → folded into curriculum Day 3)
2. **Current Etsy fee schedule** — Exact current listing fee, transaction fee, payment processing fee, offsite-ads fee, and currency conversion fee; verify the 13% all-in assumption in docs/unit-economics.md. → `knowledge/etsy-operator-basics.md` — **ANSWERED 2026-08-13** (base ≈9.5% + $0.45 = 10.3% at $55, so 13% is conservative; Offsite Ads is the exception — 15% optional under $10k, 12% mandatory and permanent above)
3. **Top-20 competitor script-error audit plan** — Identify the top ~20 Etsy shops selling Arabic/Islamic personalized wood gifts; build the shortlist the operator will audit with /audit (shop names, listing URLs, price points). → `knowledge/listing-seo.md` — **round 1 done 2026-08-09** (10 shops, 0 script errors, 2 adab violations). **Round 2 targeting decided 2026-08-09:** the first sample was mostly *specialist* Islamic-decor shops, which get script right by trade. Round 2 targets (a) the cheap high-volume tail (under ~$30, high review counts, Best Seller badges) and (b) **generalist** personalized-gift shops where Arabic is one option among hundreds of SKUs and nobody in the shop reads it. If round 2 also returns 0 errors, the script-accuracy differentiator is falsified and the thesis in CLAUDE.md needs an operator rewrite toward adab compliance.
4. **Best 13-tag sets** — Strongest current tag sets for "Eid gifts personalized" and "Arabic name art" (search volume/competition signals, autocomplete phrases, competitor tag reuse). → `knowledge/listing-seo.md`
5. **Phone lightbox setup under $60** — Best-reviewed phone photography lightbox/lighting setup under $60 for small wooden products; exact kit and technique. → `knowledge/phone-photography.md`
6. **Ramadan 2027 shipping-cutoff logistics** — Working back from Ramadan ≈ 8 Feb 2027 and Eid ≈ 9–10 Mar 2027: POD production times + US shipping → last safe order dates; when must listings be live. → `knowledge/eid-ramadan-campaign.md`

## Tomorrow seeds
1. Run audit round 2 (10 shops, generalist + cheap-tail targeting per item 3) → takes Gate A audits to 20 of 20.
2. Draft the Entry-tier compliant utility SKU on the RosewoodDecorGifts pattern: personalized kitchen/home board, names/duas/geometry only, ~$55 (/design-spec then /listing).
3. Research backlog item 2 (current Etsy fee schedule) to verify the 13% assumption in docs/unit-economics.md.
