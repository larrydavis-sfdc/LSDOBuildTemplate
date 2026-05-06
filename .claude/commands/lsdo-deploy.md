---
name: lsdo-deploy
description: >
  Smart incremental deploy. Detects changed metadata, runs code analyzer,
  deploys via MCP, auto-generates companion permission set, verifies.
  Lighter than /scout-building — no spec needed.
model: sonnet
allowed-tools: Bash, Read, Glob, Grep, mcp__Salesforce_DX__deploy_metadata, mcp__Salesforce_DX__retrieve_metadata, mcp__Salesforce_DX__run_soql_query, mcp__Salesforce_DX__assign_permission_set, mcp__Salesforce_DX__run_code_analyzer
---

# LSDO Deploy — Smart Incremental Deploy

For iterative development. Deploys what changed without a full scout-building cycle.

## Step 1: Confirm Org

Run `sf config get target-org --json`. If no org: suggest `/switch-org`. Stop.

## Step 2: Detect Changes

Ask user: "Deploy everything in force-app/, or just what changed?"

**If just changes:**
```bash
git diff --name-only HEAD -- force-app/
git diff --name-only --cached -- force-app/
git ls-files --others --exclude-standard -- force-app/
```

List changed files. If no changes detected:
> "No uncommitted changes in force-app/. Deploy everything, or specify paths?"

**If everything (or user specifies paths):**
Use the full `force-app/` or user-specified subdirectories.

## Step 3: Pre-Flight Code Analysis

If changed files include Apex (`.cls`, `.trigger`) or LWC (`.js`, `.html` in `lwc/`):
- Run MCP `run_code_analyzer` on the changed files
- Report critical/high findings
- Ask: "Continue with deploy? (Code analyzer found [N] issue(s))"

## Step 4: Deploy

Deploy via MCP `deploy_metadata`:
- Use source path(s) from step 2
- Report progress

If deploy fails:
- Show error in plain English
- Suggest fix
- Ask if user wants to retry after fixing

## Step 5: Companion Permission Set

If structural metadata was deployed (objects, fields, tabs, record types, apps):

1. Check for existing LSDO permission set in org:
   ```sql
   SELECT Id, Name FROM PermissionSet WHERE Name LIKE 'LSDO_%' ORDER BY Name
   ```

2. If exists → update it with new object/field permissions
3. If not → generate a new permission set following LSDO naming:
   - Name: `LSDO_[MT|PH]_[Feature]_Access`
   - Object CRUD for new objects
   - Field Read+Edit FLS (exclude Required fields)
   - RecordTypeVisibility for new record types
   - TabVisibility: Visible for new tabs

4. Deploy the permission set via MCP
5. Assign to running user via MCP `assign_permission_set`

## Step 6: Post-Deploy Verification

- Confirm deploy status (success/partial)
- Run SOQL count on affected objects:
  ```sql
  SELECT Count() FROM [deployed objects]
  ```
- Check deployed components are retrievable:
  ```
  retrieve_metadata for [key deployed items]
  ```

## Step 7: Report

```
✅ Deployed successfully

Files deployed:
  - [list with metadata types]

Permission set:
  - [Created/Updated]: [Name]
  - Assigned to: [username]

Verification:
  - [Object]: [count] records
  
Rollback (if needed):
  sf project delete source --metadata [Type:Name] --target-org [alias]
```
