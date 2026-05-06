# SFDMU Common Patterns

Ready-to-use export.json configurations for common migration scenarios.

## Org-to-Org with Related Objects

```json
{
    "objects": [
        {
            "query": "SELECT Name, Phone, Industry FROM Account WHERE Industry = 'Technology'",
            "operation": "Upsert",
            "externalId": "Name"
        },
        {
            "query": "SELECT FirstName, LastName, Email, AccountId FROM Contact",
            "operation": "Upsert",
            "externalId": "Email",
            "master": false
        }
    ]
}
```

## CSV Export for Backup

```json
{
    "objects": [
        {
            "query": "SELECT Id, Name, Phone, Industry FROM Account",
            "operation": "Readonly"
        },
        {
            "query": "SELECT Id, FirstName, LastName, Email, AccountId FROM Contact",
            "operation": "Readonly",
            "master": false
        }
    ]
}
```

```bash
sf sfdmu run --json --sourceusername source@org.com --targetusername csvfile --noprompt
```

## Sandbox Seeding with Anonymization

```json
{
    "objects": [
        {
            "query": "SELECT Id, Name, Email, Phone FROM Contact",
            "operation": "Upsert",
            "externalId": "Name",
            "updateWithMockData": true,
            "mockFields": [
                {"name": "Email", "pattern": "email"},
                {"name": "Phone", "pattern": "c_seq_number('555-', 1000, 1)"}
            ]
        }
    ]
}
```

## Delete Then Insert (Clean Slate)

Uses `objectSets` to run delete and insert as separate passes on the same sObject.

```json
{
    "objectSets": [
        {
            "objects": [
                {
                    "query": "SELECT Id FROM Account",
                    "operation": "DeleteHierarchy"
                }
            ]
        },
        {
            "objects": [
                {
                    "query": "SELECT Id, Name, Phone FROM Account",
                    "operation": "Insert",
                    "externalId": "Name"
                }
            ]
        }
    ]
}
```

## Cross-Object Field Mapping

Migrate data from one object type to a different object type in the target org.

```json
{
    "objects": [
        {
            "query": "SELECT Id, Name, ParentId, ExternalID__c FROM Account",
            "operation": "Upsert",
            "useFieldMapping": true,
            "fieldMapping": [
                {"targetObject": "TestObject__c"},
                {"sourceField": "ParentId", "targetField": "ParentTestObject__c"},
                {"sourceField": "ExternalID__c", "targetField": "External_ID__c"}
            ]
        }
    ]
}
```

## Simulation / Dry Run

Via CLI flag:

```bash
sf sfdmu run --json --sourceusername source@org.com --targetusername target@org.com --simulation --noprompt
```

Or in export.json:

```json
{
    "simulationMode": true,
    "objects": [...]
}
```

## CI/CD Non-Interactive

```bash
sf sfdmu run --json \
    --sourceusername source@org.com \
    --targetusername target@org.com \
    --noprompt \
    --filelog 1
```

## LSDO Demo Data Load (CSV to Org)

Typical pattern for loading LSDO demo data from CSV files. Objects ordered by dependency.

```json
{
    "objects": [
        {
            "query": "SELECT Id FROM RecordType WHERE IsActive = true",
            "externalId": "DeveloperName;NamespacePrefix;SobjectType",
            "operation": "Readonly"
        },
        {
            "query": "SELECT Id, Name, External_Id__c, RecordTypeId, Industry, Phone FROM Account",
            "operation": "Upsert",
            "externalId": "External_Id__c"
        },
        {
            "query": "SELECT Id, FirstName, LastName, External_Id__c, AccountId, Email FROM Contact",
            "operation": "Upsert",
            "externalId": "External_Id__c",
            "master": false
        },
        {
            "query": "SELECT Id, Name, External_Id__c, ProductCode, RecordTypeId, Description FROM Product2",
            "operation": "Upsert",
            "externalId": "External_Id__c"
        }
    ]
}
```

```bash
sf sfdmu run --json --sourceusername csvfile --targetusername <target-org> --path <dir> --noprompt
```

## Attachments with core:ExportFiles

```json
{
    "objects": [
        {
            "query": "SELECT Id, Name, External_Id__c FROM Account",
            "operation": "Upsert",
            "externalId": "External_Id__c"
        }
    ],
    "afterAddons": [
        {
            "module": "core:ExportFiles",
            "description": "Export attachments and content files",
            "args": {}
        }
    ]
}
```
