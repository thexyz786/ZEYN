# Etsy Operator Basics

Status: **to be researched** — /daily fills the sections below with dated, sourced findings. Nothing here is verified until it carries a source + date.

## What good looks like
The operator (who has never used Etsy or Printify) can open this file and know: exactly what it costs to list and sell an item, how a paid order flows from Etsy through Printify to the buyer's door untouched, and what the seller dashboard's numbers mean. Every fee has a current number with a source and date.

## Outline

### Etsy fee schedule (current)
- Listing fee, transaction fee, payment processing fee, offsite-ads fee, currency conversion.
- All-in % check against the 13% assumption in docs/unit-economics.md.
- *(to be researched)*

### Printify wood/engraved catalog
- Products available (signs, plaques, ornaments, boards), print providers, per-item cost, production days, blank sizes.
- Which map to the Entry/Mid product ladder.
- *(to be researched)*

### Etsy ↔ Printify auto-fulfillment flow
- What happens from "buyer pays" to "tracking uploaded" with zero operator touches; where personalization data enters; what still needs manual review.
- *(to be researched)*

### Seller dashboard literacy
- Views vs visits, favorites, conversion; where stats live; what to log into data/listings.csv.
- *(to be researched)*

### Order defects & protection
- Star seller criteria, cases, refund mechanics on POD.
- *(to be researched)*

## Findings log
(dated, sourced entries appended by /daily)

### 2026-08-09 — Printify wood/engraved catalog (backlog #1, 3 queries)
- **How the catalog prices:** each Printify product page lists multiple print providers, each with its own base cost, production time, print method, shipping origin, and user-rated quality score — so "per-item cost" is per-provider, visible only inside the app catalog. Source: [Printify — The Complete Printify Guide (PodVector AI)](https://podvector.ai/articles/printify/explainer/the-complete-printify-guide-what-it-is-and-how-it-works), retrieved 2026-08-09.
- **Production/shipping:** production averages ~2.5 days; ~3–7 business days total to print and ship is typical. No minimums; single-unit fulfillment. Source: [Printify — How to make custom signs](https://printify.com/blog/how-to-make-custom-signs/), retrieved 2026-08-09.
- **⚠ Critical nuance:** Printify's wood offering is dominated by **full-color UV-printed** wood signs/plaques ("personalize signs with full-color graphics, text, and image uploads") — i.e. printed *engraved-look*, not true laser engraving. Whether any provider offers real engraving must be verified in-app. Sources: [Printify — Custom signs](https://printify.com/custom-signs/); [EComposer — Top 10 POD wood sign suppliers, 2026](https://ecomposer.io/blogs/pod/top-10-print-on-demand-wood-sign-suppliers), retrieved 2026-08-09.
- **Price floor signals (adjacent sign products):** yard signs from ~$6.99, aluminum signs from ~$5.99 base — wood blanks will sit above this; exact wood base costs require the in-app catalog. Source: [TheCleverBusiness — Best metal/wood/yard sign POD companies](https://thecleverbusiness.com/print-on-demand-signs/), retrieved 2026-08-09.
- **Backup suppliers lead:** EComposer's 2026 review lists 10 POD wood-sign suppliers beyond Printify — the fallback list if Printify lacks true engraving. Source: [EComposer](https://ecomposer.io/blogs/pod/top-10-print-on-demand-wood-sign-suppliers), retrieved 2026-08-09.
- **Open remainder → curriculum Day 3:** exact per-item wood base costs and provider engraving options are only visible in the logged-in Printify catalog; the operator shortlists 5 Entry-tier products with real prices during the Day-3 lesson.
