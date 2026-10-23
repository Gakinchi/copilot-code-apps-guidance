# prompts/

Copyable agent context for a Power Apps Code App repo. All files are in English because agents read them; see ADR 0002.

| File | Copy to | Read by |
|---|---|---|
| `copilot-instructions.md` | `.github/copilot-instructions.md` | GitHub Copilot (CLI, IDE, coding agent, code review) |
| `AGENTS.md` | repo root | Copilot CLI, Claude Code and other agents; nearest file in the tree wins |
| `skills/add-connector/SKILL.md` | `.github/skills/add-connector/SKILL.md` | Copilot CLI (`/add-connector`), Claude Code (`.claude/skills/` also works) |

Replace every `[bracket]` and the verified-on date. Keep the files short; they are read every session.

Status 2026-10-23: written from the rules verified in the guidance's lab runs; not yet tested as a set in a lab Code App. See the "Til verifisering" note on the Instruksjoner og agenter page.
