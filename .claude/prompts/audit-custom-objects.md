You are auditing custom objects in org {{ORG_ALIAS}} ({{ORG_USERNAME}}).
Use MCP tools (retrieve_metadata, run_soql_query) for all operations.

## Discovery

Find all custom objects:
```sql
SELECT QualifiedApiName, Label, RecordCount 
FROM EntityDefinition 
WHERE IsCustomizable = true AND QualifiedApiName LIKE '%__c'
ORDER BY Label
```

Exclude managed package objects (prefixed with namespace like `ns__Object__c`) unless they have LSDO prefixes.

## For Each Custom Object

1. **Record count:** from EntityDefinition query or `SELECT Count() FROM [Object__c]`
2. **Key fields:** `SELECT QualifiedApiName, DataType, IsRequired FROM FieldDefinition WHERE EntityDefinition.QualifiedApiName = '[Object__c]' AND IsCustom = true`
3. **Relationships:** Master-Detail and Lookup fields connecting to other objects
4. **Record types:** `SELECT Id, Name, IsActive FROM RecordType WHERE SobjectType = '[Object__c]'`
5. **Active page layout:**
   ```
   SELECT Layout.Name, RecordType.Name
   FROM ProfileLayout
   WHERE TableEnumOrId = '[Object__c]'
   AND Profile.Name = 'System Administrator'
   ```
6. **LSDO naming compliance:** Does the API name follow `LSDO_[MT|PH]_*__c` convention?

## Output Format

```markdown
### [Label] ([API Name])
- **Records:** [count]
- **LSDO Naming:** ✅ Compliant / ⚠️ Non-standard
- **Key Fields:** [list with types]
- **Relationships:** [parent objects via Master-Detail/Lookup]
- **Record Types:** [list]
- **Active Layout:** [name] ★
- **Notes:** [anything notable — junction object, no records, managed prefix]
```

## Special Flags

- Objects with `LSDO_MT_` prefix → MedTech sub-vertical
- Objects with `LSDO_PH_` prefix → Pharma sub-vertical
- Objects with neither → possibly shared or non-standard naming
- Objects with 0 records → may need data seeding
