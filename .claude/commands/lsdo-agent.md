---
name: lsdo-agent
description: >
  Guided Agentforce agent creation wizard for LSDO.
  Asks about purpose, suggests actions/topics, generates Agent Script,
  deploys, runs smoke test. LSDO-aware with Makana persona suggestions.
model: opus
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, Agent, mcp__Salesforce_DX__deploy_metadata, mcp__Salesforce_DX__retrieve_metadata, mcp__Salesforce_DX__run_soql_query, mcp__Salesforce_DX__run_code_analyzer
---

# LSDO Agent — Build an Agentforce Agent

Guided agent creation wizard. Load `.claude/skills/developing-agentforce/SKILL.md` for Agent Script syntax and metadata structure. Load `.claude/skills/testing-agentforce/SKILL.md` for test spec generation.

## Step 1: Confirm Org + MCP

Run `sf config get target-org --json`. Verify MCP with `SELECT Id FROM Organization LIMIT 1`.
If either fails, stop with guidance.

## Step 2: Discovery

Ask the user:

> "Let's build an Agentforce agent. Tell me:
> 1. **Who uses it?** (internal rep, customer self-service, partner, etc.)
> 2. **What's its purpose?** (account lookup, case triage, product recommendation, etc.)
> 3. **What data does it need?** (which objects, fields, external systems)
>
> Or describe the scenario and I'll suggest an architecture."

## Step 3: Architecture Suggestion

Based on answers, propose:
- **Agent name** (following LSDO naming: `LSDO_MT_[Purpose]_Agent`)
- **Topics** (conversation domains the agent handles)
- **Actions** per topic (what the agent can do)
- **Backing requirements** (Apex invocable actions, Flow actions, standard actions)

**LSDO-aware suggestions:**
- For MedTech reps: product lookup (Makana catalog), territory-aware account access, PATI recommendations
- For customer-facing: case creation, order status, knowledge search
- For provider-facing: HealthcareProvider lookup, CareTaxonomy navigation, appointment scheduling

Ask: "Does this architecture look right? Adjust anything before I generate?"

## Step 4: Generate Agent Script

Create the `.agent` file following Agent Script syntax:
- Define agent with name, description, instructions
- Define topics with their scopes
- Define actions (invocable Apex, Flow, standard)
- Wire actions to topics

Place in: `force-app/main/default/aiAuthoringBundles/[AgentName]/`

## Step 5: Generate Backing Code

If custom actions needed:
- Generate Apex invocable action class(es)
- Generate test class(es) for the Apex
- Follow LSDO naming conventions

## Step 6: Deploy

1. Deploy backing Apex first (if any)
2. Deploy Agent Script / AiAuthoringBundle
3. Report success or failure (two-attempt rule applies)

## Step 7: Generate Test Spec

Create AiEvaluationDefinition YAML:
- Happy-path test cases for each topic
- Edge cases (unknown input, out-of-scope requests)
- Action execution verification

Place in: `force-app/main/default/aiEvaluationDefinitions/`

## Step 8: Smoke Test

```bash
sf agent test run --name [TestName] --target-org [alias] --json
```

Report results:
- Pass → "Agent deployed and tested successfully."
- Fail → Show failures, suggest fixes, offer to iterate.

## Step 9: Publish (Optional)

Ask: "Agent is deployed and tested. Publish it now? (This makes it available to users.)"

If yes:
```bash
sf agent publish --name [AgentName] --target-org [alias]
```

## Step 10: Report

```
✅ Agentforce Agent: [Name]

Files created:
  - [agent file path]
  - [apex file paths]
  - [test spec path]

Topics: [list]
Actions: [list]

Test results: [pass/fail summary]
Status: [Draft / Published]

To re-test: sf agent test run --name [TestName] --target-org [alias]
To publish: sf agent publish --name [AgentName] --target-org [alias]
```
