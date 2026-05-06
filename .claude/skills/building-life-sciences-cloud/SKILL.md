---
name: building-life-sciences-cloud
description: "Build, configure, and extend Salesforce Life Sciences Cloud features including clinical data, care programs, provider management, benefits verification, medication management, and MedTech commercial engagement. Use this skill when working with Life Sciences Cloud standard objects, data models, APIs, permission sets, or platform events. TRIGGER when: user mentions Life Sciences Cloud, Health Cloud clinical objects, care programs, provider management, benefits verification, adverse events, medication management, clinical trials, patient engagement, MedTech commercial, or HL7/FHIR integration in a Salesforce context. DO NOT TRIGGER for: general Salesforce development unrelated to Life Sciences Cloud, Customer Engagement add-on (LSC4CE/AFLS4CE), or LSDO naming conventions (use building-lsdo skill instead)."
metadata:
  version: "0.1.0"
  last_updated: "2026-04-29"
aliases:
  - life-sciences-cloud
  - LSC
tags:
  - life-sciences
  - salesforce
  - lsdo
  - medtech
  - pharma
---

# Life Sciences Cloud

Life Sciences Cloud is Salesforce's end-to-end, purpose-built platform for the life sciences industry spanning clinical, medical, and commercial domains. It provides standard objects, Business APIs, platform events, and invocable actions for managing clinical data, care programs, provider relationships, benefits verification, medication, adverse events, clinical trials, document automation, and MedTech commercial operations.

## How to Use This Skill

This file maps user intent to task domains with required steps. The [Data Model Reference](references/data-model-reference.md) contains the complete object catalog organized by feature area. The [APIs and Events Reference](references/apis-and-events-reference.md) contains Business APIs, platform events, invocable actions, and custom metadata types. ALWAYS read relevant reference files BEFORE building configurations.

This skill covers Life Sciences Cloud platform capabilities. For LSDO naming conventions, permission sets, record types, and demo data standards, use the **building-lsdo** skill. For data migration, use the **migrating-sfdmu-data** skill.

## Rules That Always Apply

1. **Standard objects first.** Life Sciences Cloud provides 100+ standard objects across clinical, patient engagement, provider, and commercial domains. Always check the [Data Model Reference](references/data-model-reference.md) before creating custom objects. A standard object likely exists for your use case.

2. **Flag Customer Engagement objects.** Life Sciences Cloud for Customer Engagement (LSC4CE / AFLS4CE / Agentforce Life Sciences for Customer Engagement) is a separate add-on package with its own license. LSC4CE objects are cataloged in the [Data Model Reference](references/data-model-reference.md) in a dedicated section at the end, with "Also in Base LSC?" flags. Do not recommend LSC4CE-only objects unless the user confirms the add-on is enabled in their org. If a user requests features that depend on LSC4CE-only objects, flag that it requires the add-on license.

3. **Feature area awareness.** Life Sciences Cloud is organized into four engagement domains. Know which domain your work falls into — it determines which objects, APIs, and permission sets apply:
   - **Clinical Engagement** — Adverse events, participant management, site management (clinical trials)
   - **Patient Engagement** — Care programs, integrated care management, clinical data model, benefits verification, utilization management, medication, provider relationships, provider networks, financial assistance, insurance, document automation, advanced therapy, social determinants, disease surveillance, home health, patient segmentation, timeline, FHIR interoperability
   - **MedTech Commercial Engagement** — Intelligent sales, medical insights
   - **Common** — Objects shared across domains (Account, Contact, Product2, HealthcareProvider, HealthcareFacility)

4. **Person Accounts for patients.** Life Sciences Cloud uses Person Accounts to represent patients/members. Ensure Person Accounts are enabled in the org before building patient-facing features.

5. **HL7 FHIR alignment.** The clinical data model aligns with HL7 FHIR resources (Encounter, MedicationRequest, AllergyIntolerance, Condition, Immunization, etc.). When mapping external health data, use the standard clinical objects — they are designed for FHIR interoperability.

6. **Use Business APIs for complex operations.** Life Sciences Cloud provides Connect REST Business APIs for operations that span multiple objects (provider search, benefits verification, patient CRUD, care program enrollment). Use these APIs instead of building custom multi-object logic. See [APIs and Events Reference](references/apis-and-events-reference.md).

7. **Subscribe to platform events for status changes.** Use `CareBnftVrfyRqstStsChgEvent` for benefits verification status changes and `ApplnFormAppealStsChgEvnt` for financial assistance appeal status changes. Do not poll for status — subscribe.

8. **Clinical code systems.** Use `CodeSet` and `CodeSetBundle` objects for standard clinical coding (ICD-10, CPT, SNOMED, NDC). Do not create custom picklists for clinical codes that have standard code sets.

9. **Research study objects for clinical trials.** Use the `ResearchStudy*` family of objects for clinical trial management. These support participant tracking, randomization, comparison groups, and site management.

10. **Document lifecycle.** Use `LifeScienceDocument`, `LifeScienceDocumentTemplate`, and `LifeSciDocTemplateVersion` for document generation. Use `ReceivedDocument` and `ReceivedDocumentType` for incoming document processing. Use `DigitalSignature*` objects for e-signatures.

11. **Feature-specific permissions.** Life Sciences Cloud uses additive permission sets. Assign the base `Health Cloud Foundation` permission set plus `Health Cloud for Life Sciences`, then add feature-specific permissions (e.g., `Manage Care Programs`, `Manage Utilization Management`, `Manage Provider Network Management`). See [APIs and Events Reference](references/apis-and-events-reference.md) for the full list.

12. **API version gating.** Objects and fields are introduced at specific API versions (v49.0 through v62.0+). Newer features like Pharmacy Benefits Verification (v61.0) and Financial Assistance (v62.0) require minimum API versions. Check the [APIs and Events Reference](references/apis-and-events-reference.md) for version requirements.

13. **SourceSystem fields for integration.** Most Life Sciences Cloud objects include `SourceSystem` and `SourceSystemIdentifier` fields for external system mapping. Use these for integration traceability rather than custom fields.

## Feature Area Quick Reference

| Feature | Primary Objects | Domain |
|---------|----------------|--------|
| Care Programs | CareProgram, CareProgramEnrollee, CareProgramProduct, CareProgramProvider, CareProgramGoal | Patient Engagement |
| Integrated Care | CarePlan, CareEpisode, CareGap, CareTask, ClinicalMeasure, GoalDefinition | Patient Engagement |
| Clinical Data | ClinicalEncounter, HealthCondition, DiagnosticSummary, ClinicalServiceRequest, ClinicalAlert | Patient Engagement |
| Medication | Medication, MedicationRequest, MedicationStatement, MedicationDispense, MedicationReconciliation | Patient Engagement |
| Adverse Events | AdverseEventEntry, AdverseEventAction, AdverseEventCause, AdverseEventOutcome, AdverseEventParty | Clinical Engagement |
| Provider Management | HealthcareProvider, HealthcareProviderNpi, HealthcareProviderSpecialty, HealthcareFacility, BoardCertification | Patient Engagement |
| Provider Networks | ProviderNetworkContract, ProviderNetworkTier, CareFeeScheduleItem, FeeScheduleDefinition | Patient Engagement |
| Benefits Verification | CareBenefitVerifyRequest, CoverageBenefit, CoverageBenefitItem, CoverageBenefitItemLimit | Patient Engagement |
| Utilization Mgmt | CarePreauth, CarePreauthItem, CareRequest, CareRequestItem, CareRequestDrug | Patient Engagement |
| Health Insurance | Member, Payer, Purchaser, MemberPlan, PurchaserPlan, PlanBenefit | Patient Engagement |
| Financial Assistance | Benefit, BenefitType, Applicant, CareProgramAssistance, ProgramEnrollment | Patient Engagement |
| Clinical Trials | ResearchStudy, ResearchStudyCandidate, ResearchStudyCmprGroup, ResearchStdyRandomization | Clinical Engagement |
| Document Automation | LifeScienceDocument, LifeScienceDocumentTemplate, ReceivedDocument, OcrDocumentScanResult | Patient Engagement |
| Electronic Signatures | DigitalSignature, DigitalSignatureRequest, DigitalVerification, DigitalVerificationSetup | Patient Engagement |
| Advanced Therapy | AdvTherapyFieldOptOverride, CustodyChainEntry, WorkProcedure, ServiceAppointmentGroup | Patient Engagement |
| Social Determinants | CareBarrier, CareDeterminant, CareBarrierType, CareInterventionType | Patient Engagement |
| Disease Surveillance | DiseaseDefinition, DiseaseInvestigation, DiseaseOutbreak, DiseaseInvestigationCase | Patient Engagement |
| Patient Segmentation | HealthScore, PartyProfile, HealthRiskEvaluation, AgeBandHlthRskAdjFctr | Patient Engagement |
| Home Health | CareServiceVisit, CareServiceVisitPlan, ScheduleBroadcast, PartySchedulePreference | Patient Engagement |
| FHIR Interoperability | InteropTopic, InteropTopicSubscription, InteropTopicFilter, InteropTopicTriggerCriteria | Patient Engagement |
| Coverage Discovery | ServiceInformationRequest, ServiceInformationResponse, ServiceInfoResponseCoverage | Patient Engagement |
| MedTech Commercial | MedicalInsight, Visit, VisitedParty, ProductAvailabilityProjection | MedTech Commercial |
| Account Planning | AccountPlan, AccountPlanParticipant, AccountPlanProduct, AccountPlanStakeholder | MedTech Commercial |
| Allergy/Immunization | AllergyIntolerance, PatientImmunization, PatientImmunizationProtocol, PatientHealthReaction | Patient Engagement |
| Program Outcomes | Outcome, OutcomeActivity, IndicatorDefinition, IndicatorResult, IndicatorPerformancePeriod | Patient Engagement |

## Task Domains

Every task domain below has **Required Steps**. Follow verbatim, in order.

### Configure Care Programs

User wants to set up care programs for patient enrollment, tracking, and outcome management.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Care Program Management section. Understand the CareProgram object hierarchy.
2. **Confirm LSDO standards** — If working in an LSDO org, confirm record types and naming with **building-lsdo** skill.
3. **Create CareProgram record** — Define the program with eligibility rules (`CareProgramEligibilityRule`), available products (`CareProgramProduct`), and provider associations (`CareProgramProvider`).
4. **Configure enrollment** — Set up enrollment flows using `CareProgramEnrollee` and `CareProgramEnrolleeProduct`. Use the Care Program Enrollments Business API for programmatic enrollment.
5. **Set up sites and teams** — Associate sites (`CareProgramSite`, `CareProgramSiteContract`) and team members (`CareProgramTeamMember`).
6. **Define goals** — Create `CareProgramGoal` records for outcome tracking.
7. **Wire status tracking** — Subscribe to relevant platform events for status change notifications.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Care Program Management objects
2. [APIs and Events Reference](references/apis-and-events-reference.md) — Care Program Enrollments API

### Build Integrated Care Management

User wants to configure care plans, care episodes, care gaps, clinical measures, or care coordination workflows.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Integrated Care Management section.
2. **Set up care plans** — Use `CarePlan` as the central coordination document. Define activities (`CarePlanActivity`, `CarePlanActivityDetail`) and link to problems and goals (`ProblemDefinition`, `GoalDefinition`, `ProblemGoalDefinition`).
3. **Use templates** — Create `CarePlanTemplate` records with predefined goals (`CarePlanTemplateGoal`) and problems (`CarePlanTemplateProblem`) for standardized care plans.
4. **Track care episodes** — Use `CareEpisode` and `CareEpisodeDetail` to define distinct care periods.
5. **Identify care gaps** — Configure `CareGap` records with evaluation criteria (`CareGapCriteriaResult`) to surface gaps in care delivery.
6. **Define clinical measures** — Use `ClinicalMeasure`, `ClinicalMeasureCriteria`, and `ClinicalMeasureCriteriaGrp` for quality measurement.
7. **Manage tasks** — Use `CareTask` and `CareTaskDetail` for individual care coordination action items.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Integrated Care Management objects

### Set Up Utilization Management

User wants to configure prior authorization, care requests, or utilization review workflows.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Utilization Management section.
2. **Configure prior authorization** — Use `CarePreauth` as the primary prior auth record with line items (`CarePreauthItem`). Link to `MemberPlan` for insurance context.
3. **Build care request workflows** — Use `CareRequest` for utilization management requests. Associate drugs (`CareRequestDrug`), items (`CareRequestItem`), reviewers (`CareRequestReviewer`), and supporting content (`CareRequestSupportingCntnt`).
4. **Track diagnoses** — Use `CareDiagnosis` for diagnoses relevant to utilization review.
5. **Handle errors** — Use `CareProcessingError` for processing error tracking.
6. **Track communications** — Use `TrackedCommunication` and `TrackedCommunicationDetail` for utilization management communications.
7. **Confirm permissions** — Ensure `Manage Utilization Management` permission is assigned. See [APIs and Events Reference](references/apis-and-events-reference.md).

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Utilization Management objects
2. [APIs and Events Reference](references/apis-and-events-reference.md) — Permission sets

### Build Clinical Data Workflows

User wants to capture clinical encounters, conditions, medications, allergies, or immunizations.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Clinical Data Model section. Identify which clinical objects apply.
2. **Map to FHIR resources** — If integrating with external EHR, map FHIR resources to Life Sciences Cloud objects (Encounter → ClinicalEncounter, Condition → HealthCondition, MedicationRequest → MedicationRequest, etc.).
3. **Configure encounters** — Use `ClinicalEncounter` as the hub. Associate diagnoses (`ClinicalEncounterDiagnosis`), providers (`ClinicalEncounterProvider`), facilities (`ClinicalEncounterFacility`), and service requests (`ClinicalEncounterSvcRequest`).
4. **Set up medication tracking** — Use `Medication` for drug definitions, `MedicationRequest` for prescriptions, `MedicationStatement` for patient history, and `MedicationDispense` for pharmacy records.
5. **Configure allergy and immunization** — Use `AllergyIntolerance` for allergies, `PatientImmunization` and `PatientImmunizationProtocol` for vaccination records.
6. **Use code sets** — Reference `CodeSet` and `CodeSetBundle` for ICD-10, CPT, SNOMED, and other standard clinical codes.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Clinical Data Model, Medication Management, Allergy/Immunization objects
2. [APIs and Events Reference](references/apis-and-events-reference.md) — Patient APIs

### Configure Provider Management

User wants to manage healthcare providers, facilities, networks, and provider search.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Provider Relationship Management section.
2. **Set up providers** — Use `HealthcareProvider` as the core provider record. Add specialties (`HealthcareProviderSpecialty`), NPI data (`HealthcareProviderNpi`), taxonomy (`HealthcareProviderTaxonomy`), and services (`HealthcareProviderService`).
3. **Configure facilities** — Use `HealthcareFacility` for locations and `HealthcareFacilityNetwork` for network groupings.
4. **Link practitioners to facilities** — Use `HealthcarePractitionerFacility` for provider-facility affiliations and `ProviderAffiliation` for organizational relationships.
5. **Configure provider search** — Use `CareProviderSearchConfig` and `CareProviderSearchableField` to define searchable provider attributes. Use the Advanced Provider Search and Provider Search Business APIs for search functionality.
6. **Set up payer networks** — Use `HealthcarePayerNetwork` for insurance network relationships.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Provider Relationship Management objects
2. [APIs and Events Reference](references/apis-and-events-reference.md) — Provider APIs (Search, Create, Upsert, Download)

### Set Up Benefits Verification

User wants to configure insurance benefits verification and coverage tracking.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Benefits Verification and Health Insurance sections.
2. **Configure insurance model** — Set up `Member`, `Payer`, `Purchaser`, and `MemberPlan` records to represent the insurance landscape.
3. **Build verification flow** — Use `CareBenefitVerifyRequest` to create verification requests. Use the Benefits Verification Business API for programmatic verification.
4. **Track coverage** — Use `CoverageBenefit`, `CoverageBenefitItem`, and `CoverageBenefitItemLimit` to record coverage details.
5. **Subscribe to status events** — Subscribe to `CareBnftVrfyRqstStsChgEvent` platform event for verification status changes.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Benefits Verification and Health Insurance objects
2. [APIs and Events Reference](references/apis-and-events-reference.md) — Benefits Verification API, CareBnftVrfyRqstStsChgEvent

### Manage Clinical Trials

User wants to configure clinical trial management including participant enrollment, randomization, and site management.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Clinical Trials section.
2. **Create study** — Use `ResearchStudy` as the root object. Add protocol info (`ResearchStudyProtocolInfo`) and site relationships (`ResearchStudyRelation`).
3. **Configure participant management** — Use `ResearchStudyCandidate` for participant records. Track status periods with `ResearchStdyCndtStatusPrd`.
4. **Set up randomization** — Define comparison groups (`ResearchStudyCmprGroup`). Configure randomization logic (`ResearchStdyRandomization`), criteria (`RsrchStdyRandomizationCrit`), and block slots (`ResearchStdyRndmBlockSlot`, `RsrchStdyRandomizationBlock`).
5. **Configure search** — Use `ResearchStdySearchableField` for trial search capabilities.
6. **Use invocable actions** — Life Sciences Cloud provides standard invocable actions for clinical trial participant enrollment. Use these in Flows rather than building custom enrollment logic.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Clinical Trials / Site Management objects
2. [APIs and Events Reference](references/apis-and-events-reference.md) — Invocable actions for trial enrollment

### Configure Adverse Event Tracking

User wants to set up adverse event reporting and tracking for pharmacovigilance.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Adverse Events section.
2. **Configure core reporting** — Use `AdverseEventEntry` as the primary record. This is the parent for all adverse event detail objects.
3. **Set up detail tracking** — Associate child records: `AdverseEventAction` (actions taken), `AdverseEventCause` (identified causes), `AdverseEventContribFactor` (contributing factors), `AdverseEventOutcome` (outcomes), `AdverseEventParty` (involved parties), `AdverseEventSupportInfo` (supporting documentation), `AdverseEvntResultingEffect` (resulting effects).
4. **Build reporting flows** — Create Flows for adverse event intake forms that populate the AdverseEventEntry hierarchy.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Adverse Events objects

### Build Document Automation

User wants to configure document generation, template management, or incoming document processing.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), Document Automation and Electronic Signatures sections.
2. **Set up templates** — Use `LifeScienceDocumentTemplate` for templates with versioning via `LifeSciDocTemplateVersion`. Use `DocumentTemplate` for simpler template needs.
3. **Configure document generation** — Use `LifeScienceDocument` for generated documents.
4. **Handle incoming documents** — Use `ReceivedDocument` and `ReceivedDocumentType` for document intake and classification.
5. **Add e-signatures** — Use `DigitalSignatureRequest` to initiate signature workflows. Track completion with `DigitalSignature`. Configure verification with `DigitalVerificationSetup` and `DigitalVerfSetupDetail`.
6. **Use Business APIs** — Use the Record Creation/Update with Content Documents and Received Documents APIs for programmatic document operations. Use Split Documents API for document separation.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — Document Automation and Electronic Signatures objects
2. [APIs and Events Reference](references/apis-and-events-reference.md) — Document Management APIs

### Configure MedTech Commercial

User wants to set up MedTech intelligent sales, medical insights, or commercial engagement features.

#### Required Steps

1. **Read data model** — Read [Data Model Reference](references/data-model-reference.md), MedTech Commercial Engagement section.
2. **Set up medical insights** — Use `MedicalInsight` as the core record. Link to accounts (`MedicalInsightAccount`), products (`MedicalInsightProduct`), and goals (`MedicalInsightGoalDef`).
3. **Configure account planning** — Use `AccountPlan`, `AccountPlanParticipant`, `AccountPlanProduct`, `AccountPlanRelationship`, and `AccountPlanStakeholder` for key account management.
4. **Integrate with LSDO** — If building in an LSDO org, align MedTech commercial objects with the [[skills/building-lsdo/SKILL|LSDO]] naming conventions and the [[skills/lsdo-cinematic-universe/makana-medtech-cinematic-universe|Makana MedTech Cinematic Universe]] for demo stories.

#### Reference Files

1. [Data Model Reference](references/data-model-reference.md) — MedTech Commercial Engagement objects
2. [APIs and Events Reference](references/apis-and-events-reference.md) — Account Management APIs

### Review Life Sciences Cloud Configuration

User wants to audit or verify an org's Life Sciences Cloud setup.

#### Required Steps

1. **Check enabled features** — Verify which Life Sciences Cloud features are enabled in the org.
2. **Validate object usage** — Cross-reference custom objects against [Data Model Reference](references/data-model-reference.md) to identify standard objects that should replace custom solutions.
3. **Check Person Account setup** — Verify Person Accounts are enabled for patient-facing features.
4. **Verify API usage** — Check for custom code that duplicates Business API functionality. Recommend migration to standard APIs where applicable.
5. **Check platform event subscriptions** — Verify status change events are subscribed to rather than polled.
6. **Validate LSDO compliance** — If in an LSDO org, check naming, record types, and permissions against **building-lsdo** standards.

## Related Skills

- [building-lsdo](../building-lsdo/SKILL.md) — naming conventions, permission sets, and build standards for the LSDO org
- [managing-medtech-territories](../managing-medtech-territories/SKILL.md) — Territory2 hierarchy, user assignments, and PATI records for MedTech
- [lsdo-cinematic-universe](../lsdo-cinematic-universe/SKILL.md) — Makana MedTech demo personas, accounts, and narrative context
