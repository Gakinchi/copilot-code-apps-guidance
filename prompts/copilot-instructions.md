# Copilot instructions for this Power Apps Code App

<!-- Copy to .github/copilot-instructions.md in the app repo. Replace [brackets]. Keep it short; agents read it every session. -->

## What this repo is

A Power Apps Code App: a Vite + [React/TypeScript] single-page app that runs in the user's browser inside the Power Apps player, hosted by Power Platform. Data comes only through Power Platform connectors. The app is published with the `pa` CLI.

- App: [app name]. Owner: [team]. Environment: [environment display name] (Dev). Promotion to Test and Prod is done by the pipeline, never from a laptop.
- Toolchain verified on [YYYY-MM-DD]: `@microsoft/power-apps-cli` [x.y.z], `@microsoft/power-apps` [x.y.z], `@microsoft/power-apps-vite` [x.y.z], Node [NN] LTS, plugin `code-apps-preview@power-platform-skills` [x.y.z].

## Commands

- The CLI is `pa` (`npm install --global @microsoft/power-apps-cli`). Never suggest `npx power-apps` or `pac code`; both are outdated.
- Local run: `pa app run` (serves the Local Play URL). Build: `npm run build`. Publish to Dev: `pa app push` (CI does this on merge to `main`).
- Add a data source: `pa app add data-source --connector <connector> --connection-ref <logical_name> ...`. Always use `--connection-ref`; never bind to a raw connection ID.
- Refresh generated types after a table changes: `pa app refresh data-source --name <name>`.

## Code rules

- Use hash-based routing. The published app runs under a relative base with no SPA fallback.
- Never `await getContext()` before the first render; it only resolves inside the Power Apps player. Render first, then load context.
- Call connectors only through the generated services in `generated/`. Do not add HTTP clients or SDKs that bypass connectors.
- Filter and page in the query, not on the client. SharePoint returns at most 500/2000 rows for non-delegable queries; ID fields only support `=`.
- Values that differ between environments (site URLs, list names) are Power Platform environment variables (`@envvar:`), never constants in code.
- Authorization is enforced in Dataverse or in a flow, not in the UI. A hidden button is not a permission.
- No `catch` that swallows errors. Surface them to the user and let Monitor see them.
- Keep the connector surface small: at most 10 connectors and 20 connection references per app.

## Do not

- Do not add a connector, data source, npm package or MCP server without asking first and stating why.
- Do not edit `power.config.json` by hand. It is written by `pa`.
- Do not read, write or print secrets. There are none in this repo; `.env` files are ignored. Never paste keys into a prompt.
- Do not run `pa app push` against any environment other than Dev. Do not change environment, DLP, sharing or group settings.
- Do not merge pull requests. Open them with the plan as description and list what deviated from the plan.
- Do not run with `--allow-all` in this repo.
- Do not promise behaviour of preview features.

## Workflow

1. For any task, propose a plan first: files to change, why, and whether a new connector or data source is needed. Wait for approval.
2. Implement one step at a time and show the diff per file.
3. Write tests for what changed, using the existing test setup. Tests must be able to fail.
4. Run lint and tests before proposing a pull request.

## Language

Code, comments, commit messages and PR text in [English/Norwegian]. Product names, UI labels and commands stay in English.
