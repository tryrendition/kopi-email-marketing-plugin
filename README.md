# Kopi Email Marketing Plugin for Claude Code

Brand-aware lifecycle email marketing for **Klaviyo**. Draft, analyze, and diagnose emails grounded in your brand's actual performance data — not generic best practices.

## Installation

```
/plugin install kopi-email-marketing@claude-plugins-official
```

Or browse `/plugin > Discover` in Claude Code.

## What It Does

Kopi plans, art-directs, and renders brand-consistent emails from your Klaviyo data. One connection replaces three tools:

| Surface | What it gives you |
|---------|-------------------|
| **Drafting** | Compose emails that match your brand voice, palette, typography, and recent campaigns — from a one-line prompt |
| **Analysis** | Audit campaign and flow performance, surface winners and bottlenecks, tie every recommendation to observed Klaviyo data |
| **Ideas** | Surface high-value ideas grouped by category (core, flow, newsjacking, trending), prioritized by impact × speed |

## Authentication

On first tool call, you'll complete an OAuth flow to connect your Kopi account. The MCP server handles tokens — no env vars, no manual setup. Requires a Kopi account ([sign up](https://trykopi.ai)).

## Plugin Components

### Slash Commands

- `/kopi-email-marketing:analyze <brand>` — Run a full lifecycle email audit for one brand: performance, winners, underperformers, and a prioritized 14-day action plan.
- `/kopi-email-marketing:ideas <brand>` — Surface prioritized email ideas grouped by category. Ask to draft any one directly.
- `/kopi-email-marketing:status` — Check status of in-flight Kopi jobs (email generation, brand setup, refresh tasks).

### Skills

Claude invokes these automatically based on context — no command needed.

- **create-email** — Drafts a brand-consistent email. Triggers when you ask to write, draft, or compose an email, campaign, welcome series, abandoned cart, or flow.
- **analyze-brand** — Audits a brand's email program and returns evidence-backed recommendations. Triggers on performance, revenue, engagement, or audit/review requests.
- **explore-ideas** — Surfaces high-value campaign and flow ideas grouped by category. Triggers on "what should we send next", campaign planning, or newsjacking questions.
- **klaviyo-diagnostics** — Diagnoses Klaviyo program health. Triggers when you mention broken flows, underperforming campaigns, revenue gaps, or unexplained performance dips.

### Subagent

- **kopi-analyst** — A specialized agent for deep brand audits. Invoke with `@kopi-analyst <brand>` for thorough, evidence-backed performance analysis with a 14-day action plan.

### MCP Server

Connects to the Kopi remote MCP server at `https://trykopi.ai/mcp` over HTTP. 10 tools organized by domain:

**Brand**
- `list_brands` — Paginated list of accessible brands with email counts and roles.
- `set_active_brand` — Switch active brand by name, domain, URL, or ID. Fuzzy matching supported.
- `get_context` — Returns the active brand plus a full briefing (performance, recent emails, ideas). Starting point for most questions.

**Email**
- `create_email` — Generate a new email from a natural-language prompt. Kopi plans, art-directs, and renders from brand settings. Returns a URL; generation takes 5–10 min async.
- `edit_email` — Surgically edit an existing email in place (e.g., "shorten the intro"). Preserves colors, fonts, and structure. Returns the same URL updated; ~30–60 sec.
- `view_email` — Inspect one email by URL or chat ID. Returns subject, copy, generation strategy, design critique, and screenshot.
- `check_status` — Check status of in-progress work (email generation, brand setup, async ops).

**Analysis**
- `get_email_performance` — Unified performance tool. `detail='summary'` returns program overview; `detail='campaigns'` or `detail='flows'` drills in with sorting and pagination.
- `refresh_performance_data` — Recompute performance from Klaviyo (audience, campaigns, flows). Expensive — use only for fresh data or when data > 14 days old.

**Ideas**
- `get_email_ideas` — Read ideas (campaigns, flows, newsjacking, trending) with freshness metadata. `refresh=true` regenerates before returning.

## Example Usage

**Draft an email from one line:**
```
Draft a welcome-series email for Armra that emphasizes the new flavor launch.
```

**Run a full audit:**
```
/kopi-email-marketing:analyze Dr. Squatch
```

**Explore what to send next:**
```
What should we send this week for Nami Matcha?
```

**Diagnose a specific performance dip:**
```
Why is our Klaviyo flow revenue down this month for Armra?
```

**Check async job status:**
```
/kopi-email-marketing:status
```

## How Email Generation Works

Kopi's `create_email` and `edit_email` tools are **asynchronous** — they return a URL immediately, but the email takes 5–10 minutes to render fully. Claude will tell you this every time; use `check_status` or `view_email` to check progress.

## Troubleshooting

- **OAuth didn't open** — Ensure your Claude Code session has network access. First tool call opens the browser; subsequent sessions reuse the token.
- **"Brand not found"** — Use `list_brands` to see what's accessible, then `set_active_brand` with a name or domain. Fuzzy matching works for partial names.
- **Stale metrics** — If data is > 14 days old, run `refresh_performance_data` (1–3 min) or pass `refresh=true` to `get_email_ideas`.
- **Plugin changes not loading** — Run `/reload-plugins` to pick up updates without restarting.

## Links

- [Website](https://trykopi.ai)
- [MCP Docs](https://trykopi.ai/mcp-docs)
- [Support](mailto:support@trykopi.ai)

## License

Apache-2.0. See [LICENSE](./LICENSE).
