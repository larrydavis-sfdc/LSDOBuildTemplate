---
name: lsdo-deployment-rules
description: "Canonical deployment rules for LSDO Build Template. Use this skill when deploying metadata to an LSDO org — covers build boundaries (autonomous/gated/manual/never), two-attempt rule, companion permission set pattern, rollback commands, and script deliverable rules. TRIGGER when: a sub-agent needs deployment rules, or during /scout-building phases. DO NOT TRIGGER when: during sparring or for general Salesforce development questions."
---

# LSDO Deployment Rules

## Build Boundaries

### Autonomous (no user input needed)
- Custom objects, fields, record types
- Permission sets and assignment
- Lightning apps, custom tabs
- Queues with object routing
- Business Processes (stage/status subsets)
- Paths (PathAssistant)
- Page layout field additions (active layout only — query ProfileLayout first)
- Data seeding via SFDMU (idempotent upsert by External_ID)
- Picklist value additions to existing fields
- List views

### Gated (user confirms once per category, then autonomous)
- Record-triggered flows (before-save, after-save, before-delete; any object)
- Screen flows (≤5 linear screens; whitelisted components only)
- Autolaunched flows
- Subflows
- Scheduled flows (user provides startDate, startTime, frequency)
- Platform-event-triggered flows
- Simple Apex (single-trigger, single-object)
- Simple LWC (demo-specific UI)
- Agentforce agents via Agent Script

### Always Manual (User Checklist)
- Complex screen flows (branching, reactive formulas, custom LWC screen components)
- Orchestration flows
- Complex Apex/LWC
- Multi-agent orchestration
- Page layout visual arrangement (field positioning in App Builder)
- Reports, dashboards, OmniStudio
- Screen-flow visual QA

### NEVER Without Explicit User Confirmation
- Delete existing metadata or records
- Modify existing profiles or permission sets not created by this session
- Touch anything prefixed `sb_` or `managed__`
- Modify the territory model (Territory2, UserTerritory2Association, ObjectTerritory2Association)
- Overwrite Cinematic Universe data (records with `LS.*` External_IDs)

---

## Two-Attempt Rule

If a deployment fails twice:
1. STOP that item
2. Record it as SKIPPED with the error message
3. Continue with remaining items
4. Do not wrestle with a broken deploy

---

## Unfamiliar Error Escalation

If an error message is not self-evident and not in `building-lessons.md`:
1. Consult Salesforce Docs MCP (`salesforce_docs_search`) BEFORE the second attempt
2. Record the consultation (question, URL, verdict)
3. If docs provide a fix, apply it for attempt 2
4. If docs don't help, skip after attempt 2

---

## Companion Permission Set — MANDATORY

After every deployment creating objects, fields, record types, tabs, or apps:

Generate a permission set with LSDO naming: `LSDO_[MT|PH]_[Feature]_Access`

Include:
- Object CRUD for all new custom objects
- Field Read + Edit FLS for all new fields (**EXCLUDE Required fields** — API rejects FLS on required)
- RecordTypeVisibility: visible=true for new record types
- TabVisibility: **Visible** for new custom tabs (NOT DefaultOn — that's Profile-only)
- AppVisibility: visible=true for new Lightning apps

Assign via MCP `assign_permission_set`. Fallback CLI:
```bash
sf data query --target-org [ALIAS] --query "SELECT Id FROM PermissionSet WHERE Name='[NAME]'"
sf data query --target-org [ALIAS] --query "SELECT Id FROM User WHERE Username='[USERNAME]'"
sf data create record --sobject PermissionSetAssignment --values "PermissionSetId=[PS_ID] AssigneeId=[USER_ID]" --target-org [ALIAS]
```

---

## Rollback Commands (Per Metadata Type)

```bash
# Custom Object
sf project delete source --metadata CustomObject:[Name] --target-org [alias]

# Custom Field
sf project delete source --metadata CustomField:[Object].[Field] --target-org [alias]

# Flow (also delete FlowTest and QuickAction if deployed)
sf project delete source --metadata Flow:[Name] --target-org [alias]
sf project delete source --metadata FlowTest:[Name]_Test --target-org [alias]

# Apex Class
sf project delete source --metadata ApexClass:[Name] --target-org [alias]

# LWC
sf project delete source --metadata LightningComponentBundle:[Name] --target-org [alias]

# Permission Set
sf project delete source --metadata PermissionSet:[Name] --target-org [alias]

# Agent
sf agent unpublish --name [Name] --target-org [alias]
sf project delete source --metadata AiAuthoringBundle:[Name] --target-org [alias]
```

---

## Script Deliverable Rules

When producing a reusable script (data seeding, cleanup, smoke test):

1. **Idempotent** — safe to re-run. Upserts over blind inserts; External_ID lookups over hardcoded IDs.
2. **`--pilot-only` flag** — exercises every code path against one record before bulk.
3. **Self-test before returning:** `bash -n [script]` then `bash [script] --pilot-only`. Pass both before reporting success.
4. **Bash 3.2 compatible** — no `declare -A`, no `${var^^}`, no `&>`. Use `python3`/`jq` for complex data.
5. **SE-runnable standalone** — no hardcoded session paths, no parent-shell state.

---

## LSDO-Specific Constraints

- **Territory model is READ-ONLY** — never create/modify/delete Territory2, UserTerritory2Association, or ObjectTerritory2Association via deployment commands
- **Cinematic Universe data is reference-only** — don't overwrite records with `LS.*` External_IDs
- **Always use LSDO naming** — load `building-lsdo` skill for conventions
- **Deploy order matters** — metadata → data → Apex scripts (dependencies flow downward)
