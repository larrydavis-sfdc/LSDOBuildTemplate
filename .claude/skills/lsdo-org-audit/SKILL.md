---
name: lsdo-org-audit
description: "Format and procedure for auditing an LSDO Salesforce org. Use this skill when performing org audits during /scout-sparring, when the audit format or section structure is needed, or when checking for Cinematic Universe data presence, LSC objects, territory model, and persona users. DO NOT TRIGGER when: deploying metadata, generating specs, or for general Salesforce questions."
---

# LSDO Org Audit — Format & Procedure

Save to: `orgs/[alias]-[customer]/audit-[YYYY-MM-DD]-[HHmm].md`

- alias from `sf config get target-org`
- customer = lowercase-hyphenated name (e.g., `makana-medtech`)
- HHmm = local time at audit creation

Use MCP `retrieve_metadata` for metadata and `run_soql_query` for data.

## Required Sections

### 1. Org Identity
- Org ID, Username, Instance URL, API Version
- Edition and features enabled

### 2. Cinematic Universe Data Status
```sql
SELECT Count() FROM Product2 WHERE External_ID__c LIKE 'LS.MT.Product2.%'
SELECT Count() FROM Account WHERE External_ID__c LIKE 'LS.MT.Account.%' OR External_ID__c LIKE 'LS.Account.%'
SELECT Count() FROM Contact WHERE External_ID__c LIKE 'LS.MT.Contact.%'
SELECT Count() FROM User WHERE External_ID__c LIKE 'LSDO.User.%'
```

Report as:
```markdown
### Cinematic Universe Data
- Products: [count] (expected: 12)
- Accounts: [count] (expected: 8)
- Contacts: [count] (expected: varies)
- Persona Users: [count] (expected: 7)
- Status: ✅ Fully deployed / ⚠️ Partially deployed / ❌ Not present
```

### 3. Life Sciences Cloud Objects
```sql
SELECT Count() FROM HealthcareProvider
SELECT Count() FROM CareTaxonomy
SELECT Count() FROM Territory2 WHERE Territory2Model.DeveloperName = 'LSCTerritoryModel'
SELECT Count() FROM ProviderAcctTerritoryInfo
```

### 4. Standard Objects in Use
For each standard object with records > 0:
- Record count, record types, active page layout ★, key fields

### 5. Custom Objects
- API name, label, record count, LSDO naming compliance
- Active page layout, key relationships

### 6. Lightning Apps
- App name, tabs, default status ★
- LSDO naming compliance

### 7. Active Flows
- Name, type, trigger object, execution order concerns

### 8. LWC Components
- Name, purpose, page placement

### 9. Agentforce Agents
- Name, status, topics, actions

### 10. Permission Sets (Custom)
- Name, LSDO naming compliance
- What they grant (brief)

### 11. Notable Gaps and Risks
- Missing data (objects with 0 records needed for demo)
- Missing permission sets for custom objects
- Non-LSDO-named components
- Managed package constraints
- Flow execution order conflicts

---

## Audit Priority Flags

Mark with ★:
- Default Lightning app for System Administrator
- Active page layout per record type in scope
- Objects directly relevant to the demo scenario

Mark with ⚠️:
- Stale or conflicting components from previous sessions
- Non-standard naming that could cause confusion
- Managed package limitations

---

## Sub-Agent Dispatch

For efficiency, spawn parallel sub-agents:
1. `.claude/prompts/audit-standard-objects.md` — standard objects
2. `.claude/prompts/audit-custom-objects.md` — custom objects
3. `.claude/prompts/audit-apps-flows-agents.md` — apps, flows, LWC, agents, permission sets

Merge results into a single audit file.
