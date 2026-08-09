---
description: Log a competitor script-error observation to experiments.csv with error type
---

Log one competitor audit observation for gift-ops. Input: `$ARGUMENTS` (what the operator observed) or ask for it. Work only inside gift-ops/.

This is the Gate A audit trail (target: ≥20 competitor listings logged).

1. Collect from the operator (ask for whatever is missing — never invent an observation):
   - Competitor shop/listing (name or brief identifier — enough to find it again).
   - What was observed on the listing's Arabic/Urdu script or adab compliance.
   - **Error type**, one of: `letterform` (wrong/isolated letter shapes, broken joining), `direction` (LTR-rendered or mirrored RTL text), `diacritics` (wrong or missing harakat where required), `spelling` (misspelled word/name), `font-substitution` (tofu boxes, wrong-script font), `adab-violation` (ayat/Names of Allah on soilable or floor items), `none` (script verified correct — log these too; clean competitors are evidence).
   - Price point and product type, if visible (feeds pricing and SKU decisions).

2. **Append** one row to `data/experiments.csv`:
   - date = today (YYYY-MM-DD)
   - hypothesis = `competitor script-error audit`
   - action = `audited <shop/listing id>: <product type> at $<price>`
   - result = `<error type>: <one-line observation>`
   - decision = `evidence for differentiation` (or `clean competitor — watch` for `none`)

3. Print the appended row, then the running audit count vs the Gate A target (count experiments.csv rows with hypothesis `competitor script-error audit`): "N of 20 audits logged."

Append-only; never edit prior rows. Observation must come from the operator — this command records, it does not browse.
