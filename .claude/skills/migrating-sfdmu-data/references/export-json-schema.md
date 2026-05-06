# export.json Schema Reference

Complete property reference for SFDMU export.json configuration files.

## Root-Level Properties

**Required**: Either `objects` or `objectSets` must be present.

### Object Arrays

| Property | Type | Description |
|----------|------|-------------|
| `objects` | `array<ScriptObject>` | Object configurations for migration |
| `objectSets` | `array<ScriptObjectSet>` | Grouped object sets for multi-pass operations |
| `orgs` | `array<ScriptOrg>` | Organization connection details |

### API and Batch Settings

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `apiVersion` | `string` | auto | Salesforce API version |
| `bulkThreshold` | `integer` | varies | Record count threshold to switch to Bulk API |
| `queryBulkApiThreshold` | `integer` | varies | Query record threshold for Bulk API |
| `bulkApiVersion` | `string\|number` | varies | Bulk API version to use |
| `bulkApiV1BatchSize` | `integer` | varies | Batch size for Bulk API v1 |
| `restApiBatchSize` | `integer` | varies | Batch size for REST API |
| `concurrencyMode` | `string` | — | `"Serial"` or `"Parallel"` execution |
| `allOrNone` | `boolean` | false | All-or-nothing mode for DML operations |
| `allowFieldTruncation` | `boolean` | false | Allow truncating field values that exceed length |
| `alwaysUseRestApiToUpdateRecords` | `boolean` | false | Force REST API for all update operations |

### Polling Settings

| Property | Type | Description |
|----------|------|-------------|
| `pollingIntervalMs` | `integer` | Polling frequency in milliseconds |
| `pollingQueryTimeoutMs` | `integer` | Query timeout in milliseconds |

### Parallelism Settings

| Property | Type | Description |
|----------|------|-------------|
| `parallelBinaryDownloads` | `integer` | Concurrent binary/file downloads |
| `parallelBulkJobs` | `integer` | Concurrent Bulk API jobs |
| `parallelRestJobs` | `integer` | Concurrent REST API jobs |

### CSV Settings

| Property | Type | Description |
|----------|------|-------------|
| `createTargetCSVFiles` | `boolean` | Generate target CSV files during migration |
| `importCSVFilesAsIs` | `boolean` | Import CSV without modification |
| `excludeIdsFromCSVFiles` | `boolean` | Exclude Id columns from CSV output |
| `csvFileDelimiter` | `string` | Default CSV delimiter character |
| `csvReadFileDelimiter` | `string` | Delimiter for reading CSV files |
| `csvWriteFileDelimiter` | `string` | Delimiter for writing CSV files |
| `csvFileEncoding` | `string` | Character encoding (UTF-8 recommended) |
| `csvInsertNulls` | `boolean` | Insert null values from CSV |
| `csvUseEuropeanDateFormat` | `boolean` | Use European date format (dd/mm/yyyy) |
| `csvWriteUpperCaseHeaders` | `boolean` | Uppercase column headers in output |
| `csvUseUtf8Bom` | `boolean` | Include UTF-8 BOM in output files |
| `csvAlwaysQuoted` | `boolean` | Quote all field values in CSV |
| `useSeparatedCSVFiles` | `boolean` | Use separate subdirectories per object set |

### Prompt and Validation Settings

| Property | Type | Description |
|----------|------|-------------|
| `promptOnMissingParentObjects` | `boolean` | Prompt when parent objects are missing |
| `promptOnIssuesInCSVFiles` | `boolean` | Prompt when CSV validation issues found |
| `validateCSVFilesOnly` | `boolean` | Only validate CSVs without executing migration |

### Cache Settings

| Property | Type | Allowed Values |
|----------|------|----------------|
| `binaryDataCache` | `string` | `"InMemory"`, `"CleanFileCache"`, `"FileCache"` |
| `sourceRecordsCache` | `string` | `"InMemory"`, `"CleanFileCache"`, `"FileCache"` |

### Execution Control

| Property | Type | Description |
|----------|------|-------------|
| `keepObjectOrderWhileExecute` | `boolean` | Preserve object sequence as defined |
| `simulationMode` | `boolean` | Dry-run mode (no data changes) |
| `proxyUrl` | `string` | HTTP proxy URL |

### Root-Level Add-Ons

| Property | Type | Description |
|----------|------|-------------|
| `beforeAddons` | `array<AddonManifestDefinition>` | Add-ons to run before migration |
| `afterAddons` | `array<AddonManifestDefinition>` | Add-ons to run after migration |
| `dataRetrievedAddons` | `array<AddonManifestDefinition>` | Add-ons to run after data retrieval |

---

## ScriptObject Properties

Each object in the `objects` array supports these properties.

### Required

| Property | Type | Description |
|----------|------|-------------|
| `query` | `string` | SOQL query defining fields and records to migrate |

### Core Settings

| Property | Type | Description |
|----------|------|-------------|
| `operation` | `string` | `Insert`, `Update`, `Upsert`, `Readonly`, `Delete`, `DeleteSource`, `DeleteHierarchy`, `HardDelete` |
| `externalId` | `string` | Field(s) used for record matching in upsert. Supports composite keys with `;` separator |
| `master` | `boolean` | Mark as master (root) object in relationship chain |
| `name` | `string` | Object API name (usually inferred from query) |
| `excluded` | `boolean` | Skip this object entirely |

### Delete Settings

| Property | Type | Description |
|----------|------|-------------|
| `deleteOldData` | `boolean` | Delete existing target records before migration |
| `deleteFromSource` | `boolean` | Delete records from source after migration |
| `deleteByHierarchy` | `boolean` | Follow hierarchy for deletion |
| `hardDelete` | `boolean` | Permanent deletion via Bulk API |
| `deleteQuery` | `string` | Separate SOQL query for identifying records to delete |
| `respectOrderByOnDeleteRecords` | `boolean` | Maintain ORDER BY when deleting |

### API Settings (Object-Level Overrides)

| Property | Type | Description |
|----------|------|-------------|
| `alwaysUseBulkApiToUpdateRecords` | `boolean` | Force Bulk API for this object's updates |
| `alwaysUseRestApi` | `boolean` | Force REST API for this object |
| `alwaysUseBulkApi` | `boolean` | Force Bulk API for this object |
| `bulkApiV1BatchSize` | `integer` | Override batch size for Bulk API v1 |
| `restApiBatchSize` | `integer` | Override REST API batch size |
| `parallelBulkJobs` | `integer` | Override parallel Bulk API jobs |
| `parallelRestJobs` | `integer` | Override parallel REST API jobs |

### Query Settings

| Property | Type | Description |
|----------|------|-------------|
| `useQueryAll` | `boolean` | Include deleted/archived records in source query |
| `queryAllTarget` | `boolean` | Include deleted/archived records in target query |

### Record Filtering

| Property | Type | Description |
|----------|------|-------------|
| `sourceRecordsFilter` | `string` | Filter applied to source records before processing |
| `targetRecordsFilter` | `string` | Filter applied to target records before upload |
| `skipExistingRecords` | `boolean` | Skip records already found in target |
| `skipRecordsComparison` | `boolean` | Skip field-by-field comparison of records |

**targetRecordsFilter syntax:**
- `"Account__c"` — retains records where Account__c is not null
- `"NOT Account__c"` — retains records where Account__c IS null
- `"Account__c = Account2__c AND Contact__c"` — equality + not-null combined

### Field Settings

| Property | Type | Description |
|----------|------|-------------|
| `excludedFields` | `array<string>` | Fields to exclude from migration |
| `excludedFromUpdateFields` | `array<string>` | Fields excluded only from update operations |
| `useFieldMapping` | `boolean` | Enable field mapping for this object |
| `fieldMapping` | `array<MappingItem>` | Field mapping definitions |

### Data Transformation

| Property | Type | Description |
|----------|------|-------------|
| `useCSVValuesMapping` | `boolean` | Enable CSV-based value mapping (deprecated) |
| `useValuesMapping` | `boolean` | Enable value mapping via ValueMapping.csv |
| `updateWithMockData` | `boolean` | Enable data anonymization with mock data |
| `mockFields` | `array<MockField>` | Mock data generation rules |

### Other

| Property | Type | Description |
|----------|------|-------------|
| `useSourceCSVFile` | `boolean` | Read data from CSV file instead of querying org |
| `polymorphicLookups` | `array<PolymorphicLookup>` | Polymorphic field handling configuration |

### Object-Level Add-Ons

| Property | Type | Description |
|----------|------|-------------|
| `beforeAddons` | `array<AddonManifestDefinition>` | Run before processing this object |
| `afterAddons` | `array<AddonManifestDefinition>` | Run after processing this object |
| `beforeUpdateAddons` | `array<AddonManifestDefinition>` | Run before update DML |
| `afterUpdateAddons` | `array<AddonManifestDefinition>` | Run after update DML |
| `filterRecordsAddons` | `array<AddonManifestDefinition>` | Run to filter records |

---

## ScriptObjectSet

Groups objects into distinct processing batches. Enables running different operations on the same sObject (impossible in a single `objects` array).

```json
{
    "objectSets": [
        {
            "objects": [
                { "query": "SELECT Id FROM Account", "operation": "DeleteHierarchy" }
            ]
        },
        {
            "objects": [
                { "query": "SELECT Id, Name FROM Account", "operation": "Insert", "externalId": "Name" }
            ]
        }
    ]
}
```

**Execution order**: If both `objects` and `objectSets` exist, `objects` runs FIRST, then `objectSets` in array order.

**CSV with `useSeparatedCSVFiles`**: Root objects use working directory. Object sets use subdirectories: `objectset_source/object-set-2/`, `object-set-3/`, etc.

---

## ScriptOrg

| Property | Type | Description |
|----------|------|-------------|
| `name` | `string` | Logical name for this org connection |
| `orgUserName` | `string` | Salesforce org username |
| `instanceUrl` | `string` | Salesforce instance URL |
| `accessToken` | `string` | OAuth access token |

---

## MappingItem (Field Mapping)

Maps source fields to different target fields/objects. Enable with `"useFieldMapping": true`.

| Property | Type | Description |
|----------|------|-------------|
| `targetObject` | `string` | Target sObject name (first item in array sets target object) |
| `sourceField` | `string` | Source field API name |
| `targetField` | `string` | Target field API name |

```json
{
    "useFieldMapping": true,
    "fieldMapping": [
        {"targetObject": "TestObject__c"},
        {"sourceField": "ParentId", "targetField": "ParentTestObject__c"},
        {"sourceField": "ExternalID__c", "targetField": "External_ID__c"}
    ]
}
```

**Constraints**: All mapped fields must be in the SOQL query. Names are case-sensitive. Cannot map one source field to multiple targets. Mapped external ID values must remain unique.

### FieldMapping.csv (Alternative)

Place alongside export.json as alternative to inline fieldMapping.

| Column | Purpose |
|--------|---------|
| `ObjectName` | Source object API name |
| `FieldName` | Source field API name |
| `Target` | Target field API name |

---

## MockField (Data Anonymization)

Enable with `"updateWithMockData": true` on the ScriptObject.

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `name` | `string` | Yes | Field name, or `"all"` for all fields |
| `pattern` | `string` | Yes | Data generation pattern |
| `locale` | `string` | No | Locale for generated data (e.g., `"ru_RU"`) |
| `excludedRegex` | `string` | No | JS regex — exclude matching values from anonymization |
| `includedRegex` | `string` | No | JS regex — include only matching values |
| `excludeNames` | `array<string>` | No | Fields to skip when using `"name": "all"` |

### Patterns

**Personal**: `name`, `full_name`, `first_name`, `last_name`, `username`, `email`
**Address**: `country`, `city`, `street`, `address`, `zip`
**Text**: `sentence`, `title`, `text`, `word`
**Internet**: `ip`, `domain`, `url`
**Numbers/Dates**: `integer`, `date`, `time`, `year`

All `casual` npm library generators work as pattern names (without `casual.` prefix).

### Special Functions

| Pattern | Description | Example |
|---------|-------------|---------|
| `c_seq_number(prefix, from, step)` | Sequential numbers | `c_seq_number('Account ', 100, 10)` → "Account 100", "Account 110"... |
| `c_seq_date(from, step)` | Sequential dates | `c_seq_date('2020-01-01', 'd')` — step: d/m/y/s/ms, prefix `-` to decrement |
| `c_set_value(value)` | Static value | `c_set_value("Active")` |
| `ids` | Source record Id | Populates field with original record Id |

**RAW_VALUE**: Modify existing values: `c_set_value('RAW_VALUE.test')` appends ".test" to original.

**Regex patterns**: `*` matches non-empty values only; `^*` matches empty values only. Append `--row` to regex to exclude/include entire rows.

---

## AddonManifestDefinition

**Required**: Either `module` or `path` (not both).

| Property | Type | Description |
|----------|------|-------------|
| `module` | `string` | Built-in core module name |
| `path` | `string` | Path to custom add-on module |
| `description` | `string` | Documentation of add-on purpose |
| `args` | `object` | Arbitrary parameters passed to the add-on |

### Built-in Core Modules

| Module | Purpose |
|--------|---------|
| `core:ExportFiles` | Transfer ContentVersion, ContentDocumentLink, Attachment, Note with binary data |
| `core:RecordsTransform` | Complex record transformations before upload to target |
| `core:RecordsFilter` | Advanced record filtering before upload to target |

---

## PolymorphicLookup

Handles polymorphic fields (fields that can reference multiple object types).

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `fieldName` | `string` | Yes | The polymorphic field name |
| `referencedObjectType` | `string` | No | The specific object type to reference |

In queries, use `$` syntax: `ParentId$Account` dynamically links to Account records.

---

## ValueMapping.csv

Place alongside export.json. Enable with `"useValuesMapping": true`.

| Column | Purpose |
|--------|---------|
| `ObjectName` | Salesforce object API name |
| `FieldName` | Field API name (use source field name, not mapped target name) |
| `RawValue` | Source value to match |
| `Value` | Replacement value (use `#N/A` to clear a field) |
| `Case` | Case sensitivity indicator |

**Advanced**: Regex in RawValue (`/pattern/`), JavaScript eval (`eval(...)`), RAW_VALUE keyword to reference original value.

---

## Composite External ID Keys

Combine multiple fields as virtual external ID when no single unique field exists:

```json
{ "externalId": "Article__r.Name;Language__r.Name" }
```

Semicolon separates fields. Supports dot notation for parent references. Creates virtual formula internally.

---

## RecordType Handling

Include `RecordTypeId` in SELECT and SFDMU maps automatically between orgs.

For explicit control, add RecordType as a separate Readonly object:

```json
{
    "query": "SELECT Id FROM RecordType WHERE IsActive = true",
    "externalId": "DeveloperName;NamespacePrefix;SobjectType",
    "operation": "Readonly"
}
```

The composite key prevents conflicts when RecordTypes share the same DeveloperName across objects.

---

## OwnerId Handling

Include `OwnerId` in SELECT to maintain record ownership. SFDMU auto-queries User and Group records. User and Group are combined internally; custom external IDs apply to both.

---

## Attachments and Files

### Lightweight (Direct SOQL)

```json
{
    "operation": "Insert",
    "query": "SELECT Body, Id, Name, ParentId$Account FROM Attachment",
    "master": false,
    "restApiBatchSize": 10
}
```

### Recommended: core:ExportFiles Add-On

Handles ContentVersion, ContentDocumentLink, Attachment, Note with full binary pipeline:

```json
{ "afterAddons": [{ "module": "core:ExportFiles", "args": {} }] }
```
