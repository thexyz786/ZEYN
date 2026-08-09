---
description: Draft an Etsy listing — SEO title, 13 tags, description with adab policy, price from unit economics
---

Draft one Etsy listing for gift-ops. Input: `$ARGUMENTS` (product idea/SKU) or ask the operator which product to draft. Work only inside gift-ops/.

Read first: `docs/unit-economics.md` (pricing), `docs/adab-guardrails.md` (compliance), `knowledge/listing-seo.md` (current SEO findings), `CLAUDE.md` (tiers).

Produce the complete draft:

1. **Title** — ≤140 characters, keyword-front-loaded: the highest-intent buyer search phrase first (e.g. "Personalized Arabic Name Sign"), then qualifiers (material, occasion, recipient). No keyword stuffing past readability.

2. **13 tags** — exactly 13, each ≤20 characters (Etsy's limit), multi-word phrases preferred over single words, mixing: occasion (eid gift, ramadan decor), recipient (muslim wedding gift), product (wood name sign), style (arabic calligraphy), and long-tail buyer phrases. Draw from knowledge/listing-seo.md findings where available.

3. **Description** — in order: hook line restating the personalization promise; what the buyer receives (material, size, finish); how personalization works (what to enter, Arabic/Urdu script accuracy-verified by a native reader/writer); production and shipping expectations (POD: made to order); **the adab policy line, verbatim on every listing:** "Out of respect (adab), we never place Qur'anic verses or the Names of Allah on cutting boards, coasters, floor items, or anything routinely soiled — those designs are reserved for wall pieces."; care instructions; a review/aftercare closing line.

4. **Price** — from `docs/unit-economics.md`: pick the tier (Entry $35–65 / Mid $65–130 / Premium $150–400), then verify contribution ≥40% at that price given the tier's COGS% and 13% fees. Show the math: price, COGS, fees, contribution $ and %.

5. **Adab check** — confirm the product/design passes `docs/adab-guardrails.md` (ayat/Names of Allah placement). If it fails, say so and propose the compliant variant instead.

6. Print the full draft in the chat. Offer to append a row to `data/listings.csv` **only when the operator confirms they have actually published it** (date, sku, title, views=0, favorites=0, sales=0).

This command drafts only. Publishing on Etsy is a human-only action — never claim the listing is live.
