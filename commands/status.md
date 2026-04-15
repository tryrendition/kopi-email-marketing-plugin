---
description: Check active Kopi background jobs and summarize what is pending vs complete.
---

Check operational status:

1. Call `list_kopi_tasks` (limit 20).
2. Group results by status (`queued`, `in_progress`, `completed`, `failed` when present).
3. Highlight long-running tasks and any failures first.
4. Suggest concrete next steps:
- wait and re-check
- open created email URLs
- retry analysis refresh or idea refresh when relevant

