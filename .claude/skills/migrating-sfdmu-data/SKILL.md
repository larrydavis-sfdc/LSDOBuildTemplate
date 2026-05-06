---
name: migrating-sfdmu-data
description: "Migrate Salesforce data between orgs and CSV files using SFDMU (Salesforce Data Move Utility). Use this skill when the user needs to move demo data, seed orgs, export/import CSV, configure export.json, handle object relationships, anonymize data, or troubleshoot SFDMU operations. TRIGGER when: user mentions SFDMU, sfdmu, data migration between orgs, export.json configuration, CSV import/export for Salesforce data, demo data seeding, or sandbox data loading. DO NOT TRIGGER for: general Salesforce data operations (SOQL, Data Loader, sf data commands), metadata deployment, or non-SFDMU data tools."
compatibility: SF CLI v2+, SFDMU plugin (sf plugins install sfdmu)
metadata:
  version: 0.1.0
  last_updated: 2026-04-29
aliases:
  - SFDMU
  - sfdmu
tags:
  - salesforce
  - data
  - migration
  - sfdmu
---

# SFDMU Data Migration

SFDMU is an SF CLI plugin for migrating Salesforce data between orgs or between orgs and CSV files. It supports complex object relationships, circular references, field mapping, data anonymization, composite external IDs, and bulk/REST API operations. All operations run locally — no cloud transfers.

## How to Use This Skill

This file maps user intent to task domains with required steps. The [export.json Schema Reference](references/export-json-schema.md) contains the complete property reference for root-level settings, ScriptObject configuration, operations, sub-schemas (MappingItem, MockField, AddonManifestDefinition, PolymorphicLookup, ScriptObjectSet, ScriptOrg, ValueMapping.csv, FieldMapping.csv), and advanced features. ALWAYS read it BEFORE building export.json configurations.

## Rules That Always Apply

> **Surgical Changes:** When editing CSVs or export.json, touch only the specific rows, fields, or objects requested. Do not reformat files, reorder columns, or adjust adjacent records. Every changed line must trace directly to the user's request.

1. **Always `--json`.** ALWAYS include `--json` on EVERY `sf` CLI command, including `sf sfdmu run`. Do NOT pipe output through `jq` or `2>/dev/null`. Read the full JSON response directly.

2. **Verify target org.** Before any org interaction, run `sf config get target-org --json` to confirm a target org is set.

3. **Modern CLI only.** Use `sf sfdmu run`, not the legacy `sfdx sfdmu:run` format.

4. **Simulation first.** Always run with `--simulation` before executing real data changes, especially for destructive operations (Delete, HardDelete, DeleteSource, deleteOldData).

5. **No hardcoded Salesforce IDs — ever.** Salesforce record IDs (15- or 18-character org-specific strings like `001g8000007pWFaAAM`) must never appear in `export.json`, SOQL queries, CSV field values, shell scripts, or any other artifact. They are meaningless outside the org they were created in and will silently corrupt data or cause hard-to-diagnose failures on any other org.

   - In `export.json` queries: filter on `External_ID__c` or other stable business keys, never on `Id = 'xxx'`
   - In relationship traversal: use `Object.External_ID__c` pattern (e.g. `Account.External_ID__c`, `Parent.External_ID__c`)
   - In `externalId`: always specify `External_ID__c` (or equivalent stable key), never `Id`
   - If you see a hardcoded ID anywhere in SFDMU config or CSV data, treat it as a bug and replace it with a stable key lookup

6. **Object ordering matters.** Parent objects must come before child objects in the `objects` array. SFDMU resolves relationships in declaration order — children before parents causes missing parent errors.

7. **CSV naming.** CSV files MUST be named by sObject API name (`Account.csv`, `Contact.csv`, `Custom__c.csv`) and reside in the same directory as `export.json`.

8. **Case-sensitive API names.** Object and field API names in SOQL queries are case-sensitive. Verify exact names match metadata.

9. **Noprompt for automation.** Always use `--noprompt` when running in CI/CD, scripts, or non-interactive contexts.

## Installation

```bash
sf plugins install sfdmu
```

If permission issues on macOS, prepend `sudo`. To install a specific version: `sf plugins install sfdmu@4.39.0`.

## CLI Quick Reference

```
sf sfdmu run [flags]
```

| Pattern | `--sourceusername` | `--targetusername` |
|---------|-------------------|-------------------|
| Org-to-Org | `source@org.com` | `target@org.com` |
| Org-to-CSV | `source@org.com` | `csvfile` |
| CSV-to-Org | `csvfile` | `target@org.com` |

**Essential flags:** `--path <dir>` (directory with export.json), `--simulation` (dry run), `--noprompt` (non-interactive), `--json` (JSON output), `--filelog 1` (enable log file), `--diagnostic` (detailed logging), `--canmodify <orgname>` (allow production writes).

**Exit codes:** 0 = success, 8 = warning (with `--failonwarning`).

## Minimal export.json

```json
{
    "objects": [
        {
            "query": "SELECT Id, Name FROM Account",
            "operation": "Upsert",
            "externalId": "Name"
        }
    ]
}
```

Required: either `objects` or `objectSets` at root. Each object needs at minimum a `query`. See [export.json Schema Reference](references/export-json-schema.md) for all properties.

## Operations

| Operation | Description |
|-----------|-------------|
| `Insert` | Create new records only |
| `Update` | Update existing records only |
| `Upsert` | Insert or update based on external ID match |
| `Readonly` | Query data but make no changes (for relationship resolution or CSV export) |
| `Delete` | Delete matching records from target |
| `DeleteSource` | Delete matching records from source org — **dangerous** |
| `DeleteHierarchy` | Delete records following object hierarchy |
| `HardDelete` | Permanently delete via Bulk API (bypasses recycle bin) |

## Task Domains

Every task domain below has **Required Steps**. Follow verbatim, in order.

### Seed an Org from CSV

User wants to load demo data from CSV files into a Salesforce org. Common for LSDO demo org setup.

#### Required Steps

1. **Verify org** — `sf config get target-org --json`
2. **Check CSV files** — Confirm files exist, are named by sObject API name, and are co-located with export.json.
3. **Check conventions** — If working in an LSDO org, confirm `External_Id__c` values follow `LS.<SubVert>.<ObjectAbbr>.###` pattern and record types match LSDO naming.
4. **Build export.json** — Read [export.json Schema Reference](references/export-json-schema.md). Configure objects ordered parents-before-children, with `operation: "Upsert"` and `externalId: "External_Id__c"` (or appropriate key). Include `RecordTypeId` in SELECT if records use record types.
5. **Dry run** — `sf sfdmu run --json --sourceusername csvfile --targetusername <target> --path <dir> --simulation --noprompt`
6. **Execute** — Remove `--simulation` and run.
7. **Verify** — `sf data query --json -q "SELECT Id, Name, External_Id__c FROM <Object> LIMIT 10"`

#### Reference Files

1. [export.json Schema Reference](references/export-json-schema.md) — all properties, RecordType handling, CSV settings

### Export Org Data to CSV

User wants to back up org data or export for later import.

#### Required Steps

1. **Verify org** — `sf config get target-org --json`
2. **Build export.json** — Set `operation: "Readonly"` on all objects. Include all fields needed for re-import (lookups, External_Id__c, RecordTypeId, OwnerId).
3. **Execute** — `sf sfdmu run --json --sourceusername <source> --targetusername csvfile --path <dir> --noprompt`
4. **Verify** — Confirm CSV files created with expected columns and row counts.

#### Reference Files

1. [export.json Schema Reference](references/export-json-schema.md) — Readonly operation, CSV settings

### Migrate Data Between Orgs

User wants to copy data from one Salesforce org to another.

#### Required Steps

1. **Verify both orgs** — Confirm source and target are authenticated.
2. **Map dependencies** — Identify parent-child relationships. Parents must come first in `objects` array. Use `master: true` on root objects, `master: false` on children.
3. **Build export.json** — Read [export.json Schema Reference](references/export-json-schema.md). Configure `Upsert` with appropriate external IDs. Include `RecordTypeId` and `OwnerId` in SELECT where relevant.
4. **Dry run** — `sf sfdmu run --json --sourceusername <source> --targetusername <target> --path <dir> --simulation --noprompt`
5. **Execute** — Remove `--simulation`.
6. **Verify** — Query target org to confirm records.

#### Reference Files

1. [export.json Schema Reference](references/export-json-schema.md) — full schema, composite external IDs, polymorphic lookups
2. [Common Patterns](references/common-patterns.md) — org-to-org with relationships

### Anonymize Data for Sandbox

User wants to copy data but mask PII (emails, names, phones).

#### Required Steps

1. **Identify PII fields** — List fields containing personal data across all objects.
2. **Build export.json with mockFields** — Read [export.json Schema Reference](references/export-json-schema.md), MockField section. Set `updateWithMockData: true` on each object and define `mockFields` array with patterns. Common patterns: `email`, `first_name`, `last_name`, `full_name`, `c_seq_number(prefix, from, step)`.
3. **Dry run** — `--simulation` to verify mock patterns produce realistic data.
4. **Execute** — Run migration.

#### Reference Files

1. [export.json Schema Reference](references/export-json-schema.md) — MockField patterns, special functions, regex exclusions

### Delete and Reload Data

User wants to clean out existing data and replace it. Common for demo org resets.

#### Required Steps

1. **Confirm with user** — Deletion is destructive. Get explicit confirmation.
2. **Build export.json with objectSets** — Read [export.json Schema Reference](references/export-json-schema.md), ScriptObjectSet section. Use two object sets: Set 1 with `DeleteHierarchy` for cleanup, Set 2 with `Insert` or `Upsert` for reload.
3. **Dry run** — `--simulation` is critical for delete operations.
4. **Execute** — Run with `--noprompt` only after user confirms.

#### Reference Files

1. [export.json Schema Reference](references/export-json-schema.md) — objectSets, delete operations, deleteOldData

### Troubleshoot a Failed Migration

User has an SFDMU migration that failed or produced unexpected results.

#### Required Steps

1. **Reproduce with diagnostics** — `sf sfdmu run --json --diagnostic --filelog 1 --anonymise [other flags]`
2. **Classify error** — Check against common issues table below.
3. **Fix and retry** — Update export.json, re-run with `--simulation` first.

#### Common Issues

| Issue | Cause | Resolution |
|-------|-------|------------|
| Object API names not found | Case-sensitive names | Verify exact API names match metadata |
| Missing parent records | Dependency ordering | Order objects so parents come before children |
| Heap/memory errors | Too much data in memory | Set `sourceRecordsCache: "FileCache"`, reduce batch sizes |
| ECONNRESET / timeouts | Network/API limits | Reduce `parallelBulkJobs`/`parallelRestJobs`, increase `pollingQueryTimeoutMs` |
| Large file transfer failures | Binary data too large for batch | Set `restApiBatchSize` to 5-10 |
| CSV WHERE clause ignored | WHERE not applied to CSV | Use `targetRecordsFilter` instead |
| RecordType mismatch | Different DeveloperNames across orgs | Add Readonly RecordType object with composite key `DeveloperName;NamespacePrefix;SobjectType` |
| OwnerId failures | User doesn't exist in target | Include `OwnerId` in SELECT; SFDMU auto-resolves via User/Group lookup |

## LSDO Integration

When using SFDMU with LSDO demo orgs, apply these conventions:

- **External ID field:** Use `External_Id__c` as the `externalId` for Upsert operations
- **External ID values:** Follow `LS.<SubVert>.<ObjectAbbr>.###` pattern (e.g., `LS.MT.Account.001`, `LS.MT.Product2.024`)
- **Record types:** Include `RecordTypeId` in SELECT; LSDO record types use `LSDO_` prefix (e.g., `LSDO_Healthcare_Organization`, `LSDO_MedTech_Competitor`)
- **Typical LSDO object order:** Account → Contact → Product2 → PricebookEntry → Opportunity → OpportunityLineItem → custom objects
- **Competitor data:** Konkurrent products use `LS.MT.Product2.1xx` range

## Related Skills

- [using-cumulusci](../using-cumulusci/SKILL.md) — CumulusCI dataset extract/load which complements SFDMU for LSDO projects
- [managing-medtech-territories](../managing-medtech-territories/SKILL.md) — territory data (Territory2, PATI) exported and loaded via SFDMU
- [building-lsdo](../building-lsdo/SKILL.md) — LSDO build standards that govern which data is packaged
