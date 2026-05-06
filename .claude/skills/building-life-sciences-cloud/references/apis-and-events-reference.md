# Life Sciences Cloud APIs and Events Reference

Business APIs, platform events, invocable actions, and custom metadata types for Salesforce Life Sciences Cloud. Business APIs follow Connect REST conventions.

Source: [Life Sciences Cloud Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.life_sciences_dev_guide.meta/life_sciences_dev_guide/life_sciences_cloud_overview.htm)

> **Excludes Customer Engagement.** APIs from Life Sciences Cloud for Customer Engagement (LSC4CE / AFLS4CE) are intentionally excluded.

---

## Business APIs

Life Sciences Cloud provides Connect REST Business APIs for complex multi-object operations. Use these instead of building custom logic across multiple objects.

### Account Management

| API | Method | Purpose |
|-----|--------|---------|
| Merge Customer Account | POST | Consolidate customer records |
| Merge Customer Account with Status | POST | Merge accounts with status tracking |
| Account Manual Alignment | POST | Manually align account assignments |
| Account User Territory Information | POST | Retrieve territory data for account users |

### Provider Management

| API | Method | Purpose |
|-----|--------|---------|
| Advanced Provider Search | GET | Search provider database with advanced filters |
| Provider Search | GET | Standard provider lookup |
| Create Provider | POST | Create new provider records |
| Upsert Provider | PUT/POST | Create or update provider data |
| Download Provider | POST | Export provider information |
| Provider Relationship Cards | POST | Import provider data via Composite API |

### Patient Management

| API | Method | Purpose |
|-----|--------|---------|
| Patients | GET | Retrieve patient records |
| Patients | POST | Create patient records |
| Patients | PUT | Update patient records |
| Care Program Enrollments | POST | Enroll patients in care programs |
| Benefits Verification | POST | Validate insurance coverage |
| Digital Verification | POST | Confirm identity electronically |
| Sample Limits Validation | POST | Validate pharmaceutical sample restrictions |

### Engagement and Scheduling

| API | Method | Purpose |
|-----|--------|---------|
| Book Slot Chain | POST | Reserve appointment slots |
| Contact Encounter | POST | Record provider-contact interactions |
| Visits | POST | Create visit records |
| Work Type Lead Time | POST | Calculate scheduling requirements |

### Content and Presentations

| API | Method | Purpose |
|-----|--------|---------|
| Bulk Presentation | POST/PATCH | Manage multiple presentations |
| Email Template | POST/PATCH | Handle email configurations |
| Presentation Page Product | POST/PATCH | Associate products with content pages |

### Document Management

| API | Method | Purpose |
|-----|--------|---------|
| Record Creation with Content Documents | POST | Create records with attached documents |
| Record Update with Content Documents | PATCH | Update document associations |
| Record Creation with Received Documents | POST | Create records from incoming documents |
| Record Update with Received Documents | PATCH | Update received document records |
| Split Documents | POST | Separate combined documents into parts |

---

## Platform Events

Life Sciences Cloud publishes platform events for asynchronous status change notifications. Subscribe to these rather than polling for status.

| Platform Event API Name | Trigger | Feature Area |
|------------------------|---------|--------------|
| CareBnftVrfyRqstStsChgEvent | Benefits verification request status changes | Patient Engagement — Benefits Verification |
| ApplnFormAppealStsChgEvnt | Financial Assistance Program appeal status changes | Patient Engagement — Financial Assistance |

### Usage Pattern

```apex
// Subscribe in Apex trigger
trigger BenefitVerifyStatusChange on CareBnftVrfyRqstStsChgEvent (after insert) {
    for (CareBnftVrfyRqstStsChgEvent event : Trigger.New) {
        // Process status change
    }
}
```

Or subscribe in Flow using a Platform Event–Triggered Flow on the event object.

---

## Standard Invocable Actions

Life Sciences Cloud provides standard invocable actions for use in Flows and Apex.

| Feature Area | Purpose |
|-------------|---------|
| Clinical Trial Enrollment | Streamline participant enrollment in clinical trials |

Use these in Flow Builder (Action elements) or Apex (`Invocable.Action`) rather than building custom enrollment logic.

---

## Custom Metadata Types

Life Sciences Cloud uses custom metadata types for platform configuration. These are accessible through Metadata API.

| Custom Metadata Type | Purpose |
|---------------------|---------|
| LifeScienceCustomScript | Custom scripting for Life Sciences Cloud applications |
| LifeSciMetadataAssignment | Metadata assignment configuration |
| LifeSciMetadataCategory | Categorization of metadata records |
| LifeSciMetadataFieldValue | Field-level metadata values |
| LifeSciMetadataRecord | Primary metadata storage for customizations |
| LifeSciMobileMetadataRecord | Mobile-specific metadata configuration |
| LifeSciDocTemplateVersion | Document template version tracking |
| LifeSciEmailTemplate | Email template definitions |
| LifeSciEmailTmplFragment | Reusable email template components |
| LifeSciEmailTmplRelaFrgmt | Relationships between email templates and fragments |
| LifeSciEmailTmplSnapshot | Point-in-time email template snapshots |

---

## Permission Sets and Licenses

Permission sets are additive — assign the base Life Sciences Cloud permission plus feature-specific permissions.

### Core Permission Sets

| Permission Set | Purpose |
|---------------|---------|
| Health Cloud Foundation | Core Health Cloud functionality — base for all features |
| Health Cloud for Life Sciences | Pharma and life sciences-specific features |
| Health Cloud Member Services | Payer-focused member management |
| Health Cloud Social Determinants | Social/environmental factors tracking |
| Health Cloud Utilization Management | Care request processing, medical necessity reviews |
| Health Cloud Permission Set License | Required license for Health Cloud / Life Sciences Cloud features |
| Health Cloud Platform Permission Set License | Platform-level license |

### Feature-Specific Permissions

| Permission | Feature Area |
|-----------|-------------|
| Manage Care Programs | CareProgram and related objects |
| Manage Pharmacy Benefits Verification | CareBenefitVerifyRequest and related fields (API v61.0+) |
| Manage Financial Assistance Program | Financial assistance fields (API v62.0+) |
| Manage Provider Network Management | Provider network contracts, credentialing |
| Manage Benefit Management | CoverageBenefit, MemberPlan |
| Manage Utilization Management | CarePreauth, CareRequest and related objects |
| Manage Intelligent Document Automation | ReceivedDocument processing, OCR |
| Manage Advanced Therapy | Multi-step scheduling, custody chain |
| Manage Participant Management | Clinical trial participant features |
| Manage Medication Management | Medication-related objects |
| Manage Integrated Care Management | Care plan objects and features |

### Permission Notes

- Many objects require specific permission sets to be visible and accessible
- Some fields are only available when certain permission sets are assigned
- API version gating: newer fields may require minimum API versions (v58.0, v59.0, v60.0, v61.0, v62.0)

---

## API Technical Notes

- Business APIs follow Salesforce Connect REST conventions
- Tooling API provides metadata access for Life Sciences Cloud objects
- Metadata API supports customization and deployment
- HL7 FHIR parsing and storage capabilities for EHR data exchange
- All APIs require appropriate Life Sciences Cloud permission sets

### Common Field Patterns

Most Life Sciences Cloud objects include these standard fields:
- `SourceSystem` + `SourceSystemIdentifier` — External system mapping
- `EffectiveFrom` + `EffectiveTo` — Temporal validity
- `IsActive` — Active/inactive status
- `Status` — Lifecycle state

### API Version Gating

| API Version | Key Objects/Features Introduced |
|------------|-------------------------------|
| v49.0 | Visit, VisitedParty |
| v53.0 | CareBenefitVerifyRequest |
| v56.0 | Medication Management fields on CareProgramEnrollee |
| v58.0 | Advanced Therapy fields (WorkOrder links) |
| v59.0 | Most ChangeEvent support, EnrollmentLocation |
| v60.0 | BoardCertification, HealthcareProviderNpi ChangeEvents |
| v61.0 | Pharmacy Benefits Verification fields, CareProgramEligibilityRule.Type |
| v62.0 | Financial Assistance Program fields, CareProgram.Category=Patient Services |

### Change Data Capture

Most objects support Change Data Capture via `*ChangeEvent` objects (typically from API v59.0+). Subscribe to these for event-driven integration patterns.

### Supported Standards

- **HL7 v2.3** — Electronic Health Record data exchange
- **FHIR R4** — Fast Healthcare Interoperability Resources
- **USCDI** — US Core Data for Interoperability (Integrated Care Management, Participant Management)
- **FHIR-CARIN / NCPDP** — Pharmacy Benefits Verification alignment
