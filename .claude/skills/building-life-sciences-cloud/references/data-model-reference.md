# Life Sciences Cloud Data Model Reference

Complete object catalog for Salesforce Life Sciences Cloud, organized by feature area and engagement domain. Use this reference when building on Life Sciences Cloud to identify standard objects before creating custom ones.

Source: [Life Sciences Cloud Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.life_sciences_dev_guide.meta/life_sciences_dev_guide/life_sciences_cloud_overview.htm)

> **LSC4CE objects are flagged.** Objects that exist only in Life Sciences Cloud for Customer Engagement (LSC4CE / AFLS4CE) — a separate add-on package with its own license — are listed in a dedicated section at the end of this document. Objects in the main sections above the LSC4CE section are available in the base Life Sciences Cloud platform. Some base objects (Visit, AccountPlan, MedicalInsight, etc.) are also used by LSC4CE but do not require the add-on.
>
> Source for LSC4CE objects: *Life Sciences Cloud for Customer Engagement Developer Guide (Pilot)*, Version 63.0, Spring '25.

---

## Engagement Domains

Life Sciences Cloud organizes objects into four engagement domains:

| Domain | Scope |
|--------|-------|
| **Clinical Engagement** | Adverse events, participant management, site management (clinical trials) |
| **Patient Engagement** | Care programs, clinical data model, benefits verification, medication, provider relationships, financial assistance, health insurance, document automation, advanced therapy, social determinants, timeline, electronic signatures, patient program outcomes |
| **MedTech Commercial Engagement** | Intelligent sales, medical insights |
| **Common** | Objects shared across domains (Account, Contact, Product2, HealthcareProvider, HealthcareFacility, etc.) |

---

## Clinical Engagement

### Adverse Events

Comprehensive adverse event tracking for pharmacovigilance. `AdverseEventEntry` is the parent record; all detail objects are children.

| Object API Name | Purpose | Parent |
|----------------|---------|--------|
| AdverseEventEntry | Primary adverse event record | — |
| AdverseEventAction | Actions taken in response | AdverseEventEntry |
| AdverseEventCause | Identified causes | AdverseEventEntry |
| AdverseEventContribFactor | Contributing factors | AdverseEventEntry |
| AdverseEventOutcome | Resulting outcomes | AdverseEventEntry |
| AdverseEventParty | Involved parties (reporter, subject, etc.) | AdverseEventEntry |
| AdverseEventSupportInfo | Supporting documentation | AdverseEventEntry |
| AdverseEvntResultingEffect | Resulting clinical effects | AdverseEventEntry |

### Participant Management (Clinical Trials)

Objects for managing clinical trial participants, enrollment, and randomization.

| Object API Name | Purpose |
|----------------|---------|
| ResearchStudy | Clinical trial / research study definition |
| ResearchStudyCandidate | Individual participant record |
| ResearchStudyCmprGroup | Comparison/control group (treatment arm) |
| ResearchStudyRelation | Relationships between study entities (sites, sponsors, investigators) |
| ResearchStudyProtocolInfo | Protocol information including inclusion/exclusion criteria |
| ResearchStdyCndtStatusPrd | Candidate status period tracking |
| ResearchStdyRandomization | Randomization assignment logic |
| RsrchStdyRandomizationCrit | Randomization criteria and stratification rules |
| ResearchStdyRndmBlockSlot | Block randomization slot assignments |
| RsrchStdyRandomizationBlock | Randomization block definitions |
| ResearchStdySearchableField | Configurable search fields for trial discovery |

### Site Management

Objects for managing clinical trial sites and contracts.

| Object API Name | Purpose |
|----------------|---------|
| CareProgramSite | Healthcare facility participating in a care program or trial |
| CareProgramSiteContract | Contractual agreements between programs and sites |

---

## Patient Engagement

### Care Program Management

Central framework for patient care programs, enrollment, and outcome tracking. `CareProgram` is the hub object.

| Object API Name | Purpose |
|----------------|---------|
| CareProgram | Care program definition |
| CareProgramEnrollee | Patient enrolled in a care program |
| CareProgramEnrolleeProduct | Product association for enrolled patient |
| CareProgramEnrollmentCard | Enrollment card for verification |
| CareProgramProduct | Products available within a program |
| CareProgramProvider | Healthcare providers associated with a program |
| CareProgramSite | Physical/operational sites for program delivery |
| CareProgramSiteContract | Contractual agreements for program sites |
| CareProgramTeamMember | Team members involved in program delivery |
| CareProgramGoal | Objectives and measurable targets for enrollees |
| CareProgramDetail | Additional program-specific configuration |
| CareProgramEligibilityRule | Enrollment criteria and requirements |
| CareProgramAssistance | Support services provided to participants |
| CareProgramStatusPeriod | Temporal status change tracking |
| CareProgramCampaign | Marketing campaigns associated with care programs |
| CarePgmProvHealthcareProvider | Links healthcare providers to care programs |
| CareSystemFieldMapping | Field mapping configurations for care systems |
| EnrollmentEligibilityCriteria | Criteria for enrollment eligibility |

### Clinical Data Model

FHIR-aligned clinical objects for capturing patient encounters, conditions, medications, and observations.

#### Clinical Encounters

`ClinicalEncounter` is the hub object for patient visits/interactions.

| Object API Name | Purpose | Relationship |
|----------------|---------|--------------|
| ClinicalEncounter | Patient visit/interaction record | Hub |
| ClinicalEncounterDiagnosis | Diagnosed conditions during encounter | Child of ClinicalEncounter, references HealthCondition |
| ClinicalEncounterProvider | Care providers in encounter | Child of ClinicalEncounter, references HealthcareProvider |
| ClinicalEncounterFacility | Facility where encounter occurred | Child of ClinicalEncounter, references HealthcareFacility |
| ClinicalEncounterReason | Visit rationale / chief complaints | Child of ClinicalEncounter |
| ClinicalEncounterSvcRequest | Service requests/orders from encounter | Child of ClinicalEncounter |
| ClinicalEncounterIdentifier | External encounter identifiers for interoperability | Child of ClinicalEncounter |

#### Medication Management

| Object API Name | Purpose |
|----------------|---------|
| Medication | Drug/pharmaceutical definition |
| MedicationRequest | Prescription / medication order |
| MedicationStatement | Patient medication history |
| MedicationStatementDetail | Detailed dosage/administration information |
| MedicationDispense | Pharmacy dispensing record |
| MedicinalIngredient | Active pharmaceutical ingredient |
| PatientMedicationDosage | Patient-specific dosing instructions |
| MedicationAdministration | Records of medication administration to patients |
| MedicationAdministrationDtl | Details of medication administration records |

#### Health Conditions and Observations

| Object API Name | Purpose |
|----------------|---------|
| HealthCondition | Patient diagnosis / medical condition |
| HealthConditionDetail | Condition-specific details |
| DiagnosticSummary | Lab/diagnostic result summary |
| DiagnosticSummaryDetail | Individual diagnostic findings |
| ClinicalDetectedIssue | Clinical alerts/warnings |
| ClinicalDetectedIssueDetail | Issue-specific details |
| ClinicalAlert | Safety alerts for patients |

#### Allergy and Immunization

| Object API Name | Purpose |
|----------------|---------|
| AllergyIntolerance | Patient allergies and adverse reactions |
| PatientImmunization | Vaccination history |
| PatientImmunizationProtocol | Immunization schedules/protocols |
| PatientHealthReaction | Adverse reactions / side effects |

#### Clinical Procedures

| Object API Name | Purpose |
|----------------|---------|
| PatientMedicalProcedure | Surgical/clinical procedures performed |
| PatientMedicalProcedureDetail | Procedure-specific details |

#### Service Requests

| Object API Name | Purpose |
|----------------|---------|
| ClinicalServiceRequest | Orders for clinical services |
| ClinicalServiceRequestDetail | Service request specifications |

#### Clinical Code Systems

| Object API Name | Purpose |
|----------------|---------|
| CodeSet | Standard clinical code system (ICD-10, CPT, SNOMED, NDC, etc.) |
| CodeSetBundle | Grouped code sets |
| Identifier | Clinical identifiers (codes, IDs) for interoperability |

#### Supporting Clinical Objects

| Object API Name | Purpose |
|----------------|---------|
| CarePerformer | Care team member / provider in a care context |
| CareRegisteredDevice | Medical device used in patient care |
| CareObservation | Clinical observations and measurements |
| CareObservationComponent | Component details within care observations |
| ActivityTiming | Clinical event scheduling |
| AuthorNote | Clinical notes with authorship attribution |
| ContactProfile | Contact-related clinical profile data |
| Specimen | Clinical/laboratory specimen record |
| PersonLanguage | Languages spoken by individuals |
| PersonName | Person name records and details |

### Provider Relationship Management

Objects for managing healthcare providers, facilities, networks, and searchability.

| Object API Name | Purpose |
|----------------|---------|
| HealthcareProvider | Core provider record |
| HealthcareProviderNpi | National Provider Identifier (NPI) data |
| HealthcareProviderSpecialty | Medical specialties for a provider |
| HealthcareProviderTaxonomy | Taxonomy classifications |
| HealthcareProviderService | Services offered by a provider |
| HealthcareFacility | Healthcare facility / location |
| HealthcareFacilityNetwork | Network affiliations between facilities |
| HealthcarePractitionerFacility | Practitioner-to-facility affiliations |
| HealthcarePayerNetwork | Insurance payer network relationships |
| ProviderAffiliation | Organizational provider relationships |
| CareProviderSearchConfig | Configuration for provider search |
| CareProviderSearchableField | Searchable provider attributes |
| ProviderSearchSyncLog | Search synchronization log |
| CareProviderAdverseAction | Adverse actions against providers |
| CareProviderFacilitySpecialty | Specialty designations at specific facilities |
| CareService | Healthcare services offered |
| CareSpecialty | Medical/clinical specialty designations |
| CareSpecialtyTaxonomy | Hierarchical specialty classifications |
| CareTaxonomy | Care service taxonomy structures |
| HealthcareServiceDetail | Detailed service information |
| HlthCareProvTreatedCondition | Conditions treated by providers |
| Accreditation | Provider accreditation credentials |
| Award | Provider awards and recognition |
| BoardCertification | Provider board certification credentials |
| BusinessLicense | Business licensing information |

### Benefits Verification

Objects for verifying insurance benefits and tracking coverage.

| Object API Name | Purpose |
|----------------|---------|
| CareBenefitVerifyRequest | Benefits verification request |
| CoverageBenefit | Insurance coverage benefit record |
| CoverageBenefitItem | Individual benefit item within a coverage |
| CoverageBenefitItemLimit | Limits on a coverage benefit item |

### Health Insurance

Objects for modeling the insurance landscape: members, payers, purchasers, and plans.

| Object API Name | Purpose |
|----------------|---------|
| Member | Individual covered under insurance |
| Payer | Insurance company / coverage provider |
| Purchaser | Entity purchasing insurance (employer, group) |
| MemberPlan | Specific insurance plan a member is enrolled in |
| PurchaserGroup | Group of purchasers |
| PurchaserGroupMemberAssociation | Links purchasers to group members |
| PurchaserPayerAssociation | Links purchasers with payers |
| PurchaserPlan | Insurance plan offered by purchaser |
| PurchaserPlanAssn | Purchaser plan associations |
| PlanBenefit | Benefits defined within insurance plans |
| PlanBenefitItem | Detailed benefit line items within plans |
| InsurancePolicy | Insurance policy agreement |

### Financial Assistance

Objects for managing patient financial assistance programs.

| Object API Name | Purpose |
|----------------|---------|
| Benefit | Financial assistance benefit definition |
| BenefitType | Classification of benefit types |
| CareProgramAssistance | Assistance services for care program participants |
| Applicant | Assistance program applicant |
| ProgramEnrollment | Program enrollment record |
| ProgramEnrlEligibilityCrit | Enrollment eligibility criteria |
| ProgramRecommendationRule | Rules for program recommendations |

### Document Automation

Objects for document generation, template management, and incoming document processing.

| Object API Name | Purpose |
|----------------|---------|
| LifeScienceDocument | Generated document record |
| LifeScienceDocumentTemplate | Document template definition |
| LifeSciDocTemplateVersion | Template version tracking |
| DocumentTemplate | Simpler document template |
| ReceivedDocument | Incoming document for processing |
| ReceivedDocumentType | Classification of received document types |
| OcrDocumentScanResult | OCR document scanning results |
| DocumentChecklistItem | Checklist items for document processing |

### Electronic Signatures

Objects for digital signature workflows and verification.

| Object API Name | Purpose |
|----------------|---------|
| DigitalSignature | Completed digital signature record |
| DigitalSignatureRequest | Signature request / workflow initiation |
| DigitalVerification | Verification of digital signatures |
| DigitalVerificationSetup | Verification process configuration |
| DigitalVerfSetupDetail | Detailed verification setup parameters |

### Integrated Care Management

Objects for care plans, care episodes, care gaps, and clinical quality measures. Aligns with USCDI and FHIR R4.

| Object API Name | Purpose |
|----------------|---------|
| CarePlan | Central care coordination document |
| CarePlanActivity | Tasks/activities within a care plan |
| CarePlanActivityDetail | Extended activity details |
| CarePlanDetail | Supplementary care plan information |
| CarePlanTemplate | Reusable care plan templates |
| CarePlanTemplateGoal | Goals predefined in care plan templates |
| CarePlanTemplateProblem | Health conditions addressed in templates |
| CareEpisode | Distinct period/episode of patient care |
| CareEpisodeDetail | Detailed information about care episodes |
| CareGap | Identified gap in patient care delivery |
| CareGapCriteriaResult | Results from care gap evaluation criteria |
| CareTask | Individual action items for care coordination |
| CareTaskDetail | Comprehensive task details |
| ClinicalMeasure | Clinical quality performance measure |
| ClinicalMeasureCriteria | Evaluation parameters for clinical measures |
| ClinicalMeasureCriteriaGrp | Grouped criteria for complex measurements |
| GoalAssignment | Links care goals to responsible parties |
| GoalAssignmentDetail | Extended goal assignment information |
| GoalDefinition | Standard goal templates for care programs |
| ProblemDefinition | Standardized health problem definitions |
| ProblemDefRelationship | Relationships between problem definitions |
| ProblemGoalDefinition | Relationships between problems and care goals |
| MemberPlanCarePlan | Associates member insurance plans with care plans |
| MemberPlanMedicationStmt | Links medication statements to member plans |
| PurchaserPlanCareProgram | Connects purchaser plans to care programs |

### Utilization Management

Objects for prior authorization, care requests, and utilization review.

| Object API Name | Purpose |
|----------------|---------|
| CarePreauth | Prior authorization request for care services |
| CarePreauthItem | Line items within prior authorization requests |
| CareRequest | Utilization management / prior auth request |
| CareRequestDrug | Drug-related information within care requests |
| CareRequestExchangeInfo | Exchange information for care requests |
| CareRequestExtension | Extensions to care request data |
| CareRequestItem | Individual items/services within care requests |
| CareRequestReviewer | Reviewers assigned to care requests |
| CareRequestSupportingCntnt | Supporting documentation for care requests |
| CareDiagnosis | Diagnoses for utilization review |
| CareProcessingError | Errors encountered during care processing |
| TrackedCommunication | Communications tracked for utilization management |
| TrackedCommunicationDetail | Details of tracked communications |

### Provider Network Management

Objects for provider network contracts, fee agreements, and tier management.

| Object API Name | Purpose |
|----------------|---------|
| ProviderNetworkContract | Contracts governing provider networks |
| ProviderNetworkTier | Tier classifications within networks |
| BundledCareFeeAgreement | Bundled care service fee agreements |
| CapitationCareFeeAgreement | Capitation-based payment agreements |
| CareFeeScheduleItem | Fee schedule line items |
| CategorizedCareFeeAgreement | Fee agreements organized by category |
| ContractPaymentAgreement | Contract payment terms and agreements |
| FeeScheduleDefinition | Fee schedule structure definitions |
| PercentileBsdCareFeeAgreement | Percentile-based fee arrangements |
| PreventiveCareAgreement | Preventive care payment agreements |
| SharedSavingPaymentAgreement | Shared savings payment structures |
| StandardCareFeeAgreement | Standard fee-for-service agreements |
| ApplicationCase | Provider network application cases |
| IndividualApplication | Individual provider applications |

### Advanced Therapy Management

Objects for multi-step therapy scheduling across locations. Uses WorkOrder for appointment orchestration.

| Object API Name | Purpose |
|----------------|---------|
| AdvTherapyFieldOptOverride | Field option overrides for advanced therapy workflows |
| CarePgmEnrolleeWorkOrder | Work orders for care program enrollees |
| CarePgmEnrolleeWkOrdStep | Steps within enrollee work orders |
| CustodyChainEntry | Chain of custody tracking entries |
| CustodyItem | Items tracked in custody chains |
| CustodyVerfcTypeOverride | Custody verification type overrides |
| WorkProcedure | Work procedure definitions |
| WorkProcedureStep | Steps within work procedures |
| WorkTypeExtension | Extensions to work type definitions |
| WorkTypeStep | Steps associated with work types |
| WorkTypeStepLdTimeOvride | Lead time overrides for work type steps |
| ServiceAppointmentGroup | Groupings of service appointments |

### Medication Management (Advanced)

Objects for medication reconciliation and therapy review beyond the core clinical data model.

| Object API Name | Purpose |
|----------------|---------|
| MedicationReconciliation | Medication reconciliation process record |
| MedicationTherapyReview | Comprehensive medication therapy review |
| MedicationTherapyStmtReview | Reviews of medication therapy statements |
| MedReconRecommendation | Recommendations from medication reconciliation |
| MedReconStmtRecommendation | Statement-based reconciliation recommendations |
| MedTherapyStmtReviewIssue | Issues identified during therapy reviews |

### Social Determinants

Objects for tracking social determinants of health and care barriers.

| Object API Name | Purpose |
|----------------|---------|
| CareBarrier | Social barriers to patient care |
| CareBarrierDeterminant | Determinants contributing to care barriers |
| CareBarrierType | Classifications of care barriers |
| CareDeterminant | Social determinants of health |
| CareDeterminantType | Types/categories of social determinants |
| CareInterventionType | Types of social/care interventions |

### Disease Surveillance

Objects for disease tracking, outbreak management, and investigations.

| Object API Name | Purpose |
|----------------|---------|
| DiseaseDefinition | Definitions of diseases for surveillance |
| DiseaseDefinitionCondition | Conditions that define diseases |
| DiseaseDefinitionCriteria | Criteria for disease classification |
| DiseaseInvestigation | Disease investigation records |
| DiseaseInvestigationCase | Individual cases under investigation |
| DiseaseOutbreak | Disease outbreak tracking records |
| DocumentExtractionRequest | Requests to extract disease-related documents |
| DocumentExtractionRqstStep | Steps in document extraction processes |

### Patient Program Outcomes

Objects for tracking program outcomes, indicators, and performance measurement.

| Object API Name | Purpose |
|----------------|---------|
| Outcome | Patient outcome record |
| OutcomeActivity | Activities contributing to outcomes |
| IndicatorAssignment | Quality/outcome indicator assignments |
| IndicatorDefinition | Outcome indicator definitions |
| IndicatorPerformancePeriod | Performance measurement periods |
| IndicatorResult | Indicator measurement results |
| PartyIndicatorResult | Individual party indicator results |
| TimePeriod | Time period definitions |

### Patient Segmentation and Risk Scoring

Objects for risk adjustment, health scoring, and patient segmentation.

| Object API Name | Purpose |
|----------------|---------|
| AgeBandHlthRskAdjFctr | Age-based health risk adjustment factors |
| CondIntrctnHlthRskAdjFctr | Condition interaction risk adjustment factors |
| HierCondHlthCodeMapping | Hierarchical condition code mappings |
| HierCondHlthRskAdjFctr | Hierarchical condition risk adjustment factors |
| PgmBasedHlthRskAdjFctr | Program-based health risk adjustment factors |
| PartyProfile | Individual profiles for patient segmentation |
| HealthScore | Patient health status scores |
| HealthScoreActionLog | Logs of actions based on health scores |
| ActionVisibility | Visibility settings for health score actions |
| HealthRiskEvaluation | Health risk assessment record |
| HealthRiskEvalDetail | Details of health risk evaluations |
| HealthRiskEvalOutcome | Outcomes from health risk evaluations |

### Coverage Requirement Discovery

Objects for discovering service coverage requirements and pre-authorization needs.

| Object API Name | Purpose |
|----------------|---------|
| ServiceInformationRequest | Request for service coverage information |
| ServiceInfoRequestDetail | Details of service information requests |
| ServiceInformationResponse | Response to service information query |
| ServiceInfoResponseAction | Actions recommended in response |
| ServiceInfoResponseCoverage | Coverage information in response |
| SvcInfoRespCoverageDetail | Coverage detail in service response |
| ServiceInfoRespOvrideOpt | Override options in response |
| ServiceInfoRespResourceUrl | Resource URLs in response |
| ServiceInfoRespSuggestion | Suggestions in response |
| SvcInfoRelatedQuestionnaire | Questionnaires related to coverage services |
| ServiceInfoRequestOperation | Operations on service information requests |
| ServiceInfoRqstOpOutcome | Outcomes of service request operations |

### Home Health

Objects for home health service scheduling and delivery.

| Object API Name | Purpose |
|----------------|---------|
| CareServiceVisit | Home health service visit record |
| CareServiceVisitPlan | Plans for home health service visits |
| AccountServicePreference | Service preferences by account |
| PartyAppointmentRequest | Appointment requests for parties |
| PartySchedulePreference | Scheduling preferences for parties |
| ScheduleBroadcast | Broadcast appointment scheduling |
| ScheduleBroadcastAppointment | Appointments in broadcast schedules |
| ScheduleBroadcastTerritory | Territories in broadcast schedules |

### FHIR Interoperability

Objects for FHIR subscription management and interoperability.

| Object API Name | Purpose |
|----------------|---------|
| InteropTopic | Interoperability topic definition |
| InteropTopicDetail | Topic detail information |
| InteropTopicFilter | Filtering configuration for topics |
| InteropTopicNtfcnResource | Notification resources for interop topics |
| InteropTopicSubcrFilter | Subscription filter settings |
| InteropTopicSubcrParameter | Subscription parameters |
| InteropTopicSubscription | FHIR topic subscription |
| InteropTopicSubscriptionDtl | Subscription detail records |
| InteropTopicTriggerCriteria | Trigger criteria for subscriptions |

### Engagement Interaction

| Object API Name | Purpose |
|----------------|---------|
| EngagementInteraction | Patient engagement interaction record |
| EngagementAttendee | Attendees of engagement activities |
| EngagementTopic | Topics discussed in engagements |

### Appointment Management

Objects for intelligent appointment scheduling and resource management.

| Object API Name | Purpose |
|----------------|---------|
| AppointmentReason | Reasons for patient appointments |
| ApptReasonEngmtChannelType | Engagement channel types for appointment reasons |
| CarePractnFacilityAppt | Practitioner availability at facilities |
| ServiceAppointmentAsset | Assets associated with service appointments |
| WorkTypeCareSpecialty | Care specialty associations for work types |
| WorkTypeCodeSetBundle | Code set bundles for work types |

---

## MedTech Commercial Engagement

### Intelligent Sales

Objects for MedTech commercial intelligence and medical insights.

| Object API Name | Purpose |
|----------------|---------|
| MedicalInsight | Medical insight record for commercial intelligence |
| MedicalInsightAccount | Links medical insights to customer accounts |
| MedicalInsightProduct | Associates insights with products |
| MedicalInsightGoalDef | Connects insights to goal definitions |
| Visit | Sales/service visit record |
| VisitedParty | Parties visited during sales calls |
| Visitor | Individuals making visits |
| ProductAvailabilityProjection | Product availability forecasts |
| SerializedProduct | Serialized product tracking |
| ProductRequest | Product requests |
| ProductRequestLineItem | Line items in product requests |

### Account Planning

Objects for key account management in MedTech commercial contexts.

| Object API Name | Purpose |
|----------------|---------|
| AccountPlan | Strategic account plan |
| AccountPlanParticipant | Participants in an account plan |
| AccountPlanProduct | Products associated with an account plan |
| AccountPlanRelationship | Relationship mapping within account plans |
| AccountPlanStakeholder | Key stakeholders in account plans |

---

## Common / Cross-Domain Objects

Objects shared across engagement domains or inherited from Salesforce platform.

### Core Platform Objects Used by Life Sciences Cloud

| Object API Name | Life Sciences Cloud Usage |
|----------------|--------------------------|
| Account | Healthcare organizations, payers, purchasers (use Person Accounts for patients) |
| Contact | Healthcare practitioners, staff, caregivers |
| Product2 | Medications, devices, therapy products |
| Pricebook2 | Product pricing |
| PricebookEntry | Price list entries |
| Address | Physical addresses for providers, facilities, patients |

### Product and Inventory (shared)

| Object API Name | Purpose |
|----------------|---------|
| ProductItem | Inventory item at a location |
| ProductFulfillmentLocation | Location where products are fulfilled |
| ProductTransfer | Transfer of product between locations |
| InventoryOperation | Inventory management operation |
| InventoryCountAssessment | Inventory count/assessment |

### Person Objects (shared)

| Object API Name | Purpose |
|----------------|---------|
| PersonEducation | Education records for Person Accounts |
| PersonEmployment | Employment records for Person Accounts |

---

## FHIR Resource Mapping

Key mappings between HL7 FHIR resources and Life Sciences Cloud objects:

| FHIR Resource | Life Sciences Cloud Object |
|--------------|---------------------------|
| Patient | Account (Person Account) |
| Encounter | ClinicalEncounter |
| Condition | HealthCondition |
| MedicationRequest | MedicationRequest |
| MedicationStatement | MedicationStatement |
| MedicationDispense | MedicationDispense |
| AllergyIntolerance | AllergyIntolerance |
| Immunization | PatientImmunization |
| Procedure | PatientMedicalProcedure |
| DiagnosticReport | DiagnosticSummary |
| ServiceRequest | ClinicalServiceRequest |
| Practitioner | HealthcareProvider / Contact |
| Organization | Account / HealthcareFacility |
| Location | HealthcareFacility |
| Coverage | CoverageBenefit / MemberPlan |
| ResearchStudy | ResearchStudy |

---

## Life Sciences Cloud for Customer Engagement (LSC4CE)

> **Separate add-on.** The objects below require the Life Sciences Cloud for Customer Engagement license (LSC4CE / AFLS4CE). They are NOT available in the base Life Sciences Cloud platform. Do not use these objects unless the org has the Customer Engagement add-on enabled. If a user requests features that depend on these objects, flag that it requires the LSC4CE license.
>
> Some objects listed here share names with base LSC objects (e.g., `CareProgram`, `HealthcareProvider`, `Visit`) — in those cases, LSC4CE adds Customer Engagement-specific fields and behaviors to the base object. The objects listed below that do NOT appear in the base LSC sections above are LSC4CE-only.
>
> Source: *Life Sciences Cloud for Customer Engagement Developer Guide (Pilot)*, Version 63.0, Spring '25. Last updated November 28, 2024.

### Account Management (LSC4CE)

| Object API Name | Purpose | Also in Base LSC? |
|----------------|---------|-------------------|
| BusinessLicense | Business licensing information | Yes |
| BusinessLicenseProduct | Products associated with a business license | **LSC4CE only** |
| ContactPointAddress | Contact point address records | Platform standard |
| ContactPointBestContactTime | Best times to contact a provider | **LSC4CE only** |
| ContactPointSocial | Social media contact points | **LSC4CE only** |
| Formulary | Formulary (drug list) definition | **LSC4CE only** |
| FormularyItem | Individual items within a formulary | **LSC4CE only** |
| HealthcareProvider | Core provider record | Yes |
| PartyPublication | Publication records for parties | **LSC4CE only** |
| ProviderAcctProductInfo | Provider-account product information | **LSC4CE only** |
| ProviderAcctTerritoryInfo | Links accounts to territories with product access and recommended presentations | **LSC4CE only** |
| ProviderAffiliation | Organizational provider relationships | Yes |
| ProviderAffiliationProduct | Products associated with provider affiliations | **LSC4CE only** |
| PrvdAccountUserGroupInfo | Provider account user group information | **LSC4CE only** |

### Activity Plans (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| ActivityPlan | Engagement goal planning by product, channel, and customer type per period |
| ActivityPlanTerritory | Territory assignments for activity plans |
| ProviderActivityGoal | Individual engagement goals for providers |
| ProviderActivityGoalMeasure | Measures for tracking provider activity goal progress |
| ProviderActivityMeasureType | Types of measures for provider activity |
| ProviderActvtyPlanAdjusment | Adjustments to provider activity plans |
| PrvdActvtyGoalMeasureProdt | Product-level measures for provider activity goals |
| TimePeriod | Time period definitions for activity planning |

### App Alerts (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| AppAlert | Application alert notifications |
| AppAlertTerritory | Territory-scoped app alerts |
| AppAlertUserResponse | User responses to app alerts |
| RecordAlert | Record-level alert notifications |

### Compliance Statement Definition (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| ComplianceStatementDef | Compliance statement definitions for regulatory requirements |

### Consent Management (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| CommSubscription | Communication subscription records |
| CommSubscriptionConsent | Consent records for communication subscriptions |
| CommSubConsentCmplSnpsht | Compliance snapshot for communication subscription consent |
| ContactPointConsent | Consent records for contact points |
| DataUsePurpose | Data use purpose definitions for consent tracking |

### Data Change Requests (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| LifeSciDataChangeDef | Data change definition configuration |
| LifeSciDataChangeRequest | Data change request records (DCRs) for governed data stewardship |
| LifeSciDataChgDefMngFld | Managed field definitions for data change requests |
| LifeSciDataChgDefRecType | Record type definitions for data change requests |
| LifeSciDataChgPersonaDef | Persona definitions for data change requests |

### Field Email (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| LifeScienceEmail | Email records for field representatives |
| LifeSciEmailTemplate | Email template definitions |
| LifeSciEmailTmplFragment | Reusable email template components |
| LifeSciEmailTmplRelaFrgmt | Relationships between email templates and fragments |
| LifeSciEmailTmplSnapshot | Point-in-time email template snapshots |

### General Events (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| Event | Event records (LSC4CE extends standard Event with engagement fields) |
| EventRelation | Event relationship records |

### Intelligent Content (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| Presentation | CLM presentation content for field representatives |
| PresentationClickStrmEntry | Presentation click stream tracking entries |
| PresentationFileReference | File references within presentations |
| PresentationForum | Presentation forum records |
| PresentationLinkedPage | Linked pages within presentations |
| PresentationPage | Individual pages/slides within a presentation |
| PresentationPageProduct | Associates products with presentation pages |
| PresentationPartyAccess | Party access controls for presentations |

### Key Account Management (LSC4CE)

| Object API Name | Purpose | Also in Base LSC? |
|----------------|---------|-------------------|
| AccountPlan | Strategic account plan | Yes |
| AccountPlanObjective | Objectives within an account plan | **LSC4CE only** |
| AccountPlanParticipant | Participants in an account plan | Yes |
| AccountPlanProduct | Products associated with an account plan | Yes |
| AccountPlanRelaObjAnalysis | Related object analysis for account plans | **LSC4CE only** |
| AccountPlanRelationship | Relationship mapping within account plans | Yes |
| AcctPlanPtcpStakeholder | Participant-stakeholder relationships | **LSC4CE only** |
| AccountPlanStakeholder | Key stakeholders in account plans | Yes |
| AccountPlanStkhldrAction | Stakeholder actions within account plans | **LSC4CE only** |
| AccountPlanStkhldrProduct | Products associated with stakeholders | **LSC4CE only** |
| ActionPlan | Action plan records | **LSC4CE only** |
| ActionPlanTemplate | Templates for action plans | **LSC4CE only** |
| ActionPlanTemplateItem | Items within action plan templates | **LSC4CE only** |
| GoalAssignment | Links care goals to responsible parties | Yes |
| GoalDefinition | Standard goal templates | Yes |
| GoalDefinitionProduct | Product-level goal definitions | **LSC4CE only** |
| Sprint | Sprint records for engagement planning | **LSC4CE only** |
| TerritoryBusinessPlan | Territory-level business planning | **LSC4CE only** |

### Life Sciences Workflow Management (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| LifeScienceCustomScript | Custom scripting for workflow automation |
| LifeSciStageAction | Actions within workflow stages |
| LifeSciStageObject | Objects associated with workflow stages |
| LifeSciStageOperation | Operations within workflow stages |
| LifeSciStageOperationAction | Actions within stage operations |
| LifeSciStageOperationCondn | Conditions for stage operations |
| LifeSciStagePath | Workflow stage paths |
| LifeSciStageValue | Stage value definitions |

### Lists and Filters (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| LifeSciAccountListColumn | Column definitions for account lists |
| LifeSciAccountListMember | Member records in account lists |
| LifeSciAcctListFilterCrit | Filter criteria for account lists |
| LifeScienceAccountList | Account list definitions (dynamic lists) |
| LifeScienceAccountListObject | Object associations for account lists |

### Medical Inquiries (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| Inquiry | Medical inquiry records logged during HCP visits |
| InquiryQuestion | Questions within medical inquiries |
| InquiryQuestionAnswer | Answers to inquiry questions |

### Medical Insights (LSC4CE)

| Object API Name | Purpose | Also in Base LSC? |
|----------------|---------|-------------------|
| MedicalInsight | Medical insight record | Yes |
| MedicalInsightAccount | Links medical insights to accounts | Yes |
| MedicalInsightGoalDef | Connects insights to goal definitions | Yes |
| MedicalInsightProduct | Associates insights with products | Yes |
| SubjectAssignment | Subject assignments for insights | **LSC4CE only** |
| UserReaction | User reactions to medical insights | **LSC4CE only** |

### Merge Management (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| MergeRequest | Account merge request records |

### Mobile Metadata (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| LifeSciMobileMetadataRecord | Mobile-specific metadata configuration for field rep apps |

### Mobile Sync (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| DeviceSyncSummary | Device synchronization summary records |
| DeviceSyncTransaction | Individual sync transaction records |
| DeviceSyncTransactionLog | Sync transaction log entries |
| DeviceSyncTransactionRecord | Individual record sync transactions |

### Next Best (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| TerritoryAccountScore | Territory-account scoring for next best recommendations |
| TerritoryAcctProdMsgScore | Territory-account-product-message scoring |
| TerritoryAcctRcmdAction | Recommended actions for territory accounts |

### Product Management (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| LifeSciMarketableProduct | Marketable product definitions |
| LifeSciProductAcctRstrc | Product-account restrictions |
| ProductGuidance | Product guidance records for field representatives |
| ProductTerritoryAvailability | Product availability by territory |
| ProductTerrDtlAvailability | Detailed product-territory availability |

### Provider Engagement Compliance (LSC4CE)

| Object API Name | Purpose | Also in Base LSC? |
|----------------|---------|-------------------|
| AssessmentTask | Assessment task records | **LSC4CE only** |
| CareProgram | Care program definition | Yes (base object, LSC4CE adds compliance fields) |
| CareProgramProduct | Products available within a program | Yes (base object) |
| PrvdEngmtComplianceCycle | Provider engagement compliance cycle tracking | **LSC4CE only** |

### Provider Visit Management (LSC4CE)

| Object API Name | Purpose | Also in Base LSC? |
|----------------|---------|-------------------|
| DigitalSignature | Completed digital signature record | Yes |
| Expense | Visit expense records | **LSC4CE only** |
| ExpenseParticipant | Participants in expense records | **LSC4CE only** |
| ExpenseType | Expense type classifications | **LSC4CE only** |
| PresentationForum | Presentation forum records | **LSC4CE only** |
| ProviderVisit | Provider visit records with detailed engagement tracking | **LSC4CE only** |
| ProviderVisitDtlProductMsg | Product message details for provider visits | **LSC4CE only** |
| ProviderVisitMarketingItem | Marketing items used during provider visits | **LSC4CE only** |
| ProviderVisitProdDetailing | Product detailing records for provider visits | **LSC4CE only** |
| ProviderVisitProdDiscussion | Product discussion records for provider visits | **LSC4CE only** |
| ProviderVisitRqstSample | Sample request records during provider visits | **LSC4CE only** |
| Visit | Sales/service visit record | Yes (base object, LSC4CE adds engagement fields) |
| Visitor | Individuals making visits | Yes |

### Remote Engagement (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| VideoCall | Video call records for remote engagement |
| VideoCallParticipant | Participants in video calls |
| VideoCallRecording | Video call recording records |
| VideoCallPtcpRequest | Participant requests for video calls |
| VideoCallPtcpSession | Participant session records for video calls |

### Samples Management (LSC4CE)

| Object API Name | Purpose | Also in Base LSC? |
|----------------|---------|-------------------|
| InventoryCntProdtBatchItem | Inventory count product batch items | **LSC4CE only** |
| InventoryCountAssessment | Inventory count/assessment | Yes |
| InventoryOperation | Inventory management operation | Yes |
| Location | Location records for inventory | Platform standard |
| ProductBatchItem | Product batch item records | **LSC4CE only** |
| ProductDisbursement | Sample/product disbursement tracking | **LSC4CE only** |
| ProductItemTransaction | Product item transaction records | **LSC4CE only** |
| ProductRequest | Product requests | Yes |
| ProductRequestLineItem | Line items in product requests | Yes |
| ProductTransfer | Transfer of product between locations | Yes |
| ProductionBatch | Production batch records | **LSC4CE only** |
| ProviderSampleLimit | Sample limit definitions for providers | **LSC4CE only** |
| ProviderSmplLmtTmplAssignment | Sample limit template assignments | **LSC4CE only** |
| PrvdVstSmplLmtDiscrepancy | Visit sample limit discrepancy tracking | **LSC4CE only** |
| PrvdVstSmplLmtTransaction | Visit sample limit transaction records | **LSC4CE only** |
| TerritoryProdtQtyAllocation | Territory-level product quantity allocation | **LSC4CE only** |

### Segmentation (LSC4CE)

| Object API Name | Purpose | Also in Base LSC? |
|----------------|---------|-------------------|
| ActionableList | Actionable list definitions | **LSC4CE only** |
| ActionableListFilterCriteria | Filter criteria for actionable lists | **LSC4CE only** |
| HealthCareProvider | Healthcare provider records (segmentation context) | Yes |
| LifeSciAcctGrpAssignment | Account group assignment for segmentation | **LSC4CE only** |

### Subject Management (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| Subject | Subject records for engagement management |
| SubjectAssignment | Subject assignment records |

### Surveys (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| SurveyQstnResponseOffline | Offline survey question responses |
| SurveyResponse | Survey response records |
| SurveyResponseOffline | Offline survey response records |

### System Objects (LSC4CE)

| Object API Name | Purpose | Also in Base LSC? |
|----------------|---------|-------------------|
| IntegrationJobRun | Integration job execution records | **LSC4CE only** |
| LifeScienceMobileApp | Mobile application configuration | **LSC4CE only** |
| LifeScienceTriggerHandler | Trigger handler configuration | Yes (used in base MedTech builds) |
| UserAdditionalInfo | Additional user information records | **LSC4CE only** |

### Territory Management (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| TerrProvAffilAssignRule | Territory-provider affiliation assignment rules |
| TerrGeoAssignmentRule | Territory geographic assignment rules |
| TerritoryContentTmplAsgnt | Territory content template assignments |
| TerritoryUserDowntime | Territory user downtime tracking |

### Customer Engagement Metadata Type (LSC4CE)

| Metadata Type | Purpose |
|--------------|---------|
| ActionableListDefinition | Metadata definition for actionable lists |

### Customer Engagement Tooling API Objects (LSC4CE)

| Object API Name | Purpose |
|----------------|---------|
| LifeSciConfigAssignment | Configuration assignment records |
| LifeSciConfigCategory | Configuration category records |
| LifeSciConfigFieldValue | Configuration field value records |
| LifeSciConfigRecord | Primary configuration storage |
| ProviderSampleLimitTemplate | Sample limit template definitions |
