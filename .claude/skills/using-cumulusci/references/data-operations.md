# CumulusCI Data Operations

## Quick Start: Sample Data

```bash
cci task run capture_sample_data --org source_org
cci task run load_sample_data --org target_org
```

Sample data loads automatically during setup flows (`dev_org`, `qa_org`, etc.).

## Dataset Definition (Mapping File)

Mapping files define which objects/fields to extract/load and how relationships connect.

```yaml
# datasets/mapping.yml
Accounts:
    sf_object: Account
    fields:
        - Name
        - Description
        - Industry
    lookups:
        ParentId:
            table: Account
            after: Accounts     # Self-reference: populate after initial load

Contacts:
    sf_object: Contact
    fields:
        - FirstName
        - LastName
        - Email
    lookups:
        AccountId:
            table: Account
```

## Dataset Commands

```bash
# Generate mapping by inspecting org schema
cci task run generate_dataset_mapping --org dev

# Extract data from org
cci task run extract_dataset --org dev -o mapping datasets/mapping.yml

# Load data into org
cci task run load_dataset --org dev -o mapping datasets/mapping.yml

# Resume failed load from a specific step
cci task run load_dataset --org dev -o mapping datasets/mapping.yml -o start_step Contacts

# Ignore row errors during load
cci task run load_dataset --org dev -o mapping datasets/mapping.yml -o ignore_row_errors True
```

## Advanced Mapping Features

### Upserts

```yaml
Insert Accounts:
    sf_object: Account
    action: upsert
    update_key: External_Id__c
```

### Record Type Mapping

Include `RecordTypeId` in fields — CumulusCI automatically maps Developer Names between orgs:

```yaml
Accounts:
    sf_object: Account
    fields:
        - Name
        - RecordTypeId
```

### Relative Date Anchoring

Dates adjust on load/extract to maintain relative offsets from the anchor:

```yaml
Contacts:
    sf_object: Contact
    anchor_date: 1990-07-01
    fields:
        - FirstName
        - Birthdate
```

### Select Action (Use Existing Records)

Use records already in the target org instead of inserting new ones:

```yaml
Event:
    sf_object: Event
    action: select
    select_options:
        strategy: similarity    # or: standard, random
        filter: "WHERE Subject LIKE 'Meeting%'"
        priority_fields:
            - Subject
        threshold: 0.3
```

### Filters and Static Values

```yaml
Accounts:
    sf_object: Account
    filters:
        - "Type = 'Customer'"
    static:
        CustomCheckbox__c: True
    soql_filter: "Industry = 'Technology'"    # Extract-time filter
```

### API Selection

- Under 2,000 records: REST Collections API (batch 1–200)
- Over 2,000 records: Bulk API (batch 1–10,000)
- Override per step: `api: "rest"`, `"bulk"`, or `"smart"` (default)

### Drop Missing Schema

Skip fields that don't exist in the target org:

```yaml
Accounts:
    sf_object: Account
    fields:
        - Name
        - OptionalPackage__CustomField__c
    drop_missing_schema: true
```

## Snowfakery (Synthetic Data)

```bash
# Generate from recipe
cci task run snowfakery --recipe datasets/recipe.yml --org dev

# Generate until record count reached
cci task run snowfakery --run-until-records-loaded 1000:Account --org dev
cci task run snowfakery --run-until-records-in-org 1000:Account --org dev
```

## Delete Data

```bash
cci task run delete_data -o objects Account,Contact --org dev
cci task run delete_data -o objects Account -o where "Type = 'Test'" --org dev
cci task run delete_data -o objects Account -o hardDelete True --org dev
```

## Update Data

```bash
cci task run update_data --recipe datasets/update.recipe.yml --object Account --org dev
```

## Load Custom Settings

```bash
cci task run load_custom_settings -o settings_path datasets/custom_settings.yml --org dev
```

## Namespace Handling

Mapping files work for both namespaced and unnamespaced orgs through automatic namespace injection/removal. Disable with `inject_namespaces: False` on a mapping step.
