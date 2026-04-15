---
name: analyze-brand
description: Audit a brand's email program and return evidence-backed recommendations. Use when the user asks about performance, revenue, open/click rates, engagement, or requests an audit, review, or analysis of a brand's email marketing.
---

# Analyze Brand

Use this sequence:

1. Brand resolution:
- Prefer `resolve_brand` using the user's brand query.
- If unresolved, use `list_brands` and ask one disambiguation question.

2. Data collection:
- `get_brand_overview`
- `get_klaviyo_program_overview` with `timeframe=last_90_days`
- `list_klaviyo_campaigns` with `sortBy=impact`, `limit=20`
- `list_klaviyo_flows` with `sortBy=score`, `limit=20`
- `get_email_ideas` with `limit=20`

3. Freshness handling:
- If freshness signals indicate stale data, run `refresh_klaviyo_analyses` and repeat only stale reads once.

4. Output format:
- Executive summary
- Key metrics and observations
- Top strengths
- Top risks
- Prioritized actions (next 14 days)
- Suggested campaigns to draft immediately

Be explicit about uncertainty when data is incomplete.

