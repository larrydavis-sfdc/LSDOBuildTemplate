You are auditing Lightning apps, flows, LWC, and Agentforce agents in org {{ORG_ALIAS}} ({{ORG_USERNAME}}).
Use MCP tools (retrieve_metadata, run_soql_query) for all operations.

## Lightning Apps

```sql
SELECT Id, Label, DeveloperName, IsDefault 
FROM AppDefinition 
WHERE IsSmallFormFactor = false
ORDER BY Label
```

For each app:
- Label and API name
- Tabs included (retrieve app metadata)
- Whether it's the default for System Administrator ★
- LSDO naming compliance (`LSDO_MT_*` or `LSDO_PH_*`)

## Active Flows

```sql
SELECT Id, Label, ApiName, ProcessType, TriggerType, 
       TriggerObjectOrEvent.QualifiedApiName, Description
FROM FlowDefinitionView 
WHERE IsActive = true
ORDER BY ProcessType, Label
```

For each flow:
- Label, API name, type (Record-Triggered/Screen/Autolaunched/Scheduled)
- Trigger object (if applicable)
- Brief logic summary (from description or retrieve flow metadata)
- Execution order concerns (multiple flows on same object/trigger)

## LWC Components

Retrieve LightningComponentBundle metadata. For each:
- Name and purpose (from meta.xml description or component name)
- Which page(s) it appears on (if determinable from flexipages)
- LSDO naming compliance

## Agentforce Agents

```sql
SELECT Id, DeveloperName, MasterLabel, Status 
FROM BotDefinition 
ORDER BY MasterLabel
```

Or check for AiAuthoringBundle metadata via retrieve_metadata.

For each agent:
- Name and status (Active/Inactive/Draft)
- Topics defined
- Actions available
- Whether it's published

## Custom Permission Sets

```sql
SELECT Id, Name, Label, Description 
FROM PermissionSet 
WHERE IsCustom = true AND NamespacePrefix = null
ORDER BY Name
```

For each:
- Name and label
- LSDO naming compliance (`LSDO_[MT|PH]_*_Access`)
- Brief description of what it grants (if determinable)

## Output Format

```markdown
### Lightning Apps
| App | API Name | Default ★ | Tabs | LSDO Naming |
|-----|----------|-----------|------|-------------|

### Active Flows
| Flow | Type | Object | Trigger | Notes |
|------|------|--------|---------|-------|

### LWC Components
| Component | Purpose | Page(s) |
|-----------|---------|---------|

### Agentforce Agents
| Agent | Status | Topics | Actions |
|-------|--------|--------|---------|

### Permission Sets
| Name | Label | LSDO Naming |
|------|-------|-------------|
```

## Flags

- ★ Mark the default System Administrator app
- ⚠️ Flag flow execution order conflicts (multiple active flows on same object + same trigger type)
- ⚠️ Flag non-LSDO-named components that appear to be demo-related
