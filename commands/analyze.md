---
description: Run a full brand performance audit and return prioritized recommendations.
argument-hint: Brand name or brand ID
---

Run a complete Kopi brand audit using this workflow:

1. Resolve the brand from `$ARGUMENTS`:
- If `$ARGUMENTS` is empty, ask for a brand name or ID.
- First try `resolve_brand`. If ambiguity remains, use `list_brands` and ask for confirmation.

2. Collect performance and context:
- `get_brand_overview`
- `get_klaviyo_program_overview` (timeframe `last_90_days`)
- `list_klaviyo_campaigns` (sort by `impact`, limit 20)
- `list_klaviyo_flows` (sort by `score`, limit 20)
- `get_email_ideas` (limit 20)

3. Freshness policy:
- If any response signals stale data, run `refresh_klaviyo_analyses` for the relevant analyses and then re-run the stale reads once.

4. Return:
- Executive summary
- Top 3 strengths
- Top 3 risks or gaps
- Top 5 recommended actions for next 14 days
- Specific email opportunities tied to ideas

