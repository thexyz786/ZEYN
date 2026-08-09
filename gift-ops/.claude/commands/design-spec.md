---
description: Produce a personalization spec with Arabic/Urdu script verification and adab compliance check
---

Produce a production-ready design spec for one gift-ops SKU. Input: `$ARGUMENTS` (product + personalization request) or ask. Work only inside gift-ops/.

Read first: `docs/adab-guardrails.md`, `CLAUDE.md` (tiers), `docs/unit-economics.md`.

Output the spec with these sections:

1. **Product** — SKU, tier (Entry/Mid/Premium), material, dimensions, finish, fulfillment route (POD / laser / artisan — per current phase, POD only until Gate B passes).

2. **Personalization fields** — exactly what the buyer supplies (name, date, phrase choice), character limits, allowed scripts (Latin / Arabic / Urdu), and the fallback if input is invalid.

3. **Arabic/Urdu script verification** — write out the exact text to be engraved in the target script; letter-by-letter check: correct letter forms and joining (initial/medial/final/isolated), correct diacritics if used (or explicitly none), correct RTL rendering; for Urdu confirm Nastaliq vs Naskh style choice; transliteration shown beside the script; a note that the operator (native reader/writer) gives final sign-off before production. Flag any input you cannot verify with certainty instead of guessing.

4. **Adab compliance check** — against `docs/adab-guardrails.md`: Does the design contain ayat or Names of Allah? Is the item a wall piece or a utility/floor/soilable item? Verdict: COMPLIANT / NOT COMPLIANT (with the compliant alternative). Utility items: names, duas, geometry only.

5. **Production notes** — engraving depth/method, font/calligraphy style, layout placement, minimum stroke width for laser legibility, mockup instructions.

6. **QC checklist (per order)** — script matches verified spec exactly; no mirrored/broken letters; adab placement re-checked; spelling of Latin text; personalization matches the buyer's order fields.

Print the spec in the chat. If the operator confirms the SKU is finalized, offer to log it in `data/experiments.csv` (hypothesis = SKU design, action = spec produced, result/decision as given). Drafting only — no external tools, no production claims.
