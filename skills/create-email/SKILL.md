---
name: create-email
description: Draft a brand-consistent lifecycle email for Klaviyo. Use when the user asks to create, draft, or compose an email, campaign, welcome series, abandoned cart, or flow for a specific brand.
---

# Create Email

Workflow:

1. Resolve brand:
- Try `set_active_brand` first (accepts name, domain, URL, or ID — fuzzy queries like "nami matcha" work).
- Ask for confirmation only when ambiguity remains.

2. Gather context:
- `get_context` — returns the active brand plus a full briefing with performance metrics, recent emails, and available ideas in one call.

3. Build prompt — two things only:
- **Capture the user's intent concisely.** Minimal details, just enough to respectfully reflect what they asked for. Don't pad.
- **Focus on the core value prop + any offer** the user wants highlighted. Be faithful — don't invent details, don't embellish, don't over-specify.

Pass through anything the user **explicitly** asked for (including design asks like "make it dark mode", "keep it short", "use a video"). Do not add design direction, section blueprints, color/font rules, or brand rules the user didn't mention — Kopi's pipeline handles brand style from settings.

If a relevant idea has a `suggestedPrompt`, use it as baseline and adapt to the user's request.

4. Generate:
- Call `create_email` with final `brandId` and prompt.

5. Respond with:
- New email URL(s)
- The concise rationale for prompt framing
- Clear note that generation runs asynchronously (5-10 minutes)

If user asks for modification of an existing email URL, prefer `edit_email`.

