---
name: add-connector
description: Add a Power Platform connector or data source to this Code App safely. Use when asked to connect the app to Dataverse, SharePoint, Office 365 or any other connector. Checks DLP and licensing before running pa commands.
---

# Add a connector to this Code App

<!-- Copy the folder to .github/skills/add-connector/ in the app repo. Invoke with "/add-connector ..." in Copilot CLI. -->

Follow these steps in order. Stop and report at any step that fails; do not work around it.

1. **Confirm the ask.** Restate which connector and which table, list or action the user wants, and what the app will do with it. If the same data is already reachable through an existing data source in `generated/`, say so and stop.

2. **Check the environment allows it.** Run `pa connection list` and look for an existing connection for the connector. If there is none, say that the user (not you) must create one with `pa connection create` or in the maker portal, and that the connector must be allowed by the environment's DLP policy. Do not guess that DLP allows it; a blocked connector fails at runtime.

3. **Check licensing in one sentence.** Dataverse and most non-Microsoft 365 connectors are Premium: every end user of the app needs Power Apps Premium, pay-as-you-go or an App Pass. State this and ask the user to confirm before continuing.

4. **Add with a connection reference.** Run:

   ```console
   pa app add data-source --connector <connector> --connection-ref <logical_name> --table <table> [--dataset <dataset>]
   ```

   Use `@envvar:<name>` for the dataset or table when the value differs between environments. Never bind to a raw connection ID.

5. **Verify the generated service.** Open the new files in `generated/` and summarise the service methods and model types. Do not edit generated files.

6. **Use it correctly.** When writing code against the service: filter and page in the query, not on the client; handle errors visibly; keep the connector count at or below 10.

7. **Report.** List the files changed, the connector and connection reference name, and remind the user that the pull request must state the new connector so the reviewer can check it against DLP.
