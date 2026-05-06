---
name: managing-medtech-territories
description: "Manage the MedTech territory hierarchy, user assignments, account alignments, and ProviderAcctTerritoryInfo (PATI) records in the LSDO Salesforce org. Use this skill when working with Territory2, UserTerritory2Association, ObjectTerritory2Association, or ProviderAcctTerritoryInfo objects in the MedTech branch of the LSC Territory Model. TRIGGER when: user mentions MedTech territories, territory assignments, account alignments, PATI records, territory hierarchy, or SFDMU territory exports. DO NOT TRIGGER for: non-MedTech (pharma) territories, general Territory2 questions outside LSDO, or persona/product questions (use lsdo-cinematic-universe files instead)."
aliases:
  - MedTech Territory Model
  - Territory Model
  - LSC Territory Model
  - MedTech Territories
tags:
  - lsdo
  - lsdo/medtech
  - lsdo/territory-model
  - salesforce/territory2
metadata:
  version: "0.1.0"
  last_updated: "2026-05-05"
---
# MedTech Territory Model — LSDO

Part of the [Makana MedTech Cinematic Universe](../lsdo-cinematic-universe/makana-medtech-cinematic-universe.md). For personas assigned to these territories, see [Makana MedTech Personas](../lsdo-cinematic-universe/makana-medtech-personas.md). For accounts aligned to these territories, see [Makana Accounts](../lsdo-cinematic-universe/makana-accounts.md).

## Overview

The MedTech territories live inside the **LSC Territory Model** (`DeveloperName: LSCTerritoryModel`, `External_ID__c: n/a on model`). This is the single active `Territory2Model` in the org. The MedTech branch is a self-contained sub-tree distinguished by `MedTech` / `MT` in territory names and `_MT_` in developer names. All three levels use Territory2Type = **Geographical** (`DeveloperName: Geographical`).

The MedTech branch covers **4 regions**: Midwest (primary demo region with Allina Health accounts), West, Northeast, and Southeast. Only the Midwest region has account alignments and user assignments; the other three are empty scaffolding for expansion.

> **Note on DeveloperNames:** DeveloperName is immutable after save. The West region (`.001`–`.003`) was the original territory and retains DeveloperNames like `RD_MT_West_20D` and `DM_MT_San_Francisco_20D02`. The region Name is `West 20B` — the DeveloperName discrepancy is an artifact of the original build and does not affect functionality.

## Hierarchy

```
West 20B (LS.MT.Territory2.001–003)               — no account alignments
  RD - MedTech - West 20B          (DeveloperName: RD_MT_West_20D)
    └── DM - MedTech - San Francisco 20B01         (DeveloperName: DM_MT_San_Francisco_20D02)
          └── TM - MedTech - SPC - San Francisco North 20B01T01

Midwest 20A (LS.MT.Territory2.004–006)             — PRIMARY demo region
  RD - MedTech - Midwest 20A
    └── DM - MedTech - Minneapolis 20A01
          └── TM - MedTech - SPC - Minneapolis North 20A01T01  ← all Allina accounts here

Northeast 20B (LS.MT.Territory2.007–009)           — no account alignments
  RD - MedTech - Northeast 20B
    └── DM - MedTech - New York 20B01
          └── TM - MedTech - SPC - New York Metro 20B01T01

Southeast 20C (LS.MT.Territory2.010–012)           — no account alignments
  RD - MedTech - Southeast 20C
    └── DM - MedTech - Atlanta 20C01
          └── TM - MedTech - SPC - Atlanta Metro 20C01T01
```

### Full Territory Table

| Level | Name | DeveloperName | External_ID__c | Region |
|-------|------|---------------|----------------|--------|
| RD | RD - MedTech - West 20B | `RD_MT_West_20D` | `LS.MT.Territory2.001` | West |
| DM | DM - MedTech - San Francisco 20B01 | `DM_MT_San_Francisco_20D02` | `LS.MT.Territory2.002` | West |
| TM | TM - MedTech - SPC - San Francisco North 20B01T01 | `TM_MT_SPC_San_Francisco_North_20D02T11` | `LS.MT.Territory2.003` | West |
| RD | RD - MedTech - Midwest 20A | `RD_MT_Midwest_20A` | `LS.MT.Territory2.004` | Midwest |
| DM | DM - MedTech - Minneapolis 20A01 | `DM_MT_Minneapolis_20A01` | `LS.MT.Territory2.005` | Midwest |
| TM | TM - MedTech - SPC - Minneapolis North 20A01T01 | `TM_MT_SPC_Minneapolis_North_20A01T01` | `LS.MT.Territory2.006` | Midwest |
| RD | RD - MedTech - Northeast 20B | `RD_MT_Northeast_20B` | `LS.MT.Territory2.007` | Northeast |
| DM | DM - MedTech - New York 20B01 | `DM_MT_New_York_20B01` | `LS.MT.Territory2.008` | Northeast |
| TM | TM - MedTech - SPC - New York Metro 20B01T01 | `TM_MT_SPC_New_York_Metro_20B01T01` | `LS.MT.Territory2.009` | Northeast |
| RD | RD - MedTech - Southeast 20C | `RD_MT_Southeast_20C` | `LS.MT.Territory2.010` | Southeast |
| DM | DM - MedTech - Atlanta 20C01 | `DM_MT_Atlanta_20C01` | `LS.MT.Territory2.011` | Southeast |
| TM | TM - MedTech - SPC - Atlanta Metro 20C01T01 | `TM_MT_SPC_Atlanta_Metro_20C01T01` | `LS.MT.Territory2.012` | Southeast |

### Naming Convention

- **Prefix** = level abbreviation: `RD` (Regional Director), `DM` (District Manager), `TM` (Territory Manager)
- **MedTech** or **MT** signals the sub-vertical
- **SPC** = Specialty Care product line (on TM level)
- **Trailing code** = region + district + territory number (e.g. `20A01T01`)

## User Assignments

Persona users are assigned to the **Midwest** hierarchy. Carmen Central and Sasha Sato are at the TM leaf; Morgan Medina is at the Midwest RD. Admin users are at the Midwest TM.

| User | External_ID__c | Territory | Role in Territory | User Role |
|------|----------------|-----------|-------------------|-----------|
| [Carmen Central](../lsdo-cinematic-universe/makana-medtech-personas.md#Carmen%20Central%20—%20MedTech%20Sales%20Rep) | `LSDO.User.010` | TM - Minneapolis North 20A01T01 (`.006`) | Account Executive | MT MedTech Territory Manager |
| [Sasha Sato](../lsdo-cinematic-universe/makana-medtech-personas.md#Sasha%20Sato%20—%20MedTech%20Clinical%20Specialist) | `LSDO.User.013` | TM - Minneapolis North 20A01T01 (`.006`) | Account Executive | MT MedTech Territory Manager |
| [Morgan Medina](../lsdo-cinematic-universe/makana-medtech-personas.md#Morgan%20Medina%20—%20Regional%20Director%20of%20Sales) | `LSDO.User.014` | RD - Midwest 20A (`.004`) | Manager | MT MedTech Regional Director |
| Larry Davis | `User.001` | TM - Minneapolis North 20A01T01 (`.006`) | Solution Engineer | — |
| Admin2 User | `LSDO.User.002` | TM - Minneapolis North 20A01T01 (`.006`) | Account Partner | — |
| Admin4 User | `LSDO.User.004` | TM - Minneapolis North 20A01T01 (`.006`) | Account Partner | — |

### UserRoles

Two MedTech-specific UserRoles are created under VP of Sales:

```
VP of Sales (VPSales)
  └── MT MedTech Regional Director  (MT_MedTech_Regional_Director)  → Morgan Medina
        └── MT MedTech Territory Manager  (MT_MedTech_Territory_Manager)  → Carmen Central, Sasha Sato
```

## Account Alignments (ObjectTerritory2Association)

All accounts are aligned at the **Midwest TM leaf territory** (`LS.MT.Territory2.006`). No accounts are aligned at RD or DM levels, or in other regions. For account details, see [Makana Accounts](../lsdo-cinematic-universe/makana-accounts.md).

**Facility Accounts:**

| Account | External_ID__c | Territory |
|---------|----------------|-----------|
| [Vizient](../lsdo-cinematic-universe/makana-accounts.md#Vizient%20(GPO)) GPO | `LS.MT.Account.003` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [Allina Health](../lsdo-cinematic-universe/makana-accounts.md#Allina%20Health%20(IDN)) IDN | `LS.MT.Account.002` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [United Hospital](../lsdo-cinematic-universe/makana-accounts.md#United%20Hospital%20(Facility)) | `LS.MT.Account.001` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [Abbott Northwestern Hospital](../lsdo-cinematic-universe/makana-accounts.md#Abbott%20Northwestern%20Hospital%20(Facility)) | `LS.MT.Account.004` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [Mercy Hospital](../lsdo-cinematic-universe/makana-accounts.md#Mercy%20Hospital%20(Facility)) | `LS.MT.Account.005` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [United Heart and Vascular Clinic](../lsdo-cinematic-universe/makana-accounts.md#United%20Heart%20and%20Vascular%20Clinic%20(Clinic)) | `LS.MT.Account.006` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| Acme Healthcare | `LS.Account.2` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| Brigham City Community Health System | `LS.Account.75` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| Brigham City Community Hospital | `LS.Account.66` | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| Santa Clarita Hospital | `LS.Account.71` | TM - MedTech - SPC - Minneapolis North 20A01T01 |

**Physician Person Accounts:**

| Account | External_ID__c | Specialty | Territory |
|---------|----------------|-----------|-----------|
| [Rachel Shell](../lsdo-cinematic-universe/makana-medtech-personas.md#Rachel%20Shell%20—%20Cardiothoracic%20Surgeon) | `LS.Account.17` | Cardiothoracic Surgeon | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [Dr. Marcus Chen](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20Marcus%20Chen%20—%20Interventional%20Cardiologist) | `LS.MT.Account.007` | Interventional Cardiologist | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [Dr. Sofia Reyes](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20Sofia%20Reyes%20—%20Vascular%20Surgeon) | `LS.MT.Account.008` | Vascular Surgeon | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [Dr. James Park](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20James%20Park%20—%20Cardiothoracic%20Surgeon) | `LS.MT.Account.009` | Cardiothoracic Surgeon | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [Dr. Elena Torres](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20Elena%20Torres%20—%20Interventional%20Radiologist) | `LS.MT.Account.010` | Interventional Radiologist | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| [Dr. Omar Hassan](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20Omar%20Hassan%20—%20Interventional%20Cardiologist) | `LS.MT.Account.011` | Interventional Cardiologist | TM - MedTech - SPC - Minneapolis North 20A01T01 |

> Accounts prefixed `LS.MT.Account.*` are MedTech-specific golden records. Others (`LS.Account.*`) are shared across sub-verticals.

## ProviderAcctTerritoryInfo (PATI)

PATI records link accounts to territories with recommended presentation info. All PATI records are on the Midwest TM leaf territory (`LS.MT.Territory2.006`).

| Account | External_ID__c (PATI) | Recommended Presentations |
|---------|----------------------|---------------------------|
| [United Hospital](../lsdo-cinematic-universe/makana-accounts.md#United%20Hospital%20(Facility)) | `LS.MT.ProvAcctTerrInfo.001` | Aurora In-Service, Introduction to Immunexis, A Head to Head Study |
| Brigham City Community Hospital | `LS.MT.ProvAcctTerrInfo.002` | Aurora In-Service |
| Santa Clarita Hospital | `LS.MT.ProvAcctTerrInfo.003` | Aurora In-Service |
| Ashok Kumar | `LS.MT.ProvAcctTerrInfo.004` | Aurora In-Service |
| [Rachel Shell](../lsdo-cinematic-universe/makana-medtech-personas.md#Rachel%20Shell%20—%20Cardiothoracic%20Surgeon) | `LS.MT.ProvAcctTerrInfo.005` | Aurora In-Service, A Head to Head Study, Agentforce Video |
| Brigham City Community Health System | `LS.MT.ProvAcctTerrInfo.006` | Aurora In-Service |
| Acme Healthcare | `LS.MT.ProvAcctTerrInfo.007` | Aurora In-Service |
| [Dr. Marcus Chen](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20Marcus%20Chen%20—%20Interventional%20Cardiologist) | `LS.MT.ProvAcctTerrInfo.008` | Nimbus IVL In-Service, A Head to Head Study, Agentforce Video |
| [Dr. Sofia Reyes](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20Sofia%20Reyes%20—%20Vascular%20Surgeon) | `LS.MT.ProvAcctTerrInfo.009` | Aurora In-Service, A Head to Head Study |
| [Dr. James Park](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20James%20Park%20—%20Cardiothoracic%20Surgeon) | `LS.MT.ProvAcctTerrInfo.010` | Aurora In-Service, A Head to Head Study, Agentforce Video |
| [Dr. Elena Torres](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20Elena%20Torres%20—%20Interventional%20Radiologist) | `LS.MT.ProvAcctTerrInfo.011` | Aurora In-Service, A Head to Head Study |
| [Dr. Omar Hassan](../lsdo-cinematic-universe/makana-medtech-personas.md#Dr.%20Omar%20Hassan%20—%20Interventional%20Cardiologist) | `LS.MT.ProvAcctTerrInfo.012` | Nimbus IVL In-Service, Aurora In-Service |
| [Abbott Northwestern Hospital](../lsdo-cinematic-universe/makana-accounts.md#Abbott%20Northwestern%20Hospital%20(Facility)) | `LS.MT.ProvAcctTerrInfo.013` | Aurora In-Service, A Head to Head Study |
| [Mercy Hospital](../lsdo-cinematic-universe/makana-accounts.md#Mercy%20Hospital%20(Facility)) | `LS.MT.ProvAcctTerrInfo.014` | Nimbus IVL In-Service |
| [United Heart and Vascular Clinic](../lsdo-cinematic-universe/makana-accounts.md#United%20Heart%20and%20Vascular%20Clinic%20(Clinic)) | `LS.MT.ProvAcctTerrInfo.015` | Aurora In-Service |

## Territory2 Types (org-wide)

| MasterLabel | DeveloperName |
|-------------|---------------|
| Channel | `Channel` |
| Geographical | `Geographical` |
| Named | `Named` |
| Overlay | `Overlay` |
| Regional | `Regional` |

The MedTech branch uses **Geographical** exclusively.

## Relationship to Non-MedTech Territories

The LSC Territory Model contains ~359 territories total. The non-MedTech territories follow a similar hierarchy (RD → DM → TM) for the pharma/biotech sub-vertical. The MedTech branch is structurally separate — each MedTech RD has no parent territory, making them top-level nodes alongside the pharma RD territories.

## SFDMU Data

Use the SFDMU export.json in this folder to download or restore the MedTech territory data:

```bash
sf sfdmu run --sourceusername <org-alias> --targetusername csvfile --path skills/managing-medtech-territories
```

This exports Territory2, UserTerritory2Association, ObjectTerritory2Association, and ProviderAcctTerritoryInfo records for MedTech territories only.

## Related Skills

- [building-lsdo](../building-lsdo/SKILL.md) — LSDO build standards that govern territory naming and structure
- [building-life-sciences-cloud](../building-life-sciences-cloud/SKILL.md) — LSC objects including ProviderAcctTerritoryInfo and Territory2 APIs
- [migrating-sfdmu-data](../migrating-sfdmu-data/SKILL.md) — SFDMU export.json configuration used to migrate territory assignment data
- [lsdo-cinematic-universe](../lsdo-cinematic-universe/SKILL.md) — Makana accounts and personas that populate territory alignments
