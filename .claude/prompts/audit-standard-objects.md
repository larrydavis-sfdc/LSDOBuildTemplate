You are auditing standard objects in org {{ORG_ALIAS}} ({{ORG_USERNAME}}).
Use MCP tools (retrieve_metadata, run_soql_query) for all operations.

## Objects to Audit

Check these standard objects (plus any others with record counts > 0):
Account, Contact, Opportunity, Case, Lead, Product2, PricebookEntry, Asset, Order, Campaign

For LSDO orgs, also check:
HealthcareProvider, HealthcareProviderTaxonomy, CareTaxonomy, Territory2, ProviderAcctTerritoryInfo

## For Each Object

1. **Record count:** `SELECT Count() FROM [Object]`
2. **Record types:** `SELECT Id, Name, IsActive FROM RecordType WHERE SobjectType = '[Object]'`
3. **Active page layout per record type:**
   ```
   SELECT Layout.Name, RecordType.Name
   FROM ProfileLayout
   WHERE TableEnumOrId = '[Object]'
   AND Profile.Name = 'System Administrator'
   ```
4. **Key fields on active layout:** retrieve layout XML, list fields by section
5. **Notable relationships:** lookup/master-detail fields connecting to other audited objects

## Output Format

```markdown
### [Object Label] ([API Name])
- **Records:** [count]
- **Record Types:** [list with active/inactive status]
- **Active Layout:** [layout name per record type] ★
- **Key Fields:** [important fields present on layout]
- **Relationships:** [notable lookups/master-details]
- **Cinematic Universe Data:** [count of records with LS.* External_IDs, if applicable]
```

Mark the active layout with ★ — this is the primary build surface.

Flag any objects with 0 records that are likely needed for the demo scenario.
