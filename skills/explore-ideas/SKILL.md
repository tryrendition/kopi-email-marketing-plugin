---
name: explore-ideas
description: Surface high-value email campaign and flow ideas grouped by category. Use when the user asks what to send next, wants ideas, is exploring campaign options, or asks about newsjacking or trending opportunities.
---

# Explore Ideas

Use this workflow:

1. Resolve brand via `resolve_brand` (fallback to `list_brands`).
2. Load ideas with `get_email_ideas` (`limit=25`).
3. If stale or missing, call `get_email_ideas` with `refresh=true`, which regenerates and returns ideas in one step.
4. Group by category:
- core campaign ideas
- flow ideas
- newsjacking ideas
- trending ideas
5. Rank ideas by:
- expected impact
- speed to execute
- strategic fit to user's goal
6. Offer immediate conversion:
- If user selects one, call `create_email` using that idea's prompt.

Always include 1-2 fast-win options.

