# Demo Spec — Output Format

Save to: `orgs/[alias]-[customer]/demo-spec-[YYYY-MM-DD]-[HHmm]-[CUSTOMER].md`

```markdown
# Demo Spec — [Customer Name]
Generated: [Date] [HHmm]
Target Org: [alias] ([username])
Org Audit Used: audit-[YYYY-MM-DD]-[HHmm].md
API Version: [from sfdx-project.json]

## Customer Context
- **Company:**
- **Industry vertical:** (MedTech / Pharma / Both)
- **Key pain point:**
- **Value theme:**
- **Demo stakeholders:**
- **Competitive context:**

## Cinematic Universe References
- **Personas used:** [which Makana personas, with External_IDs]
- **Products referenced:** [which products, with External_IDs]
- **Accounts involved:** [which accounts, with External_IDs]
- **Competitor narrative:** [if Konkurrent Medical is relevant]

## LSC Object Integration
- **Standard objects leveraged:** [HealthcareProvider, CareTaxonomy, Territory2, etc.]
- **Territory model implications:** [if territory-aware features are used]
- **Care taxonomy paths:** [if navigating taxonomy hierarchy]

## Scenario: [Name]
**Business story:**
**Core capability:**
**Pain point addressed:**
**Primary build surface:** (app, objects, layouts from audit)
**New metadata required:** (justify each new item)
**Org conflicts:** (what to check/avoid)

## Claude Code Instructions
> /scout-building executes this section autonomously.

### Objects & Fields
- [Object API name] — extending existing / new (justified)
  - [Field API] ([Type], Required: yes/no)

### Record Types
- [Object]: [Name] — [description]

### Permission Set
- Name: LSDO_[MT|PH]_[Feature]_Access
- Objects: [CRUD per object]
- Fields: [FLS per field — exclude Required]

### Flows
- [Flow API name] — [type], [object], [brief logic]

### Apex
- [Class name] — [purpose]

### LWC
- [Component name] — [purpose]

### Agentforce
- [Agent name] — [topics], [actions]

### Data Seeding
- [Object]: [count] records, [source: CSV/script/manual]

## SE Manual Checklist
- [ ] [Items requiring human action]
- [ ] [Visual QA, reports, dashboards, etc.]

## Platform Constraints
- [Any release-gated features or known limitations discovered during research]

## Docs Consulted
- **Question:** [one line]
  - **URL:** [doc URL]
  - **Verdict:** [confirmed/contradicted/ambiguous]
```
