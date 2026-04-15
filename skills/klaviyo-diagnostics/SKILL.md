---
name: klaviyo-diagnostics
description: Diagnose Klaviyo program health across campaigns and flows. Use when the user mentions Klaviyo issues, broken flows, underperforming campaigns, revenue gaps, or asks why email performance is off.
---

# Klaviyo Diagnostics

Use when asked about performance, health, revenue contribution, or optimization priorities.

1. Resolve brand.
2. Read:
- `get_klaviyo_program_overview`
- `list_klaviyo_campaigns` (`sortBy=impact`, `limit=20`)
- `list_klaviyo_flows` (`sortBy=score`, `limit=20`)
3. If data is stale:
- Run `refresh_klaviyo_analyses`
- Re-read stale datasets once
4. Output:
- Overall health verdict
- Campaign winners/underperformers
- Flow bottlenecks
- 3-5 specific optimization actions
- Which action should be turned into a new email draft next

Avoid generic advice. Tie each recommendation to observed evidence.

