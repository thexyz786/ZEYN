---
description: Draft one Etsy listing for a SKU — title, 13 tags, description, personalization instructions, price
argument-hint: SKU id from docs/sku-shortlist.md (e.g. GFT-003), or a new product idea
allowed-tools: Read
---

Draft one Etsy listing for: $ARGUMENTS

Read `docs/sku-shortlist.md` for the SKU's occasion, product, POD base item, POD cost, target price, and differentiation. Read `docs/unit-economics.md` for the pricing rule. If the argument is a new idea not in the shortlist, say so, then draft it anyway using the closest base item's POD cost.

Output the draft in exactly these sections:

**1. Title** — ≤140 characters, keyword-front-loaded: highest-volume buyer search phrases first (e.g. "Personalized Arabic Calligraphy Name Print"), occasion and gift keywords next, style words last. No keyword stuffing with repeats; show the character count.

**2. Tags** — exactly 13, each ≤20 characters, comma-separated. Mix: product terms, occasion terms ("eid gift", "nikah gift"), audience terms ("muslim wedding gift"), and long-tail phrases. No tag may merely repeat another.

**3. Description** — 150–250 words: opening hook restating the top keywords; what the buyer receives (base item, sizes, materials from the POD base); the accuracy promise — every design is personally verified by a native Arabic and Urdu reader/writer, correct ligatures and spelling guaranteed; processing time 3–5 business days; free US shipping; no returns on personalized items.

**4. Personalization instructions** — the exact text for Etsy's personalization box (≤256 characters): what to enter (name(s), transliteration or Arabic/Urdu spelling if known, date if applicable), and that spelling will be confirmed before printing if ambiguous.

**5. Price** — the SKU's target price from `docs/sku-shortlist.md`; verify it meets the minimum-price rule in `docs/unit-economics.md` (≥ 2.13 × POD cost). Show price, POD cost, fees at 13%, contribution $ and %. If the target price fails the rule, output the corrected minimum price instead and flag it.

Rules: this is a **draft only** — the operator publishes by hand (see `docs/launch-checklist.md`). Never state or imply the operator's community affiliation; market to the general US Muslim and South Asian audience only. Do not write to any file.
