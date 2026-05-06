---
name: building-lsdo-medtech
description: "Life Sciences Demo Org (LSDO) build standards for Salesforce metadata, data, flows, naming, permissions, automation, and documentation. Use this skill when creating, modifying, or reviewing metadata, data, flows, or docs for a Life Sciences demo org (LSDO). TRIGGER when: user mentions LSDO, Life Sciences demo org, MedTech demo, Pharma demo, or sub-verticals MT/PH in a build context; creates custom objects, fields, flows, permission sets, record types, agents, apps, or demo data in a Life Sciences org. DO NOT TRIGGER for: general Salesforce development unrelated to LSDO demo orgs."
alwaysApply: true
metadata:
  version: 0.1.0
  last_updated: 2026-04-29
aliases:
  - lsdo
  - LSDO
tags:
  - life-sciences
  - lsdo
  - salesforce
  - demo
  - medtech
  - pharma
---

# LSDO Build Standards

Standards for building in Life Sciences Demo Orgs. Confirm sub-vertical, persona, permission sets, record types, and golden records **during planning** before implementing.

> **Think Before Coding:** Before generating any metadata, state your assumptions about sub-vertical (MT/PH), target app, persona, and record type strategy. If any are ambiguous, ask — don't pick silently.

## Production-Quality Standard

LSDO demos are not throwaway prototypes. They are built, maintained, and demonstrated to customers and internal stakeholders as representations of what Salesforce can do. Every demo must meet production-level quality standards:

- **No shortcuts.** Do not skip steps because "it's just a demo." Every rule in this document applies in full.
- **No hardcoded workarounds.** If something would be unacceptable in a customer's production org, it is unacceptable here. No hardcoded Ids, no inline SOQL without governor awareness, no hacked-together automations.
- **Proper access control.** Permission sets must be complete and self-contained. Sharing rules, record types, and field-level security must be intentional — not wide open because it's easier.
- **Maintainability.** Other SEs will inherit this work. Naming conventions, documentation, and clean metadata are not optional. If you cannot explain what a component does from its name and description alone, fix the name and description.
- **Deployability.** Demos must be packageable and portable via SFDMU and metadata deploys. No manual setup steps that aren't documented. No dependencies on a specific user, a specific record Id, or org-specific state that isn't captured in the migration artifacts.
- **Reliability.** Demos fail in front of customers when built carelessly. Flows must handle null values. Data must be complete. Territory alignments must be in place. Test the demo end-to-end before calling it done.

## Rules That Always Apply

1. **Standard objects first.** Prefer standard objects and fields (including [Life Sciences API objects](https://developer.salesforce.com/docs/atlas.en-us.life_sciences_dev_guide.meta/life_sciences_dev_guide/life_sciences_sforce_api_objects.htm)). Avoid objects that exist only for Life Sciences Cloud for Customer Engagement (LSC4CE/AFLS4CE/Agentforce Life Sciences for Customer Engagement) unless the scenario explicitly requires them.

2. **Reuse before create.** Reuse existing flows, record types, Apex, objects, and automation in the target org when they fit. Do not duplicate.

3. **Declarative first.** Prefer Flow or OmniStudio over Apex. If Apex is required, confirm in planning first. For record-triggered flows that only update fields on the triggering record, prefer **before-save** (Fast Field Updates) — it avoids an extra DML operation and is simpler. Use after-save only when the flow needs to create/update related records or call external services.

4. **No System Administrator persona.** Do not use System Administrator as the demo persona. Pick or define the correct persona(s); confirm new personas in planning.

5. **Self-contained demo permission set.** Each demo must have a dedicated permission set that grants all object, field, tab, app, record type, and page layout access required for the end-user demo persona. The permission set must be entirely self-contained — a user assigned only that permission set (plus login basics) should be able to run the full demo. If the demo also requires admin-level setup or configuration access, create a corresponding admin permission set (e.g. `LSDO_MT_Field_Sales_Rep` for end users, `LSDO_MT_Field_Sales_Rep_Admin` for admin setup). Use permission sets or permission set groups, never profiles. Confirm all permission sets in planning before building.

6. **Correct agent types.** Do not use Copilot Agent for internal users — use Employee Agent. External scenarios use Service Agent (or appropriate type). Confirm agent type in planning. UX name may omit `LSDO`; API name must follow naming conventions (API names are often immutable after save).

7. **Standard actions and templates first.** When creating an Agentforce agent, always check the [Standard Actions Catalog](../developing-agentforce/references/standard-actions-catalog.md) and [Standard Prompt Templates Catalog](../developing-agentforce/references/standard-prompt-templates-catalog.md) before building custom actions or prompt templates. Salesforce ships 240+ standard actions and 60+ standard prompt templates across Sales, Service, Commerce, Field Service, Industries (including Life Sciences Cloud), and more. Standard actions and templates are production-ready, require no backing logic, and templates can be cloned and customized in Prompt Builder. Only build custom when no standard option covers the use case.

8. **Isolate each demo to a Lightning App.** Every demo must live in its own Lightning App. Assign page layouts, record pages, home pages, and utility bars to that app only — never activate them org-wide or on another demo's app. The app acts as the blast-radius boundary: toggling the app on or off (via permission set) should show or hide the entire demo experience. Confirm the target app in planning; reuse an existing LSDO app if one already covers the scenario.

9. **No hardcoded Salesforce IDs — ever.** Salesforce record IDs (15- or 18-character alphanumeric strings beginning with a 3-character key prefix like `001`, `012`, `0kl`, `0MI`) are org-specific. They change between orgs and are meaningless outside the org they were created in. **Never hardcode them anywhere** — not in Apex, not in Flow formulas, not in SFDMU configs, not in metadata XML, not in deployment scripts.

   Always resolve IDs dynamically at runtime:
   - **Apex**: use `[SELECT Id FROM ... WHERE External_ID__c = 'LS.MT.XYZ.001' LIMIT 1].Id` or collect via `Map<String, Id>` keyed on External_ID__c
   - **Flow**: use Get Records → filter on External_ID__c → use the resulting record ID
   - **SFDMU**: reference related records via `Object.External_ID__c` relationship traversal in queries; use `externalId: "External_ID__c"` for upsert keys
   - **Metadata XML**: never embed a record ID in XML; use API names or formula references

   When you encounter a hardcoded ID in existing code, treat it as a bug and fix it before deploying to a new org. A deployment that works on NOICE but fails on a target org because of hardcoded IDs is a broken deployment.

10. **Portable flows.** Design flows so any valid record can drive the demo, not a single hardcoded "golden" row unless unavoidable.

11. **Golden records.** Confirm which golden record(s) apply; confirm before creating new ones.

12. **Record type strategy.** Every object used in the build must have an LSDO record type strategy: reuse an existing LSDO record type or create one; confirm in planning per object.

13. **External Ids on data.** New or updated demo records must use the agreed record type and include `External_Id__c` (or org-standard external id field) populated.

14. **LSDO naming in all API names.** API names start with `LSDO_` unless org policy says otherwise. Match LSDO / MT / PH naming in API names and descriptions so demo scope is self-documenting.

15. **Immutable API names — get them right up front.** Treat Flow, Agent, Agent Topic, and Agent Action API names as unchangeable after save.

16. **Disable LifeScienceTriggerHandler for MedTech builds.** Before any MedTech (MT) data loads or metadata deployments, deactivate all `LifeScienceTriggerHandler` records using the Tooling API. Query all records, then set `IsActive = false` on each. This prevents managed-package triggers from interfering with demo data setup. Run this as the first step in any MedTech build.

    ```bash
    # Query all LifeScienceTriggerHandler records
    sf data query --query "SELECT Id, DeveloperName, IsActive FROM LifeScienceTriggerHandler" --use-tooling-api --json

    # Deactivate each record (repeat for each Id)
    sf data update record --sobject LifeScienceTriggerHandler --record-id <Id> --values "IsActive=false" --use-tooling-api --json
    ```

17. **Territory alignment for demo accounts.** Every account used by the demo persona must be aligned to that persona's territory (via `ObjectTerritory2Association`). If the account is not already in the territory, create the alignment. Confirm territory assignments during planning using the [MedTech Territory Model](../managing-medtech-territories/SKILL.md). Without alignment, territory-filtered views, reports, and Agentforce grounding will not surface the account.

## Naming Conventions

### Principles

| Layer | Rule |
|-------|------|
| **API names** | Start with `LSDO_` unless org policy says otherwise. |
| **Sub-vertical** | `MT` = MedTech, `PH` = Pharma — confirm in planning. Always use the abbreviation (`MT`/`PH`) in API names, never the spelled-out form. |
| **Descriptions** | Brief reason + timing, e.g. `LS — Created Jan 2026 for Patient Services`. For flows, add enough detail for SEs on how and when the flow runs. |
| **Immutable API names** | Flow, Agent, Agent Topic, Agent Action API names are unchangeable after save. |
| **No suffixes on API names** | Do not append `_pset`, `_obj`, `_flow`, or similar type suffixes. The metadata type is already clear from context. |

### Patterns by Metadata Type

| Type                                   | Label                                                       | API Name Example                                                                                                      |
| -------------------------------------- | ----------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| Custom object                          | Human-readable display name                                 | `LSDO_Activities_by_Specialty` (no sub-vertical)                                                                      |
| Custom field                           | Display name                                                | `LSDO_Segment`                                                                                                        |
| External Id values                     | —                                                           | `LS.<SubVert>.<ObjectAbbr>.###` (where ### is always a 3 digit number) e.g. `LS.MT.Account.001`, `LS.PH.AppAlert.001` |
| Lightning app                          | LSDO demo naming — one app per demo                         | `LSDO_PH_Makana_Patient_Services`                                                                                     |
| Lightning record page                  | `Object-LSDO-<SubVert>-<Persona>(s)_[UseCase]_[RecordType]` | `Account_LSDO_PH_Field_Sales_HCP`                                                                                     |
| Home page                              | `Home-LSDO-<SubVert>-<Persona>-<AppAbbr>`                   | `Home_LSDO_MT_FSR_LS_Commercial`                                                                                      |
| Record type                            | Display-oriented name                                       | `LSDO_Healthcare_Organization`                                                                                        |
| Permission set (end-user)              | `LSDO_<SubVert>_<Persona>[-UseCase]`                        | `LSDO_MT_Field_Sales_Rep`, `LSDO_PH_Field_Reimbursement_Manager`                                                      |
| Permission set (admin)                 | `LSDO_<SubVert>_<Persona>_Admin[-UseCase]`                  | `LSDO_MT_Field_Sales_Rep_Admin`                                                                                        |
| Profile (cloud-shipped)                | Align with existing LSDO naming                             | `LSDO_PH_Field_Medical`                                                                                               |
| Flow                                   | `LSDO_<SubVert>_<Persona>_<UseCase>_<FlowName>`             | Spaces → underscores in API. Action Plan flows: descriptive label, API still `LSDO_...`                               |
| Apex                                   | `LSDO_<UseCase>_<Name>`                                     | LSC4CE mobile inline: `lscMobileInline-<UseCase><Name>` (requires `lsc` prefix)                                       |
| Agent                                  | —                                                           | `LSDO_PH_Field_Reimb_Manager_Agent`                                                                                   |
| Agent topic / action / prompt template | Sub-vertical + use case prefix                              | Verify current org behavior for Winter '26+ versioning                                                                |
| OmniStudio                             | Prefer alphabetic API names                                 | Limit special characters                                                                                              |
| Sharing rules                          | —                                                           | If name cannot be changed, flag for ISS / documentation                                                               |
| LSC4CE roles                           | Follow ISS direction                                        | Do not create ad hoc groups                                                                                           |

## Task Domains

### Create or Modify Metadata

User wants to create new objects, fields, flows, permission sets, record types, apps, agents, or other metadata in an LSDO org.

#### Required Steps

1. **Disable LifeScienceTriggerHandler (MedTech only)** — If the sub-vertical is MT, deactivate all `LifeScienceTriggerHandler` records via the Tooling API before any other work (see Rule 16).
2. **Gather planning inputs** — Confirm: sub-vertical (MT/PH), persona(s), target Lightning App, target permission set(s), record type strategy per object, golden record(s), and agent type (if applicable). Do not proceed without these.
2. **Check for reuse** — Search the target org or project for existing metadata that fits. Reuse before creating.
3. **Apply naming** — Use the naming conventions table above. For immutable API names (Flow, Agent, Agent Topic, Agent Action), confirm the name with user before saving.
4. **Build declaratively** — Prefer Flow or OmniStudio. Apex only if confirmed in planning.
5. **Isolate to Lightning App** — Assign all record pages, home pages, and utility bars to the demo's Lightning App only. Do not activate them org-wide or on other apps. The app is the demo's boundary.
6. **Build self-contained permission set** — Create a dedicated end-user permission set granting all object, field, tab, app, record type, and page layout access needed for the demo. A user with only this permission set must be able to run the full demo. If admin-level access is also needed, create a separate `_Admin` permission set. Do not use profiles.
7. **Validate** — Confirm no hardcoded Ids, `External_Id__c` populated on data, correct record types applied. Verify the permission set is self-contained by checking that all objects/fields/tabs/record types used in the demo are included.
8. **Document** — Produce all required documentation (see Documentation section), including the [LSDO migration documentation](references/lsdo-migration-documentation.md).

### Create or Modify Demo Data

User wants to create, update, or import demo records.

#### Required Steps

1. **Disable LifeScienceTriggerHandler (MedTech only)** — If the sub-vertical is MT, deactivate all `LifeScienceTriggerHandler` records via the Tooling API before loading data (see Rule 16).
2. **Confirm record type** — Each record must use the agreed record type for its object.
3. **Populate External Id** — Every record must have `External_Id__c` (or org-standard external id) populated, following the pattern `LS.<SubVert>.<ObjectAbbr>.###`.
4. **No hardcoded Ids** — Use `External_Id__c` lookups, not Salesforce Ids, for relationships.
5. **Confirm golden records** — Verify which golden records apply; do not create new ones without confirmation.
6. **Verify territory alignment** — Every account used by the demo persona must be aligned to that persona's territory. Create `ObjectTerritory2Association` records for any missing alignments (see Rule 17).
7. **Document** — Produce the data migration table (see Documentation section).

### Review Existing LSDO Metadata

User wants to audit or review metadata for LSDO compliance.

#### Required Steps

1. **Check naming** — Verify all API names follow LSDO conventions. Flag violations.
2. **Check app isolation** — Verify the demo lives in its own Lightning App. Record pages, home pages, and utility bars should be activated only for that app, not org-wide or on other apps.
3. **Check permission set completeness** — Verify a self-contained end-user permission set exists. It must grant all object, field, tab, app, record type, and page layout access for the demo. Check that an `_Admin` permission set exists if admin-level access is needed. No profile-based access.
4. **Check portability** — Confirm no hardcoded Ids, `External_Id__c` usage, record type strategy.
5. **Check territory alignment** — Verify every account used by the demo persona is aligned to that persona's territory via `ObjectTerritory2Association`. Flag any missing alignments.
6. **Check agent types** — Employee Agent for internal, Service Agent for external. No Copilot Agent for internal.
7. **Check documentation** — Verify technical, admin, data, and metadata docs exist and are current.

## Documentation Requirements

Every LSDO build must produce:

| Document | Contents |
|----------|----------|
| **Technical markdown** | Every new or updated metadata element: purpose, dependencies, deployment notes. |
| **Admin markdown** | Setup steps an admin must perform in the org. |
| **Data migration table** | Columns: Object, Person to contact, New vs modified, External Id generated?, Notes. |
| **Metadata migration table** | Same traceability for metadata packages; align with org's migration checklist format. |
| **LSDO migration documentation** | Structured output document covering Demo Overview and Configuration to Migrate. See [lsdo-migration-documentation.md](references/lsdo-migration-documentation.md) for the required format. |

## Data Migration
- Use SFDMU (see the `migrating-sfdmu-data` skill) when building a demo to package data related to the demo.

## Planning Template

Present this table at the start of every build and fill in confirmed values. Do not proceed past planning without answers for every row. Leave unknown items blank and mark them as requiring confirmation.

| Planning Item | Value |
|---------------|-------|
| Sub-vertical | MT or PH |
| Persona(s) | |
| End-user permission set | `LSDO_<SubVert>_<Persona>` |
| Admin permission set (if needed) | `LSDO_<SubVert>_<Persona>_Admin` |
| Target Lightning App | |
| Target object(s) | Standard first (Rule 1) |
| Record type strategy per object | |
| Golden record(s) | |
| Territory alignment | |
| Agent type (if applicable) | Employee (internal) / Service (external) |
| LifeScienceTriggerHandler | Deactivate (MT only) |

## Related Skills

- [building-life-sciences-cloud](../building-life-sciences-cloud/SKILL.md) — LSC standard objects, data models, APIs, and platform events
- [managing-medtech-territories](../managing-medtech-territories/SKILL.md) — Territory2 hierarchy and PATI records for the MedTech territory model
- [lsdo-cinematic-universe](../lsdo-cinematic-universe/SKILL.md) — Makana MedTech demo personas, accounts, and narrative context
- [using-cumulusci](../using-cumulusci/SKILL.md) — org automation, scratch org setup, and CI/CD for LSDO builds
- [migrating-sfdmu-data](../migrating-sfdmu-data/SKILL.md) — SFDMU export.json for packaging and deploying LSDO demo data
- [generating-permission-set](../generating-permission-set/SKILL.md) — generating correct PermissionSet XML for LSDO roles