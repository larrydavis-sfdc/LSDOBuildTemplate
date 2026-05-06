---
name: lsdo-readiness
description: >
  Check project against LSDO build best practices.
  Audits naming conventions, permission sets, code quality, data readiness,
  and documentation. Produces a scored pass/warn/fail report.
model: sonnet
allowed-tools: Bash, Read, Grep, Glob, mcp__Salesforce_DX__retrieve_metadata, mcp__Salesforce_DX__run_soql_query, mcp__Salesforce_DX__run_code_analyzer
---

# LSDO Readiness Check

Audit the project and connected org against LSDO build best practices.
Load `.claude/skills/building-lsdo/SKILL.md` for the full naming and standards reference.

## Step 1: Confirm Org

Run `sf config get target-org --json` and `sf org display --json`.
If no org connected: "Connect an org first with `/switch-org`." Stop.

## Step 2: Run Checks

Score each category as ✅ PASS, ⚠️ WARN, or ❌ FAIL.

### 2.1 Naming Conventions
- Scan `force-app/` for custom objects, fields, flows, permission sets
- Check API names follow LSDO conventions:
  - Objects: `LSDO_MT_*__c` or `LSDO_PH_*__c` prefix for sub-vertical-specific
  - Fields: descriptive, no abbreviations, `__c` suffix
  - Flows: `LSDO_[MT|PH]_[Object]_[TriggerType]_[Description]`
  - Permission sets: `LSDO_[MT|PH]_[Feature]_Access`
- Flag violations with file paths

### 2.2 Permission Sets
- For each custom object in `force-app/`, check a companion permission set exists
- Verify permission set includes: object CRUD, field FLS (exclude Required fields), RecordTypeVisibility, TabVisibility
- Check permission set is assigned to running user in org

### 2.3 Record Types
- Check objects that should have record types (per LSDO standards) actually have them
- Verify RT naming follows convention

### 2.4 Metadata Completeness
- Fields defined but not on any layout → WARN
- Custom tabs without an app assignment → WARN
- Objects without list views → WARN

### 2.5 Code Quality
- Run MCP `run_code_analyzer` on all Apex classes and LWC in `force-app/`
- Report critical and high-severity findings
- Check for common anti-patterns: SOQL in loops, DML in loops, hardcoded IDs

### 2.6 Data Readiness
- Check Cinematic Universe data:
  ```sql
  SELECT Count() FROM Product2 WHERE External_ID__c LIKE 'LS.MT.Product2.%'
  SELECT Count() FROM Account WHERE External_ID__c LIKE 'LS.MT.Account.%'
  SELECT Count() FROM Contact WHERE External_ID__c LIKE 'LS.MT.Contact.%'
  ```
- Check persona users: `SELECT Count() FROM User WHERE External_ID__c LIKE 'LSDO.User.%'`
- Check territory model: `SELECT Count() FROM Territory2 WHERE Territory2Model.DeveloperName = 'LSCTerritoryModel'`
- Report what's present and what's missing

### 2.7 Documentation
- Check for README files in feature directories
- Check for demo script artifacts in `orgs/`

### 2.8 Deployment Safety
- Check `sfdx-project.json` has correct sourceApiVersion
- Scan for hardcoded Salesforce IDs (15 or 18 char patterns in Apex/LWC)
- Check `.forceignore` is properly configured

## Step 3: Generate Report

Determine org alias and customer from `sf config get target-org` and existing org folders.
Save to: `orgs/[alias]-[customer]/readiness-YYYY-MM-DD.md` (or project root if no org folder)

Format:
```markdown
# LSDO Readiness Report
Generated: [date]
Org: [alias] ([username])

## Summary
- ✅ PASS: [count]
- ⚠️ WARN: [count]  
- ❌ FAIL: [count]
- **Overall: [READY / NEEDS WORK / NOT READY]**

## Details

### [Category] — [PASS/WARN/FAIL]
[Findings with file paths and remediation suggestions]
```

## Step 4: Remediation Suggestions

For each WARN or FAIL, suggest a specific fix:
- Missing permission set → "Run: generate a permission set for [Object] using /lsdo-deploy"
- Naming violation → "Rename [current] to [suggested]"
- Missing CU data → "Run /lsdo-data to seed Cinematic Universe data"
- Code quality issues → "Fix [issue] in [file:line]"
