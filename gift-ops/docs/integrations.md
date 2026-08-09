# Integrations

## v1 (now): Etsy ↔ Printify native auto-fulfillment
The backbone. A paid Etsy order flows to Printify production and ships to the buyer untouched — no operator action per order (personalized orders: operator approves the personalization against the /design-spec QC checklist, then production proceeds). Setup is covered step-by-step in **curriculum days 3–4** (connect stores, enable auto order approval, sample order). No other integration is needed to sell.

## claude.ai layer (roles, as available)
- **Gmail** — order-signal ingestion: read Etsy/Printify notification emails to reconcile what should be logged in data/orders.csv. Read-only signal; the CSVs remain the source of truth and the operator confirms every row.
- **Drive** — asset library: finals of design files, photos, and listing copy, organized per SKU.
- **Canva** — design production: listing graphics, packaging inserts, personalization mockups from /design-spec output.
- **Make** — Etsy/Printify API bridge **post-Gate-B only**: automate order → CSV logging and stats pulls once volume justifies it. Not before; it's a paid service and needs an explicit operator decision.
- **Shopify** — connector **parked** until a brand-site migration is ever justified (post-Gate C at the earliest). Etsy is the channel now.

## Claude Code MCP additions
Deferred to **post-Gate-B**, added via `claude mcp add` when the operator decides. Until then this repo runs on files alone: Markdown, CSV, one HTML dashboard — no dependencies.

## Standing rules
- No integration moves money, creates accounts, publishes listings, or contacts customers — human-only, always.
- Any paid tier (Make, etc.) requires an explicit operator decision logged in data/experiments.csv and the expense in data/expenses.csv.
