---
name: setup-lsdo-build
description: >
  First-time setup for LSDO Build Template. Connects demo org, verifies MCP,
  checks Slack auth, creates starter files. Run once after cloning.
model: sonnet
allowed-tools: Bash, Read, Write, mcp__Salesforce_DX__list_all_orgs, mcp__Salesforce_DX__run_soql_query
---

# LSDO Build Template — First-Time Setup

You are completing the one-time setup for an LSDO builder.
Project files are already in place. Your job: connect the demo org and verify connectivity.

## Step 0: Slack MCP Auth Check

Detect Slack MCP auth state:

```bash
security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null | \
  python3 -c "import json,sys; d=json.loads(sys.stdin.read()); oauth=d.get('mcpOAuth',{}); slack=[k for k in oauth if k.startswith('slack')]; tok=oauth[slack[0]].get('accessToken') if slack else None; print('authenticated' if tok else 'needs_auth')" 2>/dev/null || echo "needs_auth"
```

- `authenticated` → "Slack MCP is authenticated. Proceeding to org setup."
- `needs_auth` →
  > "Slack MCP needs authentication (powers canvas lookups during sparring).
  >
  > Run `/mcp` in this session. Select 'slack', hit Enter. A browser will open — log in with 'Salesforce Internal'.
  >
  > When done, type `continue`. Or type `skip` to proceed without Slack."

Wait for reply. If `continue`, re-check. If `skip`, proceed.

## Step 1: Check for Existing Org Connection

```bash
sf config get target-org --json
sf org display --json
```

If org is authenticated and healthy:
> "Found existing org connection: [alias] ([username]). Skipping login."
Skip to Step 3.

If no org or auth expired, proceed to Step 2.

## Step 2: Connect Demo Org

```bash
sf org list
```

Show available orgs. Ask user to pick one or login new:
> "Which org should be your default? Pick from the list, or type **new** to connect a fresh org."

If new:
```bash
sf org login web --alias [user-provided-alias] --set-default
```

If existing:
```bash
sf config set target-org [chosen-alias]
```

## Step 3: Verify MCP Connectivity

Call `run_soql_query` with: `SELECT Id, Name FROM Organization LIMIT 1`

- Success → "MCP verified against [OrgName]."
- Failure → "⚠️ MCP not responding. Restart VS Code (CMD+Q) and re-run /setup-lsdo-build."

## Step 4: Create Starter Files

Ensure these exist (don't overwrite if present):
- `orgs/sparring-lessons.md`
- `orgs/building-lessons.md`

## Step 5: Welcome

> "✅ **LSDO Build Template is ready.**
>
> **Your org:** [alias] ([username])
> **MCP:** Connected
> **Slack:** [Authenticated / Not configured]
>
> **Next steps:**
> - `/scout-sparring` — Start discovery and spec generation
> - `/lsdo-readiness` — Check your org against LSDO best practices
> - `/lsdo-data` — Seed Cinematic Universe demo data
>
> **Quick reference:**
> - `/switch-org` — Change demo org
> - `/lsdo-deploy` — Deploy changed metadata
> - `/lsdo-agent` — Build an Agentforce agent
> - `/lsdo-flow` — Build a flow interactively
> - `/lsdo-cci` — Generate CumulusCI config"
