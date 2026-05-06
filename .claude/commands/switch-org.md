---
name: switch-org
description: >
  Switch to a different Salesforce demo org.
model: sonnet
allowed-tools: Bash, Read, mcp__Salesforce_DX__run_soql_query
---

Switch to a different Salesforce demo org. Follow these steps:

1. Run `sf org list` to show all available orgs.
2. Ask the user which org they want to use (show the list with aliases and usernames). After the list:
   > "Pick an org from the list, or type **new** to connect a different org."
3. If the user picks an existing org, skip to step 5.
   If the user types "new" or names an org not in the list, ask for an alias, then:
   > "I'll open a browser now — log in with your demo org credentials."
   Run (foreground — wait for completion):
   ```
   sf org login web --alias [name] --set-default
   ```

4. Set the chosen org as default (local scope — writes to `.sf/config.json`):
   ```
   sf config set target-org [chosen-alias]
   ```

5. Get org details:
   ```
   sf org display --target-org [chosen-alias] --json
   ```
   Extract: Alias, Username, Org ID (18-char), Instance URL.

6. Check for existing org folders:
   ```
   ls -d orgs/[chosen-alias]-*/ 2>/dev/null
   ```
   - Folders exist → list them: "Found customer folder(s) for [alias]: [list]. Run /scout-sparring to continue."
   - No folders → "No customer folders yet. Run /scout-sparring to start."

7. Verify MCP connectivity:
   Call `run_soql_query` with: `SELECT Id, Name FROM Organization LIMIT 1`
   - Returned Id matches Org ID from step 5 → MCP verified:
     > "Switched to [alias] ([username]). MCP verified — ready to go."
   - Id doesn't match → MCP still on old org:
     > "Switched to [alias] ([username]).
     > ⚠️ MCP is still connected to the previous org. Restart VS Code (CMD+Q) — MCP picks up org changes on startup."
   - MCP fails:
     > "Switched to [alias] ([username]).
     > ⚠️ MCP is not responding. Restart VS Code (CMD+Q) to initialize MCP."
