---
description: Discover high-value email ideas for a brand and convert one into a draft.
argument-hint: Brand name or brand ID
---

Generate actionable email opportunities:

1. Resolve brand from `$ARGUMENTS` (ask for clarification only if needed).
2. Fetch ideas with `get_email_ideas` (limit 25).
3. If ideas are stale or sparse, call `get_email_ideas` with `refresh=true` to regenerate and return in one step.
4. Present ideas grouped by category (core campaigns, flows, newsjacking, trending).
5. Rank by likely business impact and execution speed.
6. Ask the user if they want to immediately draft one and, if yes, call `create_email`.

