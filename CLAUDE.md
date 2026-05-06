# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

LSDO Build Template — a Salesforce DX project optimized for building Life Sciences Demo Org solutions with Claude Code. Clone this repo, connect an org, and use the slash commands below to sparr, spec, and deploy demos.

## Org

- Active org read from `sf config get target-org`
- Type: LSDO demo org — destructive operations permitted with explanation
- Session startup displays org status and customer folder state

## MCP Tools

- **Salesforce DX** — deploy, retrieve, SOQL, permission sets, LWC experts, code analysis
- **Salesforce Docs** — semantic search across Salesforce documentation
- **Slack** (optional) — canvas creation, channel search, handover briefs

Prefer MCP over CLI. Fall back to `sf` CLI if MCP unavailable.

## Build Boundaries

### Autonomous (no user input needed)
Custom objects, fields, record types, permission sets, Lightning apps, custom tabs, queues, business processes, paths, page layout field additions, data seeding via SFDMU, picklist value additions, list views.

### Gated (user confirms once per category, then autonomous)
Record-triggered flows, screen flows (≤5 linear screens), autolaunched flows, subflows, scheduled flows, platform-event-triggered flows, simple Apex, simple LWC, Agentforce agents via Agent Script.

### Always Manual (User Checklist)
Complex screen flows (branching, reactive formulas, custom LWC screens), orchestration flows, complex Apex/LWC, multi-agent orchestration, page layout visual arrangement, reports, dashboards, OmniStudio, screen-flow visual QA.

### NEVER Without Explicit Confirmation
Delete existing metadata or records. Modify profiles/permission sets not created this session. Touch `sb_` or `managed__` prefixed items. Modify the territory model. Overwrite Cinematic Universe data (`LS.*` External_IDs).

## Working Pattern

1. Retrieve current state before writing
2. Deploy in small increments
3. Verify after each deploy
4. Companion Permission Set after every structural deploy (`LSDO_[MT|PH]_[Feature]_Access`)
5. Two-attempt rule: if a deploy fails twice, STOP and record as SKIPPED
6. On failure: explain, fix, redeploy — or escalate to Salesforce Docs MCP

## Cinematic Universe

Golden records in `.claude/skills/lsdo-cinematic-universe/`. Reference products by **External ID** (`LS.MT.Product2.*`), never Salesforce Id. Personas, accounts, territories available for demo scenarios.

Key prefixes: `LS.MT.*` (MedTech), `LS.PH.*` (Pharma), `LSDO.User.*` (persona users).

## Slash Commands

| Command | Model | Purpose |
|---------|-------|---------|
| `/scout-sparring` | Opus | Discovery sparring + demo spec generation |
| `/scout-building` | Opus | Deploy a completed spec to an org |
| `/switch-org` | Sonnet | Change active demo org |
| `/setup-lsdo-build` | Sonnet | First-time project setup |
| `/lsdo-readiness` | Sonnet | Audit project against LSDO best practices |
| `/lsdo-cci` | Sonnet | Generate CumulusCI YAML + package |
| `/lsdo-data` | Sonnet | Seed or extract demo data (SFDMU) |
| `/lsdo-deploy` | Sonnet | Smart incremental deploy |
| `/lsdo-agent` | Opus | Guided Agentforce agent creation |
| `/lsdo-flow` | Sonnet | Guided flow builder |

## File Locations

| Path | Purpose |
|------|---------|
| `orgs/[alias]-[customer]/` | Per-org audit, spec, change logs |
| `.claude/skills/` | 52+ domain skills (auto-triggered by keywords) |
| `.claude/commands/` | Slash command definitions |
| `.claude/prompts/` | Sub-agent prompt templates |
| `.claude/agents/` | Strategic agents (DSE, code-architect, etc.) |
| `force-app/main/default/` | Salesforce metadata (SFDX package) |
| `datasets/sfdmu/` | SFDMU CSVs — source of truth for CU data |
| `unpackaged/config/cinematic_universe/` | Apex scripts (PBEs, users, territories) |

## Commands

```bash
npm run lint                    # ESLint on LWC/Aura JS
npm test                        # LWC Jest tests
npm run prettier                # Format all files
npm run prettier:verify         # Check formatting
npx tsx .claude/scripts/validate-skills.ts  # Validate skill format
```

```bash
sf project deploy start         # Deploy to default org
sf project retrieve start       # Retrieve from org
sf apex run                     # Run Apex interactively
sf data query -q "SELECT ..."   # Execute SOQL
```

Pre-commit hooks (Husky + lint-staged) run Prettier, ESLint, and Jest automatically.

## Key Skills (Auto-Triggered)

- **building-lsdo** — LSDO naming conventions, permission sets, record types, planning
- **building-life-sciences-cloud** — LSC standard objects, data model, APIs
- **lsdo-cinematic-universe** — Makana MedTech personas, products, accounts, stories
- **managing-medtech-territories** — Territory2 hierarchy, user assignments, PATI
- **developing-agentforce** — Agent Script syntax, AiAuthoringBundle, deploy
- **using-cumulusci** — CCI tasks, flows, YAML syntax, dataset operations
- **migrating-sfdmu-data** — SFDMU export.json, data migration between orgs
- **lsdo-deployment-rules** — Build boundaries, two-attempt rule, rollback commands
- **lsdo-org-audit** — Org audit format with CU data checks
- **generating-flow** — Salesforce Flow XML generation with validation

## LSDO Naming Conventions

- Custom objects: `LSDO_MT_*__c` (MedTech) or `LSDO_PH_*__c` (Pharma)
- Permission sets: `LSDO_[MT|PH]_[Feature]_Access`
- Flows: `LSDO_[MT|PH]_[Object]_[Trigger]`
- Lightning apps: `LSDO_MT_*` or `LSDO_PH_*`
- External IDs: `LS.MT.*` (records), `LSDO.User.*` (personas)

## Cinematic Universe Deployment

```bash
# Full deploy (CumulusCI + SFDMU + Apex)
export TARGET_ORG_ALIAS=<alias>
cci flow run deploy_cinematic_universe --org <alias>

# Data only (skip territory + users)
cci flow run deploy_cinematic_universe_data_only --org <alias>

# Re-sync CSVs from source org
cci task run extract_cinematic_universe --org NOICE
```

See CONTRIBUTING.md for the full architecture table and iteration workflow.
