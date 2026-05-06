---
name: lsdo-flow
description: >
  Guided flow builder for LSDO. Asks about type, object, logic.
  Generates Flow XML, deploys as Draft, runs FlowTest, offers activation.
  Knows LSDO flow patterns and naming conventions.
model: sonnet
allowed-tools: Read, Write, Edit, Bash, Glob, mcp__Salesforce_DX__deploy_metadata, mcp__Salesforce_DX__retrieve_metadata, mcp__Salesforce_DX__run_soql_query
---

# LSDO Flow — Build a Flow Interactively

Guided flow builder. Load `.claude/skills/generating-flow/SKILL.md` for Flow XML generation.

## Step 1: Confirm Org + MCP

Run `sf config get target-org --json`. Verify MCP.
If either fails, stop with guidance.

## Step 2: Flow Type

Ask:

> "What type of flow do you need?
> 1. **Record-Triggered (Before Save)** — validate/transform before record saves
> 2. **Record-Triggered (After Save)** — act after record saves (create related records, send notifications)
> 3. **Screen Flow** — user-facing form (≤5 screens)
> 4. **Autolaunched** — no UI, invoked from Apex/Flow/REST
> 5. **Scheduled** — runs on a schedule
> 6. **Platform Event-Triggered** — reacts to platform events
>
> Pick a number (1-6):"

## Step 3: Object Selection

Ask: "Which object does this flow operate on?"

Suggest common LSDO objects:
- Account, Contact, Opportunity, Case (standard)
- HealthcareProvider, CareTaxonomy (LSC)
- Any custom objects in `force-app/main/default/objects/`

For record-triggered: also ask about entry criteria (e.g., "only when Status changes to X").

## Step 4: Logic Description

Ask: "Describe what the flow should do in plain language."

Example prompts:
- "When a Case is created with Type = 'Device Issue', look up the Account's territory and assign to the MedTech queue"
- "After an Opportunity closes, create an Asset record linked to the Account"
- "Screen flow: collect 3 fields from user, create a Case, show confirmation"

## Step 5: Conflict Check

Check for existing flows on the same object/trigger:
```sql
SELECT Id, Label, ProcessType, TriggerType FROM FlowDefinitionView 
WHERE TriggerObjectOrEvent.QualifiedApiName = '[Object]' AND IsActive = true
```

If conflicts found:
> "⚠️ Found [N] active flow(s) on [Object]: [names]. Execution order may matter. Continue? (yes/no)"

## Step 6: Generate Flow XML

- Follow LSDO naming: `LSDO_[MT|PH]_[Object]_[TriggerType]_[Description]`
- Use the `generating-flow` skill for correct XML structure
- Validate against the skill's checklist
- Place in: `force-app/main/default/flows/`

## Step 7: Deploy as Draft

Deploy with `<status>Draft</status>`:
```
deploy_metadata with the flow file
```

If deploy fails:
- Show error, suggest fix
- Two-attempt rule: skip after second failure

## Step 8: Generate and Run FlowTest

Generate FlowTest XML (happy-path):
- Set up test record(s)
- Trigger the flow
- Assert expected outcomes

Deploy FlowTest, then run:
```bash
sf flow run test --flow-names [FlowApiName] --target-org [alias] --json
```

Report results.

## Step 9: Activation Decision

- **Test passed:**
  > "Flow test passed. Activate the flow now? (yes/no)"
  If yes, redeploy with `<status>Active</status>`.

- **Test failed:**
  > "Flow test failed: [error]. Would you like me to fix it and retry?"

- **Test skipped (no FlowTest possible):**
  > "Flow deployed as Draft. Test manually in the org, then activate via Setup > Flows."

## Step 10: QuickAction Wiring (Screen Flows Only)

If screen flow:
> "Wire this to a record page as a Quick Action? (yes/no)"

If yes:
- Generate QuickAction metadata
- Deploy
- Suggest adding to page layout (manual step)

## Step 11: Report

```
✅ Flow: [API Name]
Type: [type]
Object: [object]
Status: [Draft / Active]

Files created:
  - [flow file path]
  - [flowtest file path]
  - [quickaction file path, if any]

Test result: [pass/fail/skipped]

Rollback:
  sf project delete source --metadata Flow:[ApiName] --target-org [alias]
```
