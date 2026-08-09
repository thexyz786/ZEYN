---
name: log
description: Record a sale, expense, supplier interaction, or lead into the Araku data files. Use whenever the founder reports something happened — "sold 2 bags at the stall", "paid for pouches", "GCC quoted 480/kg".
---

Parse $ARGUMENTS. If the entry type or a required field is genuinely ambiguous, ask exactly one question; otherwise proceed. Append the row(s) to the correct file in `data/` using its existing header. Today's date unless another is stated.

Rules:
- `stranger` = Y only when the buyer has no family or jamaat tie; uncertain = N. State which you wrote and why.
- `remote_ok` = Y only on an explicit recorded yes to "will you take orders from my sister once I am in the US" — a friendly tone is not a yes.
- NEVER overwrite or delete rows. Corrections are new rows with a note.

After appending, print exactly one status line: strangers X/10 · revenue ₹X · spend ₹X of ₹30,000. If this entry breaches a capital rule (first purchase ≥ ₹10,000, buying beyond proven sales volume, cumulative spend past ₹30,000), flag it immediately in one blunt sentence.
