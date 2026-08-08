# Launch Checklist

Ordered, human-only. Claude drafts and prepares; the operator executes every step below. Log every expense to `expenses.csv` and every milestone to `experiments.csv` as it happens. Nothing here may use Dawoodi Bohra community channels, networks, or contacts.

## 1. Brand shortlist
- [ ] Pick 5 candidate shop names (English-friendly, hints at Arabic calligraphy/gifting, no community-specific terms).
- [ ] Check each for Etsy shop-name availability, matching .com or .shop domain, and Instagram handle.
- [ ] Choose one; record the decision in `experiments.csv`.

## 2. Etsy shop setup
- [ ] Create the Etsy shop (note: while in India, set up with correct tax/payout details for a US-market shop; verify Etsy Payments works from your situation before proceeding).
- [ ] Complete profile: banner, icon, about section emphasizing native Arabic/Urdu accuracy verification.
- [ ] Set shop policies: processing time 3–5 business days (personalization buffer), no returns on personalized items (Etsy-standard), free US shipping.

## 3. POD account
- [ ] Create Printful account (primary) and Printify account (price comparison), both on free tiers.
- [ ] Connect Printful to the Etsy shop.
- [ ] Confirm US fulfillment centers and realistic delivery estimates for the base items in `docs/sku-shortlist.md`.

## 4. Three sample orders (Gate A requirement)
- [ ] Order 3 samples covering the main base items: one framed print, one canvas, one unframed print or mug (~$60–75 total; log each to `expenses.csv`, category `samples`).
- [ ] Ship to a US address you can get photos/inspection from (samples to India are slow/costly — use a trusted US contact outside the excluded community, or accept the delay).
- [ ] Inspect each: print sharpness, Arabic ligature rendering at print resolution, color accuracy, frame and packaging quality. Log each result to `experiments.csv`.

## 5. Photography
- [ ] From the samples: shoot or collect lifestyle photos; supplement with POD-provided mockups.
- [ ] Produce 6–10 images per listing: main mockup, size chart, personalization example (same name in Arabic and Urdu styles), close-up of calligraphy detail, gifting context.

## 6. First 12 listings (Gate A requirement)
- [ ] Run `/listing` for each SKU in `docs/sku-shortlist.md`; review every draft personally — you are the accuracy check.
- [ ] Publish all 12 on Etsy ($0.20 × 12 = $2.40 listing fees; log to `expenses.csv`).
- [ ] Snapshot each into `listings.csv` (views 0) on publish day.

## 7. $150 promoted-listings test
- [ ] After all 12 are live, enable Etsy Ads at ~$5/day capped so total test spend ≤ $150; log to `expenses.csv`, category `ads`.
- [ ] Run for the Gate B demand window; snapshot `listings.csv` weekly (views, favorites, sales per SKU).
- [ ] At $150 spent or Gate B date, whichever first: stop ads and run `/gate`.

Running-total checkpoint: steps 1–7 fully executed ≈ $230–250 of the $600 cap, leaving headroom for reships, extra samples, or the one permitted Gate B niche iteration.
