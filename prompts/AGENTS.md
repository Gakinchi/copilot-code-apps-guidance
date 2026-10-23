# AGENTS.md

<!-- Copy to the repo root. Read by Copilot CLI, Claude Code and other agents. Keep the detailed rules in .github/copilot-instructions.md and point here; the nearest AGENTS.md in the tree wins. -->

This is a Power Apps Code App (Vite + [React/TypeScript]) published with the `pa` CLI (`@microsoft/power-apps-cli`). It runs in the user's browser inside the Power Apps player and reaches data only through Power Platform connectors.

Read `.github/copilot-instructions.md` first. The rules there apply to every agent, in every session, including subagents.

Non-negotiable:

- CLI is `pa`. Not `npx power-apps`, not `pac code`.
- Plan before code. One step at a time. Show diffs.
- No new connectors, data sources, packages or MCP servers without explicit approval.
- No secrets, ever, in files or prompts.
- `pa app push` only to Dev. Never merge.
- Hash routing; never `await getContext()` before first render; query-side filtering; environment variables for environment-specific values.
