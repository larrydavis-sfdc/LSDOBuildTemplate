# Change Log — Output Format

Save to: `orgs/[alias]-[customer]/changes-[YYYY-MM-DD]-[HHmm].md`

```markdown
# Change Log — [Customer Name]
Generated: [Date] [HHmm]
Spec Used: demo-spec-[YYYY-MM-DD]-[HHmm]-[customer].md
Target Org: [alias] ([username])

## Summary
- **Deployed:** [count] items
- **Skipped:** [count] items
- **Duration:** [time]

## Phase 1: Structural Metadata
| Item | Type | Status | Notes |
|------|------|--------|-------|
| [API Name] | CustomObject | ✅ Deployed | |
| [API Name] | CustomField | ✅ Deployed | |
| [API Name] | PermissionSet | ✅ Deployed + Assigned | |

## Phase 2: Logic
| Item | Type | Status | Notes |
|------|------|--------|-------|
| [API Name] | Flow | ✅ Active | FlowTest passed |
| [API Name] | ApexClass | ✅ Deployed | Code analyzer clean |
| [API Name] | LWC | ⚠️ Skipped | [error message] |

## Phase 3: Agentforce
| Item | Type | Status | Notes |
|------|------|--------|-------|
| [API Name] | Agent | ✅ Published | Smoke test passed |

## Permission Sets
- **Created:** [Name] — assigned to [username]
- **Updated:** [Name] — added [fields/objects]

## Data Seeded
- [Object]: [count] records via [method]

## Rollback Commands
```bash
# Phase 1
sf project delete source --metadata CustomObject:[Name] --target-org [alias]
sf project delete source --metadata CustomField:[Object].[Field] --target-org [alias]

# Phase 2
sf project delete source --metadata Flow:[Name] --target-org [alias]

# Phase 3
sf agent unpublish --name [AgentName] --target-org [alias]
```

## SE Manual Checklist (Remaining)
- [ ] [Items from spec that weren't automated]

## Issues Encountered
- [Description of any problems and how they were resolved]

## Docs Consulted
- [Any Salesforce Docs lookups during deployment]
```
