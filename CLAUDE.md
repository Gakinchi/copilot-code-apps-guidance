# copilot-code-apps-guidance

Norwegian adoption guidance for using GitHub Copilot together with Power Apps
Code Apps, modelled on Microsoft's Power Platform guidance and GitHub's "Roll out
Copilot at scale". Owner: Dennis Chi (recursion.no). Site: MkDocs Material,
deployed to GitHub Pages from `main`. Plan of record:
`~/.claude/plans/la-oss-si-at-melodic-piglet.md` (2026-10-23).

## Language

- Prose in Norwegian bokmaal. Product names, UI labels, CLI commands, package
  names, file names and code stay in English exactly as the product shows them.
- Respond to Dennis in Norwegian when he writes Norwegian.
- Write Norwegian characters through the Write/Edit tools or Python with
  explicit UTF-8, never through a Bash heredoc (double-encoding has happened).
- Line endings LF (`.gitattributes` enforces it).

## Product naming (from the sibling repos, confirmed by Microsoft 2026-09-30)

- **Power Apps Code Apps** and **Copilot Managed Runtime** (also called Managed
  Apps) are two different products. Never "Code Apps 2.0". Approved sentence:
  "The product team has confirmed that Code Apps will be kept, with its own
  backlog and its own Office Hours. It will not get the built-in database or
  the middle tier, and the two SDKs will not merge."
- This guidance is about Code Apps. Copilot Managed Runtime appears only in
  `docs/start/produktene.md` and in rows explicitly labelled as such.
- Always name the app type (canvas, model-driven, Code App, managed app) and the
  actor (a maker in Studio, a developer with the `pa` CLI, a business user) in
  every claim.
- Code Apps CLI today: `@microsoft/power-apps-cli`, command `pa` (`pa app init`,
  `pa app run`, `pa app push`, `pa app add data-source`). `npx power-apps` and
  `pac code` are gone/deprecated; do not teach them. Verified by running on
  2026-10-23 with CLI 1.3.0.
- GitHub Copilot: distinguish Copilot CLI (`copilot`, the terminal agent),
  Copilot in VS Code (Chat, agent mode), and the plans (Copilot Business,
  Copilot Enterprise). Claude Code is shown as the alternative agent where Learn
  does ("the same plugin, prompts and CLI commands apply"), never as the primary
  path.

## Provenance labels (every product claim carries one)

Front matter on every page: `verifisert: YYYY-MM-DD` and `kilde:` with one of
`PÅ LEARN`, `GITHUB DOCS`, `SETT I PREVIEW`, `PRODUKTTEAM`, `EGEN TEST`. Inline,
mark statements that are not on Learn or GitHub Docs with an admonition
(`!!! note "Sett i preview"` or `!!! warning "Til verifisering"`). Never
upgrade a community or preview observation to "PÅ LEARN".

## Facts move weekly

Verify every Microsoft claim with the Microsoft Learn MCP
(`microsoft_docs_search`, then `microsoft_docs_fetch`) and every GitHub claim
against docs.github.com before it ships; put the URL in the page's "Kilder"
section with the date. Commands are run in `lab/` (gitignored) before they are
published; screenshots come from that run (`tools/termshot.ps1`,
`tools/termpost.py`, `tools/annotate.py`). Record CLI and plugin versions in the
page. `tools/stale-check.py` lists pages older than 90 days; run it before a
release.

## Never assume licensing

Every setup procedure includes a verification step for licences and connector
access (GitHub Copilot seat, Power Apps Premium or pay-as-you-go, premium
connectors, DLP). State the licence need, never the price as a fact without a
dated source.

## No real identifiers

No tenant IDs, environment IDs, app IDs, connection IDs, user e-mails or
customer names in `docs/`, `templates/`, `prompts/` or screenshots. Use
placeholders such as `<environment-id>`; blur identifiers in pictures
(`tools/termpost.py` does it for terminal shots). Grep for GUID shapes before
every commit. Customer cases are anonymised unless consent is recorded in the
case page.

## Page shape

Front matter (`title`, `tags` with one or more of `leder`, `arkitekt`,
`utvikler`, `verifisert`, `kilde`), then "Hvem denne siden er for" in one or two
sentences, the content, "Neste steg" with links, and "Kilder" with dated URLs.
Procedures are numbered Action/Check steps with one screenshot each. Tables for
comparisons, admonitions for caveats, Mermaid for flows.

## Reader tracks

`leder` (business case, risk, licence, measurement), `arkitekt` (strategy,
roles, governance, rollout, operations), `utvikler` (daily workflow, setup,
rules, prompts, skills). The `start/` pages are the curated reading paths; the
tags plugin renders the full per-track index.

## Build

`pip install -r requirements.txt`, `mkdocs serve` to preview,
`mkdocs build --strict` before pushing (CI runs the same). Link check runs on
PRs (lychee). Deploy is automatic from `main` via `mkdocs gh-deploy`.
