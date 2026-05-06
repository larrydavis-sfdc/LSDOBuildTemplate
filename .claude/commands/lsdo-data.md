---
name: lsdo-data
description: >
  Seed or extract LSDO demo data via SFDMU.
  Modes: extract (org → CSV), load (CSV → org), validate (count check), quick-seed (subset).
  Knows Cinematic Universe External_ID patterns and relationship dependencies.
model: sonnet
allowed-tools: Bash, Read, Write, Edit, Glob, mcp__Salesforce_DX__run_soql_query
---

# LSDO Data — Seed or Extract Demo Data

Guided SFDMU workflow for LSDO demo data. Load `.claude/skills/migrating-sfdmu-data/SKILL.md` for export.json schema and patterns.

## Step 1: Confirm Org

Run `sf config get target-org --json`. Extract alias.
If no org: "Connect an org first with `/switch-org`." Stop.

## Step 2: Choose Mode

> "What would you like to do?
> 1. **Extract** — Pull data from org to CSV files
> 2. **Load** — Push CSV data into org
> 3. **Validate** — Check record counts match expectations
> 4. **Quick seed** — Load just Products + Accounts for fast demo standup
>
> Pick a number (1-4):"

---

## Mode: Extract

1. Check for existing `datasets/sfdmu/export.json`
   - Exists → use it (ask if user wants to modify objects)
   - Doesn't exist → ask which objects to extract, generate export.json

2. Run extraction:
   ```bash
   sf sfdmu run --sourceusername [alias] --targetusername csvfile --path datasets/sfdmu
   ```

3. Report:
   - Files generated (with record counts per CSV)
   - External_ID patterns detected (`LS.MT.*`, `LS.PH.*`, etc.)
   - Relationships captured

---

## Mode: Load

1. Check `datasets/sfdmu/` exists with CSVs and `export.json`
   - Missing → "No data to load. Run extract first, or place CSVs in datasets/sfdmu/."

2. Verify dependency order in export.json:
   - Products before PricebookEntries
   - Accounts before Contacts, Opportunities
   - Standard objects before junction objects
   - Warn if order looks wrong

3. Run load:
   ```bash
   sf sfdmu run --sourceusername csvfile --targetusername [alias] --path datasets/sfdmu --canmodify true
   ```

4. Post-load validation (auto-run):
   ```sql
   SELECT Count() FROM [each object in export.json]
   ```
   Compare to CSV row counts. Report mismatches.

---

## Mode: Validate

1. Read `datasets/sfdmu/export.json` to get object list
2. For each object, compare:
   - Expected: row count from CSV file
   - Actual: `SELECT Count() FROM [Object] WHERE External_ID__c LIKE 'LS.%'`
3. Report:
   ```
   ✅ Product2: 12/12
   ✅ Account: 8/8
   ⚠️ Contact: 15/18 (3 missing)
   ❌ Opportunity: 0/6 (not loaded)
   ```

---

## Mode: Quick Seed

Subset load for fast demo standup. Only loads:
1. Product2 (with External_ID__c)
2. PricebookEntry (Standard pricebook)
3. Account (with External_ID__c)

```bash
sf sfdmu run --sourceusername csvfile --targetusername [alias] --path datasets/sfdmu --canmodify true
```

Uses a temporary `export.json` with only the 3 objects above.
After load, report counts and suggest `/lsdo-data` mode 2 for full load.

---

## LSDO Awareness

- **External_ID patterns:**
  - `LS.MT.Product2.*` — MedTech products
  - `LS.MT.Account.*` — MedTech-specific accounts
  - `LS.Account.*` — Shared accounts
  - `LS.MT.Contact.*` — MedTech contacts
  - `LSDO.User.*` — Persona users

- **Prerequisites warning:** If loading Opportunities or Assets, check that:
  - Products exist (dependency)
  - Accounts exist (dependency)
  - PricebookEntries exist (for OpportunityLineItems)

- **Territory data:** Territory2, UserTerritory2Association, ObjectTerritory2Association are managed separately via the `medtech-territory-model` skill. Warn if user tries to load these via general SFDMU.
