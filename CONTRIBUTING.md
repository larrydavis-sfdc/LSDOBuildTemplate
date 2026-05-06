# CONTRIBUTING.md

Guide for skill maintainers, template contributors, and those extending the LSDO Build Template.

## Karpathy Coding Principles

These four principles govern every coding task in this repo and take precedence over default behavior.

### 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them — don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

### 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it — don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

### 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan with steps and verification checkpoints.

---

## Skill Format

Every skill lives in `.claude/skills/<name>/` and must have a `SKILL.md` with YAML frontmatter:

```markdown
---
name: <kebab-case-name>    # must match directory name
description: "..."         # 20–1024 chars; must contain "use"; used for trigger matching
---

<skill body>
```

### Rules

- Directory name: kebab-case, ≤64 chars, first word should end in `-ing` (gerund)
- No nested skill directories (exactly one level under `skills/`)
- Body must be non-empty, ideally under 500 lines
- Skills may include a `references/` subdirectory with lookup files the skill body directs Claude to read
- Description must include "use" — this is required for trigger matching

### Validation

```bash
npx tsx .claude/scripts/validate-skills.ts

# Validate only skills changed vs main
npx tsx .claude/scripts/validate-skills.ts --changed --base=origin/main
```

---

## Skill Index

### Agentforce
- [developing-agentforce](.claude/skills/developing-agentforce/SKILL.md) — build and deploy agents with Agent Script
- [testing-agentforce](.claude/skills/testing-agentforce/SKILL.md) — write and run Agentforce test suites
- [observing-agentforce](.claude/skills/observing-agentforce/SKILL.md) — monitor and debug live agent sessions

### Life Sciences
- [building-life-sciences-cloud](.claude/skills/building-life-sciences-cloud/SKILL.md) — work with LSC standard objects and data model
- [building-lsdo](.claude/skills/building-lsdo/SKILL.md) — create metadata and data for Life Sciences Demo Org
- [managing-medtech-territories](.claude/skills/managing-medtech-territories/SKILL.md) — manage Territory2 hierarchy and user alignments
- [lsdo-cinematic-universe](.claude/skills/lsdo-cinematic-universe/SKILL.md) — reference Makana MedTech personas and demo stories
- [lsdo-deployment-rules](.claude/skills/lsdo-deployment-rules/SKILL.md) — canonical deployment rules for LSDO builds
- [lsdo-org-audit](.claude/skills/lsdo-org-audit/SKILL.md) — org audit format and procedure

### UI Bundle (React)
- [building-ui-bundle-app](.claude/skills/building-ui-bundle-app/SKILL.md) — build full UI Bundle React application
- [building-ui-bundle-frontend](.claude/skills/building-ui-bundle-frontend/SKILL.md) — develop UI Bundle frontend components
- [generating-ui-bundle-features](.claude/skills/generating-ui-bundle-features/SKILL.md) — generate UI Bundle feature modules
- [generating-ui-bundle-metadata](.claude/skills/generating-ui-bundle-metadata/SKILL.md) — generate Salesforce metadata for UI Bundle
- [generating-ui-bundle-site](.claude/skills/generating-ui-bundle-site/SKILL.md) — generate UI Bundle Experience Cloud site
- [deploying-ui-bundle](.claude/skills/deploying-ui-bundle/SKILL.md) — deploy UI Bundle to a Salesforce org
- [implementing-ui-bundle-agentforce-conversation-client](.claude/skills/implementing-ui-bundle-agentforce-conversation-client/SKILL.md) — add Agentforce chat to UI Bundle
- [implementing-ui-bundle-file-upload](.claude/skills/implementing-ui-bundle-file-upload/SKILL.md) — implement file upload in UI Bundle
- [using-ui-bundle-salesforce-data](.claude/skills/using-ui-bundle-salesforce-data/SKILL.md) — query and wire Salesforce data in UI Bundle

### Lightning Web Components
- [sf-lwc-development](.claude/skills/sf-lwc-development/SKILL.md) — develop Salesforce Lightning Web Components
- [sf-lwc-design](.claude/skills/sf-lwc-design/SKILL.md) — apply SLDS design patterns to LWC
- [sf-lwc-styling](.claude/skills/sf-lwc-styling/SKILL.md) — style LWC with SLDS tokens and CSS
- [sf-lwc-theming](.claude/skills/sf-lwc-theming/SKILL.md) — implement theming and brand customization in LWC
- [sf-lwc-ux](.claude/skills/sf-lwc-ux/SKILL.md) — apply UX best practices in LWC
- [sf-lwc-motion](.claude/skills/sf-lwc-motion/SKILL.md) — add animation and motion to LWC
- [sf-lwc-dataviz](.claude/skills/sf-lwc-dataviz/SKILL.md) — build data visualizations and charts in LWC
- [sf-lwc-mobile](.claude/skills/sf-lwc-mobile/SKILL.md) — optimize LWC for mobile and offline
- [sf-lwc-review](.claude/skills/sf-lwc-review/SKILL.md) — review LWC code for quality and standards
- [sf-lwc-content](.claude/skills/sf-lwc-content/SKILL.md) — write microcopy, error messages, and UI text for LWC
- [sf-lwc-experience](.claude/skills/sf-lwc-experience/SKILL.md) — design LWC for Experience Cloud
- [sf-lwc-page-composition](.claude/skills/sf-lwc-page-composition/SKILL.md) — design App Builder-aware, configurable LWC
- [uplifting-components-to-slds2](.claude/skills/uplifting-components-to-slds2/SKILL.md) — migrate components from SLDS 1 to SLDS 2

### Apex
- [generating-apex](.claude/skills/generating-apex/SKILL.md) — generate Apex classes and business logic
- [generating-apex-test](.claude/skills/generating-apex-test/SKILL.md) — generate Apex unit test classes
- [sf-apex-development](.claude/skills/sf-apex-development/SKILL.md) — develop Apex following Salesforce best practices
- [trigger-refactor-pipeline](.claude/skills/trigger-refactor-pipeline/SKILL.md) — refactor Apex triggers to handler pattern

### Salesforce Metadata
- [generating-custom-lightning-type](.claude/skills/generating-custom-lightning-type/SKILL.md) — generate Custom Lightning Types for Einstein Agent actions
- [generating-custom-object](.claude/skills/generating-custom-object/SKILL.md) — generate custom object metadata XML
- [generating-custom-field](.claude/skills/generating-custom-field/SKILL.md) — generate custom field metadata XML
- [generating-custom-tab](.claude/skills/generating-custom-tab/SKILL.md) — generate custom tab metadata XML
- [generating-flexipage](.claude/skills/generating-flexipage/SKILL.md) — generate FlexiPage Lightning page metadata
- [generating-list-view](.claude/skills/generating-list-view/SKILL.md) — generate list view metadata XML
- [generating-validation-rule](.claude/skills/generating-validation-rule/SKILL.md) — generate validation rule metadata XML
- [generating-permission-set](.claude/skills/generating-permission-set/SKILL.md) — generate permission set metadata XML
- [generating-custom-application](.claude/skills/generating-custom-application/SKILL.md) — generate custom Lightning app metadata
- [generating-lightning-app](.claude/skills/generating-lightning-app/SKILL.md) — generate Lightning app bundle metadata
- [generating-flow](.claude/skills/generating-flow/SKILL.md) — generate Salesforce Flow metadata XML

### Data & Deployment
- [using-cumulusci](.claude/skills/using-cumulusci/SKILL.md) — run CumulusCI tasks, flows, and scratch org operations
- [migrating-sfdmu-data](.claude/skills/migrating-sfdmu-data/SKILL.md) — build SFDMU export.json and migrate demo data
- [sf-cli-deployment](.claude/skills/sf-cli-deployment/SKILL.md) — deploy metadata with Salesforce CLI
- [switching-org](.claude/skills/switching-org/SKILL.md) — switch between Salesforce orgs and aliases

### Territory Model Data
- [medtech-territory-model](.claude/skills/medtech-territory-model/SKILL.md) — load MedTech territory hierarchy docs and SFDMU CSV exports

### Commerce & Other
- [creating-b2b-commerce-store](.claude/skills/creating-b2b-commerce-store/SKILL.md) — set up a B2B Commerce store
- [searching-media](.claude/skills/searching-media/SKILL.md) — search for and retrieve media assets

### Agents
- [sf-dse](.claude/agents/DSE/SKILL.md) — Distinguished Solutions Engineer strategic agent

---

## Cinematic Universe Deployment Architecture

CumulusCI orchestrates the flow. SFDMU handles all data (resolves complex relationships natively). Apex handles PricebookEntries, persona user creation, territory assignments, and Rachel Shell enrichment.

### Install Prerequisites

```bash
brew install pipx && pipx ensurepath && pipx install cumulusci
cci org import NOICE NOICE        # import source org from sf CLI
cci org import <target> <alias>   # import target org
```

### Deploy Commands

```bash
# Full deploy
export TARGET_ORG_ALIAS=<sf-org-alias>
cci flow run deploy_cinematic_universe --org <alias>

# Data only (skip territory model + user creation)
export TARGET_ORG_ALIAS=<sf-org-alias>
cci flow run deploy_cinematic_universe_data_only --org <alias>

# Re-sync CSVs from NOICE
cci task run extract_cinematic_universe --org NOICE
```

### Architecture Table

| Layer | Tool | Handles |
|-------|------|---------|
| Orchestration | CumulusCI | Flow sequencing, org management |
| Data records | SFDMU | Products, Accounts, Contacts, Opps + OLIs + OCRs, Assets, Cases |
| Provider accounts | Apex | Facility + physician Person Accounts, territory alignments, PATI |
| Location + Address | Apex | Hospital/clinic locations, OR/cath lab sub-locations, asset placement |
| LSC provider model | Apex | HealthcareProvider, NPI, Specialty, facility affiliation |
| Care taxonomy | Apex | CMS NUCC crosswalk corrections to CareTaxonomy hierarchy |
| Provider taxonomy | Apex | HealthcareProviderTaxonomy links physicians to NUCC codes |
| Business licenses | Apex | Physician MD + DEA licenses, facility operating licenses |
| Territory model | SFDMU | Territory2, UserTerritory2Association, ObjectTerritory2Association, PATI |
| PricebookEntries | Apex | Idempotent insert resolving Product2 IDs dynamically |
| Rachel Shell | Apex | PersonTitle + AccountContactRelation to United Hospital |
| Persona users | Apex | 7 internal personas with org-domain-aware usernames |
| Territory assignments | Apex | Sasha → TM leaf, Morgan → RD root |
| Permission sets | Apex | LSDO_MT_Cinematic_Universe pset → admins + Carmen + Ezra |

### Iteration Workflow

1. Make the change in NOICE (via the UI, SFDMU, or Apex)
2. `cci task run extract_cinematic_universe --org NOICE`
3. Commit `datasets/sfdmu/*.csv`
4. `export TARGET_ORG_ALIAS=<target> && cci flow run deploy_cinematic_universe --org <target>`

### Key Files

| File | Purpose |
|------|---------|
| `cumulusci.yml` | CCI tasks and flows |
| `datasets/sfdmu/export.json` | SFDMU master config (extract + load) |
| `datasets/sfdmu/` | Extracted CSVs — source of truth for all CU data |
| `unpackaged/config/cinematic_universe/` | Apex scripts (PBEs, users, territories, Rachel Shell) |

---

## Project Structure

```
.claude/
├── agents/          # Strategic agents (DSE, code-architect, etc.)
├── commands/        # Slash command definitions
├── hooks/           # Session startup hook
├── prompts/         # Sub-agent prompt templates
├── scripts/         # Validation, sync scripts
├── skills/          # 52+ domain skills
└── skills-manifest.yaml  # External community skill declarations
force-app/main/default/   # Salesforce metadata (SFDX)
datasets/sfdmu/            # SFDMU data CSVs
orgs/                      # Per-org audit/spec/change folders
```

---

## Adding a New Skill

1. Create `.claude/skills/<name>/SKILL.md` with frontmatter
2. First word of directory name should be a gerund (`-ing`)
3. Description must contain "use" and be 20–1024 chars
4. Add a `references/` subdirectory if the skill needs lookup files
5. Run `npx tsx .claude/scripts/validate-skills.ts` to verify
6. Add to the Skill Index above under the appropriate category

---

## Adding a New Slash Command

1. Create `.claude/commands/<name>.md`
2. Include model preference in the prompt (opus for discovery/orchestration, sonnet for execution)
3. Reference relevant skills and prompts
4. Test by running `/<name>` in a Claude Code session

---

## Community Skills (External)

Declared in `.claude/skills-manifest.yaml`. Synced via:

```bash
bash .claude/scripts/sync-skills.sh
```

These pull skills from external repos (e.g., forcedotcom/afv-library) into `.claude/skills/`.
