---
description: Append a row to the right CSV — orders, expenses, listings, or experiments
---

Log an event into gift-ops data. Work only inside gift-ops/data/.

1. From the operator's input (`$ARGUMENTS` or ask), determine which CSV it belongs to:
   - **orders.csv** — `date,order_id,sku,tier,price,cogs,fees,contribution,personalization_minutes`
   - **expenses.csv** — `date,item,amount,category,running_total`
   - **listings.csv** — `date,sku,title,views,favorites,sales`
   - **experiments.csv** — `date,hypothesis,action,result,decision`

2. Fill fields only from what the operator states. Compute derived fields when their inputs are given: contribution = price − cogs − fees (per docs/unit-economics.md: fees 13% of price if not stated); running_total = previous running_total + amount. Ask for any missing required field — never invent a value.

3. **Append** the row to the end of the file. Never edit or delete existing rows. Use ISO dates (YYYY-MM-DD); default to today if no date given.

4. After an expense append: print budget remaining ($600 − running_total) and warn if remaining < $100 or if this expense would introduce a recurring paid service (which needs an explicit operator decision).

5. Confirm with the exact row that was appended, on one line.

This command only records what the operator reports. It never performs or claims any purchase, order, or external action.
