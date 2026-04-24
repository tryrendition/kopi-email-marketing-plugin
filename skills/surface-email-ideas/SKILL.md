---
name: surface-email-ideas
description: "Kopi (brand-aware Klaviyo email): find and rank email campaign ideas for a brand — core campaigns, flow updates, newsjacking, trending topics — each with a priority and a ready-to-use prompt for create_email. Optionally drafts the winning idea when the user picks one."
when_to_use: The user asks what to send next, wants campaign ideas, is exploring opportunities, or is looking for newsjack / trending angles. Example phrasings — "what should we send this week for <brand>?", "give me campaign ideas", "any newsjacking angles?", "what's trending we could run with?", "help me plan next month's emails."
user-invocable: true
argument-hint: "[brand name, domain, URL, or ID]"
---

# Surface Email Ideas

## Workflow

1. **Resolve brand** — Call `set_active_brand` with `query=<user's input>` (mode defaults to `"set"`). If the response is `status: "not_found"`, ask the user for the brand's website URL, then retry with `mode: "create", url: <url>`. Skip this step entirely if a brand is already active and the user didn't name a different one.

2. **Fetch ideas** — Call `get_email_ideas` with `limit=25`. Each idea includes a priority and a ready-to-use `suggestedPrompt`.

3. **Refresh if sparse or stale** — If fewer than 5 ideas are returned or they look stale, call `get_email_ideas` with `refresh=true` to regenerate (30–60 seconds).

4. **Group and rank** — Organize ideas into four buckets:
   - Core campaigns
   - Flow updates
   - Newsjacking
   - Trending topics

   Within each bucket, rank by `priority` and realistic execution speed. Highlight 1–2 fast wins across the whole set.

5. **Offer to draft** — If the user picks an idea, call `create_email` with that idea's `suggestedPrompt` as the `prompt` argument. Follow the prompt-framing guidance in the `create_email` tool's own description — don't pad or add design direction Kopi handles on its own.
