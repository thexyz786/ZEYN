---
description: Personalization spec sheet + Arabic/Urdu verification checklist for one order
argument-hint: order details (e.g. "GFT-002, couple Ayesha & Omar, nikah date 2026-11-14")
allowed-tools: Read
---

Produce the spec sheet for this order: $ARGUMENTS

Read `docs/sku-shortlist.md` for the SKU's product and base item. If an order_id is given, read `data/orders.csv` for its row. Output two parts:

## Part 1 — Personalization Spec Sheet

- **Order / SKU:** id, product, POD base item and print size.
- **Text to render:** each name/phrase exactly as provided by the buyer, plus its Arabic and/or Urdu rendering. If the buyer gave only a Latin transliteration, list every plausible Arabic/Urdu spelling and mark which needs buyer confirmation before printing.
- **Script & style:** calligraphy style for this SKU (e.g. Diwani for name prints, nastaliq for Urdu couplets), plus dates/numerals treatment (Eastern vs Western Arabic numerals — state which).
- **Layout notes:** composition, colors/palette, and any buyer requests verbatim.
- **Print-readiness:** minimum 300 DPI at print size; text converted to outlines before upload; safe margins per the POD template.

## Part 2 — Arabic/Urdu Verification Checklist

The operator (native reader/writer) checks each box by eye on the final artwork file — this checklist is the differentiator, never skip it:

- [ ] Spelling confirmed against buyer input (ambiguous transliterations resolved with the buyer, not guessed)
- [ ] Right-to-left flow correct; no software-reversed or mirrored text
- [ ] Ligatures joined correctly; no broken/isolated letterforms from the design tool
- [ ] Diacritics (harakat/nuqta) present, correct, and correctly placed — or intentionally omitted consistently
- [ ] Urdu text is true nastaliq (not naskh substituted); Urdu-specific letters (ے ٹ ڑ ں ھ) rendered correctly
- [ ] Qur'anic text (if any) matches the mushaf exactly, with surah:ayah reference stated on or with the design
- [ ] Names/dates match the order row in `data/orders.csv` exactly
- [ ] Legible at print size from 2 meters (zoom test at 100%)

End with: "Verified by operator: ____ (date)". Rules: draft only — the operator uploads to the POD and messages the buyer by hand. If any needed detail is missing from $ARGUMENTS and the CSVs, list it under **Missing — ask buyer** rather than inventing it. Do not write to any file.
