---
name: audit-brand
description: "Kopi (brand-aware Klaviyo email): run a full lifecycle audit of one brand's email program — program health, campaigns, flows, opportunities — and return a prioritized 14-day action plan tied to observed Klaviyo data. Reads from the active brand set via set_active_brand."
when_to_use: The user asks to audit, analyze, review, diagnose, or assess a brand's email marketing, Klaviyo setup, or program health. Example phrasings — "audit <brand>", "review <brand>'s email program", "why is <brand>'s flow revenue down?", "how is our campaign performance trending?", "diagnose <brand>'s lifecycle emails."
user-invocable: true
argument-hint: "[brand name, domain, URL, or ID]"
---

# Audit Brand

Comprehensive audit of one brand's email program using Kopi's MCP tools.

## Workflow

1. **Resolve brand** — Call `set_active_brand` with `query=<user's input>` (mode defaults to `"set"`). Fuzzy queries like "nami matcha" work. If the response is `status: "not_found"`, ask the user for the brand's website URL, then retry with `mode: "create", url: <url>` (brand creation is async, 1–3 min). If `$ARGUMENTS` is empty and no brand is active, ask once for a brand identifier before proceeding.

2. **Load briefing** — Call `get_context`. Returns performance metrics, recent emails, available ideas, and other brand names in one shot and covers most audit questions.

3. **Deep-dive performance** — For a full audit, follow up with:
   - `get_email_performance` with `detail="summary"`, `timeframe="last_90_days"` — program health overview
   - `get_email_performance` with `detail="campaigns"`, `sortBy="impact"`, `limit=20` — top and bottom campaigns
   - `get_email_performance` with `detail="flows"`, `sortBy="score"` — flow health

4. **Freshness check** — If any response indicates data older than 14 days, tell the user and offer to call `refresh_performance_data` (expensive, 1–3 min). Do not refresh proactively.

5. **Deliver** the audit in this shape:
   - Executive summary (2–3 sentences)
   - Top 3 strengths (evidence-tied)
   - Top 3 risks or gaps (evidence-tied)
   - Top 5 prioritized actions for the next 14 days
   - 2–3 specific email ideas from the briefing worth drafting next

Tie every recommendation to observed data from the tool responses. Never invent metrics — if data is missing, state it explicitly and propose the exact next tool call.
