# LSDO Build Template

Build Life Sciences Demo Org solutions with AI-assisted development. This template gives you a pre-configured Salesforce DX project with 52+ Claude Code skills, MCP server integrations, and guided workflows for sparring, speccing, and deploying demos.

## Prerequisites

- macOS (Apple Silicon or Intel)
- A Life Sciences Demo Org (LSDO) with admin access
- Claude Code installed via the LLMGW installer (see the "Installing Claude Code for Solutions" canvas)

## Quick Start


# 1. Clone this template
```bash
git clone https://github.com/larrydavis-sfdc/LSDOBuildTemplate/ my-lsdo-project
cd my-lsdo-project
```

# 2. Run the installer (installs dependencies, configures MCP, syncs skills)
```bash
bash install.sh
```

# 3. Open in VS Code or Cursor
```bash
code .
```
_or_
```bash
cursor .
```

# 4. Start Claude Code and run first-time setup
```bash
/setup-lsdo-build
```

The setup command will:
- Connect your LSDO demo org
- Verify MCP server connectivity
- Create your org folder for audits and specs
- Confirm everything is ready

## How It Works

The LSDO Build Template uses a **sparr, spec, deploy** workflow:

### 1. Sparring (`/scout-sparring`)

Start here. The sparring session (powered by Opus) will:
- Audit your connected org (what's already there)
- Ask about your customer, their pain points, and demo goals
- Research relevant Salesforce capabilities
- Propose a demo scenario leveraging Makana MedTech's Cinematic Universe
- Generate a structured **demo spec** saved to your org folder

Think of sparring as your AI discovery partner — it knows the LSDO data model, personas, and products.

### 2. Building (`/scout-building`)

Once you have a spec, the building orchestrator will:
- Parse your spec into deployment phases
- Deploy structural metadata (objects, fields, tabs, permission sets)
- Deploy logic (flows, Apex, LWC) with your confirmation
- Deploy Agentforce agents if specified
- Verify everything works and generate a change log with rollback commands

### 3. Iterating

For ongoing development after the initial build:
- `/lsdo-deploy` — deploy incremental changes without a full spec
- `/lsdo-flow` — build a flow interactively with guided steps
- `/lsdo-agent` — create an Agentforce agent with a wizard
- `/lsdo-data` — seed or extract demo data

## All Commands

| Command | What It Does |
|---------|--------------|
| `/scout-sparring` | Discovery sparring + demo spec generation |
| `/scout-building` | Deploy a completed spec to your org |
| `/switch-org` | Change which demo org you're working with |
| `/setup-lsdo-build` | First-time project setup |
| `/lsdo-readiness` | Audit your project against LSDO best practices |
| `/lsdo-deploy` | Smart incremental deploy (no spec needed) |
| `/lsdo-data` | Seed or extract demo data via SFDMU |
| `/lsdo-agent` | Guided Agentforce agent creation |
| `/lsdo-flow` | Guided flow builder |
| `/lsdo-cci` | Generate CumulusCI YAML for packaged deployment |

## Project Structure

```
my-lsdo-project/
├── force-app/main/default/    # Salesforce metadata you build
├── datasets/sfdmu/            # Demo data CSVs (Cinematic Universe)
├── orgs/                      # Per-org audits, specs, and change logs
│   ├── [alias]-[customer]/    # Created per customer engagement
│   ├── sparring-lessons.md    # Accumulated sparring insights
│   └── building-lessons.md    # Accumulated build insights
├── .claude/
│   ├── skills/                # 52+ AI skills (auto-triggered)
│   ├── commands/              # Slash command definitions
│   ├── prompts/               # Sub-agent templates
│   └── hooks/                 # Session startup automation
├── .mcp.json                  # MCP server configuration
├── install.sh                 # One-time setup script
├── CLAUDE.md                  # AI instructions (don't edit)
└── CONTRIBUTING.md            # For skill maintainers
```

## What's the Cinematic Universe?

The template includes golden demo data for **Makana MedTech** — a fictional life sciences company with:

- **7 personas** (sales reps, managers, clinical specialists)
- **12 products** (surgical robots, imaging systems, implants)
- **8 accounts** (hospitals, health systems, GPOs)
- **Territory model** (regions, districts, territories with user assignments)
- **Competitors** (Konkurrent Medical with competitive positioning)

When you sparr with Claude, it knows these personas and products and will suggest demo scenarios that use them. This means your demos tell a cohesive story across the LSDO ecosystem.

Data references use External IDs (`LS.MT.Product2.*`, `LS.MT.Account.*`) so they work across any LSDO org that has the Cinematic Universe deployed.

## Working with Your Org

### Connecting

```bash
sf org login web --alias my-demo --set-default
```

Or use `/switch-org` inside Claude Code to interactively pick or connect an org.

### Multiple Customers

Each customer engagement gets its own folder under `orgs/`:

```
orgs/my-demo-acme-health/
├── audit-2026-05-05-1430.md    # Org state at time of audit
├── spec-surgical-workflow.md    # Demo spec from sparring
└── changes-2026-05-05-1445.md  # What was deployed + rollback commands
```

### What Claude Can and Can't Do

**Deploys autonomously** (no permission needed):
Custom objects, fields, record types, permission sets, tabs, apps, queues, data seeding, picklist values, list views.

**Asks once, then autonomous** (gated):
Flows, simple Apex, simple LWC, Agentforce agents.

**Always needs your input** (manual):
Complex flows with branching, orchestrations, page layout arrangement, reports/dashboards.

**Will never touch without explicit confirmation**:
Deleting metadata. Modifying the territory model. Overwriting Cinematic Universe data. Touching managed packages.

## Deploying the Cinematic Universe

If your LSDO org doesn't have the Cinematic Universe data yet:

```bash
# Full deploy (requires CumulusCI)
export TARGET_ORG_ALIAS=my-demo
cci flow run deploy_cinematic_universe --org my-demo

# Data only (skip territory model + persona users)
cci flow run deploy_cinematic_universe_data_only --org my-demo
```

Or use `/lsdo-data` for guided data operations without CumulusCI.

## Tips

- **Start with `/scout-sparring`** even if you know what you want to build. The audit phase catches conflicts early.
- **Check `/lsdo-readiness`** before sharing your org. It catches naming issues, missing permission sets, and data gaps.
- **Review change logs** in your org folder. Every deployment includes rollback commands if you need to undo something.
- **Lessons files accumulate wisdom.** If Claude makes a mistake during sparring or building, it records the lesson so it won't repeat it.
- **You can always say no.** Claude will ask before deploying anything in the "gated" category. If something looks wrong, reject it.

## Troubleshooting

| Problem | Fix |
|---------|-----|
| "No LLMGW auth token" on startup | Run the Claude Code installer from the Solutions canvas |
| "No default Salesforce org set" | `sf org login web --alias my-demo --set-default` |
| MCP tools not working | Check `.mcp.json` exists; restart Claude Code session |
| Slack MCP not connected | Run `/mcp`, select 'slack', choose 'Authenticate' |
| Deploy fails twice | Claude will stop automatically (two-attempt rule) and suggest next steps |
| Community skills missing | Run `bash .claude/scripts/sync-skills.sh` |

## Acknowledgments & Sources

This template was built on the shoulders of:

- **[sf-demo-scout](https://github.com/seb-schi/sf-demo-scout)** by Sebastian Schilling — the original sparring/building workflow pattern, sub-agent orchestration, session hooks, and org folder conventions that inspired this template's architecture
- **[Agentforce Validation (AFV) Library](https://github.com/forcedotcom/afv-library)** — community-maintained Salesforce skills (sf-flow, sf-apex, sf-lwc, sf-deploy, etc.) synced via the skills manifest
- **[Salesforce MCP](https://github.com/salesforce/salesforce-mcp)** — the Model Context Protocol server for Salesforce DX operations (metadata, data, SOQL, permissions, code analysis)
- **[SFDMU](https://github.com/forcedotcom/SFDX-Data-Move-Utility)** — Salesforce Data Move Utility for External_ID-based data migration between orgs
- **[CumulusCI](https://github.com/SFDO-Tooling/CumulusCI)** — flow orchestration for complex multi-step deployments

## Further Reading

- [CONTRIBUTING.md](CONTRIBUTING.md) — for skill maintainers and template contributors
- [CHANGELOG.md](CHANGELOG.md) — what's new in this template version
- [orgs/README.md](orgs/README.md) — org folder conventions
