---
aliases:
  - Care Taxonomy
  - CareTaxonomy
  - CareSpecialty
  - CareSpecialtyTaxonomy
  - BusinessLicense
  - NUCC taxonomy
  - provider taxonomy
  - provider specialty
  - medical license
  - DEA registration
tags:
  - lsdo
  - lsdo/cinematic-universe
  - lsdo/medtech
  - life-sciences-cloud
  - provider-data-model
---
# Makana MedTech Care Taxonomy, Specialty & Licensing

Part of the [Makana MedTech Cinematic Universe](makana-medtech-cinematic-universe.md).

This file covers the LSC objects that classify and license physicians and facilities in the provider data model:

- **CareTaxonomy** — NUCC Medicare Provider/Supplier Taxonomy hierarchy (484 records)
- **CareSpecialty** — clinical specialty designations used in physician records (49 records)
- **CareSpecialtyTaxonomy** — junction object linking CareSpecialty ↔ CareTaxonomy
- **BusinessLicense** — state medical licenses, DEA registrations, and facility operating licenses (16 MT records)

Physicians connect to both classification systems: `HealthcareProviderSpecialty` → `CareSpecialty` (clinical) and `HealthcareProviderTaxonomy` → `CareTaxonomy` (regulatory/NUCC). Licensing is captured in `BusinessLicense` records aligned to the NPI registry structure.

## Object Model

```
CareTaxonomy (LSDO_MT_Taxonomy_Grouping)              ← top-level NUCC grouping
  └── CareTaxonomy (LSDO_MT_Taxonomy_Classification)  ← specialty
        └── CareTaxonomy (LSDO_MT_Taxonomy_Specialization) ← subspecialty
                          ↑
             CareSpecialtyTaxonomy.CareTaxonomyId
                          ↓
CareSpecialty (LSDO_MedTech_CareSpecialty)            ← clinical specialty
        ↑
HealthcareProviderSpecialty.SpecialtyId
        ↑
HealthcareProvider ← HealthcareProviderSpecialty.AccountId (Person Account)

HealthcareProviderTaxonomy.TaxonomyId → CareTaxonomy  ← regulatory NUCC link
HealthcareProvider.Id ← HealthcareProviderTaxonomy.HealthcareProviderId
```

---

## CareSpecialty

`CareSpecialty` represents clinical specialty designations. In the MedTech provider model it is used in `HealthcareProviderSpecialty` records to classify each physician's clinical specialty. All records use the `LSDO_MedTech_CareSpecialty` RecordType.

### External ID Pattern

```
LS.MT.CareSpecialty.NNN
```

49 total records. The 4 MedTech demo specialties are `.001–.004`; the remaining 45 general specialties were renamed from the pre-existing `LS.CareSpecialty.N` format and run `.005–.049`.

### Demo Physician Specialties

| External ID | Name | Used By |
|---|---|---|
| `LS.MT.CareSpecialty.001` | Cardiothoracic Surgery | Rachel Shell, Dr. James Park |
| `LS.MT.CareSpecialty.002` | Vascular Surgery | Dr. Sofia Reyes |
| `LS.MT.CareSpecialty.003` | Interventional Cardiology | Dr. Marcus Chen, Dr. Omar Hassan |
| `LS.MT.CareSpecialty.004` | Interventional Radiology | Dr. Elena Torres |

---

## CareSpecialtyTaxonomy

`CareSpecialtyTaxonomy` is the junction object that connects `CareSpecialty` (clinical) to `CareTaxonomy` (NUCC regulatory). This bridges the two classification systems in a single record. The object has no RecordType field.

### External ID Pattern

```
LS.MT.CareSpecialtyTaxonomy.NNN
```

### Records

| External ID | CareSpecialty | CareTaxonomy |
|---|---|---|
| `LS.MT.CareSpecialtyTaxonomy.001` | Cardiothoracic Surgery (`.001`) | Thoracic Surgery (Cardiothoracic Vascular Surgery) (`.482`) |
| `LS.MT.CareSpecialtyTaxonomy.002` | Vascular Surgery (`.002`) | Vascular Surgery (`.471`) |
| `LS.MT.CareSpecialtyTaxonomy.003` | Interventional Cardiology (`.003`) | Interventional Cardiology (`.196`) |
| `LS.MT.CareSpecialtyTaxonomy.004` | Interventional Radiology (`.004`) | Vascular & Interventional Radiology (`.468`) |

---

## Physician Specialty Assignments (HealthcareProviderSpecialty)

`HealthcareProviderSpecialty` links each physician's `HealthcareProvider` record to their `CareSpecialty`. External IDs follow `LS.MT.HealthcareProviderSpecialty.NNN`.

| External ID | Physician | CareSpecialty | Role |
|---|---|---|---|
| `LS.MT.HealthcareProviderSpecialty.006` | Rachel Shell | Cardiothoracic Surgery | Specialist |
| `LS.MT.HealthcareProviderSpecialty.007` | Dr. Marcus Chen | Interventional Cardiology | Specialist |
| `LS.MT.HealthcareProviderSpecialty.008` | Dr. Sofia Reyes | Vascular Surgery | Specialist |
| `LS.MT.HealthcareProviderSpecialty.009` | Dr. James Park | Cardiothoracic Surgery | Specialist |
| `LS.MT.HealthcareProviderSpecialty.010` | Dr. Elena Torres | Interventional Radiology | Specialist |
| `LS.MT.HealthcareProviderSpecialty.011` | Dr. Omar Hassan | Interventional Cardiology | Specialist |

---

## BusinessLicense

`BusinessLicense` captures state medical licenses, DEA registrations, and facility operating licenses. Records are linked to `HealthcareProvider` via `HealthcareProviderId` and to the physician/facility `Account` via `AccountId`. All follow the LSDO External ID pattern `LS.MT.BusinessLicense.NNN` and reflect the NPI registry license structure.

### External ID Pattern

```
LS.MT.BusinessLicense.NNN
```

### Physician Licenses (2 per physician)

Each physician has a **State Medical License** (primary) and a **DEA Registration** (secondary):

| External ID | Name | Identifier | Issuer | Type | Physician |
|---|---|---|---|---|---|
| `LS.MT.BusinessLicense.001` | Rachel Shell MN Medical License | `MN-72165` | MN | State MD License | Rachel Shell |
| `LS.MT.BusinessLicense.002` | Rachel Shell DEA Registration | `BS3729410` | DEA | DEA Sched II-V | Rachel Shell |
| `LS.MT.BusinessLicense.003` | Marcus Chen MN Medical License | `MN-48293` | MN | State MD License | Dr. Marcus Chen |
| `LS.MT.BusinessLicense.004` | Marcus Chen DEA Registration | `BC4817302` | DEA | DEA Sched II-V | Dr. Marcus Chen |
| `LS.MT.BusinessLicense.005` | Sofia Reyes MN Medical License | `MN-61047` | MN | State MD License | Dr. Sofia Reyes |
| `LS.MT.BusinessLicense.006` | Sofia Reyes DEA Registration | `BR5924810` | DEA | DEA Sched II-V | Dr. Sofia Reyes |
| `LS.MT.BusinessLicense.007` | James Park MN Medical License | `MN-39821` | MN | State MD License | Dr. James Park |
| `LS.MT.BusinessLicense.008` | James Park DEA Registration | `BP6037291` | DEA | DEA Sched II-V | Dr. James Park |
| `LS.MT.BusinessLicense.009` | Elena Torres MN Medical License | `MN-52736` | MN | State MD License | Dr. Elena Torres |
| `LS.MT.BusinessLicense.010` | Elena Torres DEA Registration | `BT7148392` | DEA | DEA Sched II-V | Dr. Elena Torres |
| `LS.MT.BusinessLicense.011` | Omar Hassan MN Medical License | `MN-44619` | MN | State MD License | Dr. Omar Hassan |
| `LS.MT.BusinessLicense.012` | Omar Hassan DEA Registration | `BH8259403` | DEA | DEA Sched II-V | Dr. Omar Hassan |

**Physician license fields:**
- `JurisdictionType`: `STATE` (medical license) or `COUNTRY` (DEA)
- `JurisdictionState`: `MN` for state licenses; null for DEA
- `LicenseClass`: `MD - Medical Doctor (MD)` for all
- `Status`: `Verified`; `IsPrimaryLicense`: `true` for state license, `false` for DEA
- `Description`: includes NUCC taxonomy code (e.g., `207RI0011X`) matching the physician's `HealthcareProviderTaxonomy`

### Facility Licenses (1 per facility)

| External ID | Name | Identifier | Facility | NUCC |
|---|---|---|---|---|
| `LS.MT.BusinessLicense.013` | United Hospital MN Hospital License | `MN-HOSP-0147` | United Hospital | 282N00000X |
| `LS.MT.BusinessLicense.014` | Abbott Northwestern Hospital MN Hospital License | `MN-HOSP-0032` | Abbott Northwestern Hospital | 282N00000X |
| `LS.MT.BusinessLicense.015` | Mercy Hospital MN Hospital License | `MN-HOSP-0219` | Mercy Hospital | 282N00000X |
| `LS.MT.BusinessLicense.016` | United Heart and Vascular Clinic MN Clinic License | `MN-CLIN-1084` | United Heart and Vascular Clinic | 261QP2300X |

**Facility license fields:** All `JurisdictionType=STATE`, `JurisdictionState=MN`, `IsPrimaryLicense=true`, `Status=Verified`, linked via `HealthcareProviderId` to the org-type HealthcareProvider record.

---

## CareTaxonomy Record Types

Three record types structure the NUCC hierarchy. All use the `CareTaxonomy-LSDO-MT-Taxonomy Layout` page layout.

| RecordType DeveloperName | Label | Level | Example |
|---|---|---|---|
| `LSDO_MT_Taxonomy_Grouping` | LSDO MedTech Taxonomy Grouping | Top-level NUCC grouping (no parent) | Allopathic & Osteopathic Physicians |
| `LSDO_MT_Taxonomy_Classification` | LSDO MedTech Taxonomy Classification | Specialty; child of a Grouping | Internal Medicine, Surgery, Radiology |
| `LSDO_MT_Taxonomy_Specialization` | LSDO MedTech Taxonomy Specialization | Subspecialty; child of a Classification | Interventional Cardiology, Vascular Surgery |

## External ID Pattern

All CareTaxonomy records use the LSDO standard pattern:

```
LS.MT.CareTaxonomy.NNN
```

- `LS` — Life Sciences prefix
- `MT` — MedTech sub-vertical
- `CareTaxonomy` — object name
- `NNN` — 3-digit zero-padded sequence (001–484, continuing from highest existing)

## Physician Taxonomy Assignments (HealthcareProviderTaxonomy)

Each physician in the cinematic universe has one `HealthcareProviderTaxonomy` record linking them to their NUCC classification. External IDs follow `LS.MT.HealthcareProviderTaxonomy.NNN`.

| External ID | Physician | Taxonomy | NUCC Code |
|---|---|---|---|
| `LS.MT.HealthcareProviderTaxonomy.001` | Rachel Shell | Thoracic Surgery (Cardiothoracic Vascular Surgery) | 208G00000X |
| `LS.MT.HealthcareProviderTaxonomy.002` | Dr. Marcus Chen | Interventional Cardiology | 207RI0011X |
| `LS.MT.HealthcareProviderTaxonomy.003` | Dr. Sofia Reyes | Vascular Surgery | 208G00000X |
| `LS.MT.HealthcareProviderTaxonomy.004` | Dr. James Park | Thoracic Surgery (Cardiothoracic Vascular Surgery) | 208G00000X |
| `LS.MT.HealthcareProviderTaxonomy.005` | Dr. Elena Torres | Vascular & Interventional Radiology | 2085R0001X |
| `LS.MT.HealthcareProviderTaxonomy.006` | Dr. Omar Hassan | Interventional Cardiology | 207RI0011X |

## Key Taxonomy Records Used in MedTech Demos

These are the CareTaxonomy records most relevant to the Makana MedTech product portfolio and demo scenarios.

| External ID | Name | Parent | NUCC Code | Notes |
|---|---|---|---|---|
| `LS.MT.CareTaxonomy.051` | Cardiovascular Disease | Internal Medicine | 207RC0000X | Parent of Interventional Cardiology and Clinical Cardiac Electrophysiology |
| `LS.MT.CareTaxonomy.066` | Clinical Cardiac Electrophysiology | Internal Medicine | 207RI0200X | EP physicians; relevant for cardiac rhythm devices |
| `LS.MT.CareTaxonomy.196` | Interventional Cardiology | Internal Medicine | 207RI0011X | Dr. Marcus Chen, Dr. Omar Hassan |
| `LS.MT.CareTaxonomy.447` | Surgery | *(root — Allopathic & Osteopathic Physicians)* | 208600000X | Parent of Vascular Surgery, Pediatric Surgery, Surgery of the Hand |
| `LS.MT.CareTaxonomy.468` | Vascular & Interventional Radiology | Radiology | 2085R0001X | Dr. Elena Torres |
| `LS.MT.CareTaxonomy.471` | Vascular Surgery | Surgery | 208G00000X | Dr. Sofia Reyes |
| `LS.MT.CareTaxonomy.482` | Thoracic Surgery (Cardiothoracic Vascular Surgery) | *(root — Allopathic & Osteopathic Physicians)* | 208G00000X | Rachel Shell, Dr. James Park |
| `LS.MT.CareTaxonomy.483` | Radiology | *(root)* | 2085R0000X | Parent of Vascular & Interventional Radiology and Diagnostic Ultrasound |
| `LS.MT.CareTaxonomy.484` | Psychiatry & Neurology | *(root)* | 2084N0400X | Parent of Neurology, Geriatric Psychiatry, Neuromuscular Medicine |

## Parent Hierarchy for Demo Specialties

```
Allopathic & Osteopathic Physicians (grouping)
  ├── Internal Medicine (classification)
  │     ├── Cardiovascular Disease           LS.MT.CareTaxonomy.051
  │     │     └── (no subspecialties in org)
  │     ├── Clinical Cardiac Electrophysiology  LS.MT.CareTaxonomy.066
  │     └── Interventional Cardiology        LS.MT.CareTaxonomy.196 ← Marcus Chen, Omar Hassan
  ├── Surgery (classification)               LS.MT.CareTaxonomy.446
  │     └── Vascular Surgery                 LS.MT.CareTaxonomy.471 ← Sofia Reyes
  └── Thoracic Surgery (root classification) LS.MT.CareTaxonomy.482 ← Rachel Shell, James Park

Radiology (root)                             LS.MT.CareTaxonomy.483
  └── Vascular & Interventional Radiology    LS.MT.CareTaxonomy.468 ← Elena Torres
```

## Data Volume

**CareTaxonomy:**

| RecordType | Count | Description |
|---|---|---|
| `LSDO_MT_Taxonomy_Grouping` | 67 | Top-level NUCC provider categories |
| `LSDO_MT_Taxonomy_Classification` | 413 | Specialties (children of groupings) |
| `LSDO_MT_Taxonomy_Specialization` | 4 | Subspecialties (children of classifications) |
| **Total** | **484** | |

**CareSpecialty:** 49 records — all `LSDO_MedTech_CareSpecialty` RecordType, all `LS.MT.CareSpecialty.NNN` External IDs.

**CareSpecialtyTaxonomy:** 4 records — one per demo physician specialty, linking CareSpecialty to CareTaxonomy.

**HealthcareProviderSpecialty:** 6 MT records (`LS.MT.HealthcareProviderSpecialty.006–.011`) — one per demo physician.

**BusinessLicense:** 16 MT records — 12 physician licenses (2 per physician: state MD + DEA) + 4 facility operating licenses.

## Source Reference

Taxonomy codes and hierarchy sourced from the CMS Medicare Provider/Supplier Taxonomy Crosswalk (NUCC Health Care Provider Taxonomy Code Set, Version 25.1). Available at [nucc.org](https://nucc.org/index.php/code-sets-mainmenu-41/provider-taxonomy-mainmenu-40/csv-mainmenu-57).

For context on how physicians connect to taxonomy via the LSC provider model, see [makana-medtech-personas.md](makana-medtech-personas.md) and [makana-accounts.md](makana-accounts.md).
