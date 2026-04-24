#!/usr/bin/env bash

# Kopi SessionStart hook — surfaces the plugin's purpose into a fresh session
# BEFORE the MCP server has been OAuth-authenticated. MCP `instructions` and
# `resources` only reach the model after the MCP handshake completes; this
# hook fires at session startup and is the only pre-auth discovery surface.

cat << 'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "Kopi (brand-aware Klaviyo email marketing) is installed. One OAuth sign-in on the first brand-scoped tool call unlocks: drafting on-brand emails from one-line prompts (create_email / edit_email, async 5-10 min), auditing program performance (get_email_performance: summary / campaigns / flows), surfacing what to send next (get_email_ideas — ranks core campaigns, flow updates, newsjacking, trending), and generating images or GIFs (generate_image). Brand selection persists across sessions via set_active_brand (resolve fuzzy by name, or create from URL). Trigger skills by intent: ask 'audit <brand>', 'what should we send for <brand>?', or 'draft a <occasion> email for <brand>'. Explicit invocations: /kopi-email-marketing:audit-brand and /kopi-email-marketing:surface-email-ideas."
  }
}
EOF

exit 0
