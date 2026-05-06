---
aliases:
  - MedTech Territory Model
  - Makana Territory Model
  - Midwest Territory
  - Minneapolis Territory
tags:
  - lsdo
  - lsdo/cinematic-universe
  - lsdo/medtech
  - lsdo/territory-model
---
# MedTech Territory Model

Part of the [Makana MedTech Cinematic Universe](makana-medtech-cinematic-universe.md).

Territory model for Makana MedTech demos. [Carmen Central](makana-medtech-personas.md#Carmen%20Central%20—%20MedTech%20Sales%20Rep) and [Sasha Sato](makana-medtech-personas.md#Sasha%20Sato%20—%20MedTech%20Clinical%20Specialist) cover the **Midwest region**, based in Minneapolis. Their territory includes the Allina Health IDN, United Hospital, Abbott Northwestern, and all other MedTech accounts. [Morgan Medina](makana-medtech-personas.md#Morgan%20Medina%20—%20Regional%20Director%20of%20Sales) manages the Midwest region as Regional Director.

All MedTech territories live inside the **LSC Territory Model** — the single active Territory2Model in the org. The MedTech branch is self-contained and separate from the pharma/biotech territories.

> **For technical operations** (adding accounts to a territory, modifying user assignments, SFDMU export commands): see [managing-medtech-territories](../managing-medtech-territories/SKILL.md).

---

## Territory Hierarchy

The MedTech branch has 4 regions: **Midwest** (primary demo region with all account alignments), West, Northeast, and Southeast. Each region has three levels: Regional Director (RD), District Manager (DM), and Territory Manager (TM).

| Level | Name | External_ID__c | Region |
|-------|------|----------------|--------|
| RD | RD - MedTech - West 20B | `LS.MT.Territory2.001` | West |
| DM | DM - MedTech - San Francisco 20B01 | `LS.MT.Territory2.002` | West |
| TM | TM - MedTech - SPC - San Francisco North 20B01T01 | `LS.MT.Territory2.003` | West |
| RD | RD - MedTech - Midwest 20A | `LS.MT.Territory2.004` | **Midwest** |
| DM | DM - MedTech - Minneapolis 20A01 | `LS.MT.Territory2.005` | **Midwest** |
| TM | TM - MedTech - SPC - Minneapolis North 20A01T01 | `LS.MT.Territory2.006` | **Midwest** |
| RD | RD - MedTech - Northeast 20B | `LS.MT.Territory2.007` | Northeast |
| DM | DM - MedTech - New York 20B01 | `LS.MT.Territory2.008` | Northeast |
| TM | TM - MedTech - SPC - New York Metro 20B01T01 | `LS.MT.Territory2.009` | Northeast |
| RD | RD - MedTech - Southeast 20C | `LS.MT.Territory2.010` | Southeast |
| DM | DM - MedTech - Atlanta 20C01 | `LS.MT.Territory2.011` | Southeast |
| TM | TM - MedTech - SPC - Atlanta Metro 20C01T01 | `LS.MT.Territory2.012` | Southeast |

West, Northeast, and Southeast are empty scaffolding — no account alignments or user assignments. All demo activity is in the Midwest.

---

## Demo Persona Assignments

| Persona | Territory | External_ID__c | Role |
|---------|-----------|----------------|------|
| [Carmen Central](makana-medtech-personas.md#Carmen%20Central%20—%20MedTech%20Sales%20Rep) — MedTech Sales Rep | TM - Minneapolis North 20A01T01 (`.006`) | `LSDO.User.010` | Account Executive |
| [Sasha Sato](makana-medtech-personas.md#Sasha%20Sato%20—%20MedTech%20Clinical%20Specialist) — Clinical Specialist | TM - Minneapolis North 20A01T01 (`.006`) | `LSDO.User.013` | Account Executive |
| [Morgan Medina](makana-medtech-personas.md#Morgan%20Medina%20—%20Regional%20Director%20of%20Sales) — Regional Director | RD - Midwest 20A (`.004`) | `LSDO.User.014` | Manager |

Carmen and Sasha share the same TM leaf territory. Morgan rolls up from the Midwest RD — her territory encompasses both the DM and TM levels below it. The user role hierarchy mirrors this:

```
MT MedTech Regional Director  → Morgan Medina
  └── MT MedTech Territory Manager  → Carmen Central, Sasha Sato
```

---

## Account Alignments

All 16 accounts are aligned to the **Midwest TM leaf territory** (`LS.MT.Territory2.006` — TM - MedTech - SPC - Minneapolis North 20A01T01). This is what makes them visible in Carmen and Sasha's territory-filtered list views, reports, and Agentforce grounding.

> **Demo implication:** If an account is not in this list, Carmen and Sasha will not see it in their territory views. To add an account to the territory, create an `ObjectTerritory2Association` record — see [managing-medtech-territories](../managing-medtech-territories/SKILL.md).

### Healthcare Organization Accounts

| Account | External_ID__c | Type |
|---------|----------------|------|
| [Vizient](makana-accounts.md#Vizient%20(GPO)) | `LS.MT.Account.003` | GPO |
| [Allina Health](makana-accounts.md#Allina%20Health%20(IDN)) | `LS.MT.Account.002` | IDN |
| [Allina Care Network](makana-accounts.md#Allina%20Care%20Network) | `LS.MT.Account.012` | Care Network |
| [Captis](makana-accounts.md#Captis%20(GPO)) | `LS.MT.Account.013` | GPO |
| [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) | `LS.MT.Account.001` | Hospital |
| [Abbott Northwestern Hospital](makana-accounts.md#Abbott%20Northwestern%20Hospital%20(Facility)) | `LS.MT.Account.004` | Hospital |
| [Mercy Hospital](makana-accounts.md#Mercy%20Hospital%20(Facility)) | `LS.MT.Account.005` | Hospital |
| [United Heart and Vascular Clinic](makana-accounts.md#United%20Heart%20and%20Vascular%20Clinic%20(Clinic)) | `LS.MT.Account.006` | Clinic |
| Acme Healthcare | `LS.Account.2` | — |
| Brigham City Community Health System | `LS.Account.75` | — |
| Brigham City Community Hospital | `LS.Account.66` | — |
| Santa Clarita Hospital | `LS.Account.71` | — |

### Physician Person Accounts

| Physician | External_ID__c | Specialty |
|-----------|----------------|-----------|
| [Rachel Shell](makana-medtech-personas.md#Rachel%20Shell%20—%20Cardiothoracic%20Surgeon) | `LS.Account.17` | Cardiothoracic Surgeon |
| [Dr. Marcus Chen](makana-medtech-personas.md#Dr.%20Marcus%20Chen%20—%20Interventional%20Cardiologist) | `LS.MT.Account.007` | Interventional Cardiologist |
| [Dr. Sofia Reyes](makana-medtech-personas.md#Dr.%20Sofia%20Reyes%20—%20Vascular%20Surgeon) | `LS.MT.Account.008` | Vascular Surgeon |
| [Dr. James Park](makana-medtech-personas.md#Dr.%20James%20Park%20—%20Cardiothoracic%20Surgeon) | `LS.MT.Account.009` | Cardiothoracic Surgeon |
| [Dr. Elena Torres](makana-medtech-personas.md#Dr.%20Elena%20Torres%20—%20Interventional%20Radiologist) | `LS.MT.Account.010` | Interventional Radiologist |
| [Dr. Omar Hassan](makana-medtech-personas.md#Dr.%20Omar%20Hassan%20—%20Interventional%20Cardiologist) | `LS.MT.Account.011` | Interventional Cardiologist |

---

## ProviderAcctTerritoryInfo (PATI)

PATI records associate accounts with the territory and carry **recommended presentations** — the clinical content Carmen and Sasha are expected to deliver at each account. All 15 PATI records are on the Midwest TM leaf (`LS.MT.Territory2.006`).

| PATI External_ID__c | Account | Recommended Presentations |
|---------------------|---------|---------------------------|
| `LS.MT.ProvAcctTerrInfo.001` | [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) | Aurora In-Service, Introduction to Immunexis, A Head to Head Study |
| `LS.MT.ProvAcctTerrInfo.002` | Brigham City Community Hospital | Aurora In-Service |
| `LS.MT.ProvAcctTerrInfo.003` | Santa Clarita Hospital | Aurora In-Service |
| `LS.MT.ProvAcctTerrInfo.004` | Ashok Kumar | Aurora In-Service |
| `LS.MT.ProvAcctTerrInfo.005` | [Rachel Shell](makana-medtech-personas.md#Rachel%20Shell%20—%20Cardiothoracic%20Surgeon) | Aurora In-Service, A Head to Head Study, Agentforce Video |
| `LS.MT.ProvAcctTerrInfo.006` | Brigham City Community Health System | Aurora In-Service |
| `LS.MT.ProvAcctTerrInfo.007` | Acme Healthcare | Aurora In-Service |
| `LS.MT.ProvAcctTerrInfo.008` | [Dr. Marcus Chen](makana-medtech-personas.md#Dr.%20Marcus%20Chen%20—%20Interventional%20Cardiologist) | Nimbus IVL In-Service, A Head to Head Study, Agentforce Video |
| `LS.MT.ProvAcctTerrInfo.009` | [Dr. Sofia Reyes](makana-medtech-personas.md#Dr.%20Sofia%20Reyes%20—%20Vascular%20Surgeon) | Aurora In-Service, A Head to Head Study |
| `LS.MT.ProvAcctTerrInfo.010` | [Dr. James Park](makana-medtech-personas.md#Dr.%20James%20Park%20—%20Cardiothoracic%20Surgeon) | Aurora In-Service, A Head to Head Study, Agentforce Video |
| `LS.MT.ProvAcctTerrInfo.011` | [Dr. Elena Torres](makana-medtech-personas.md#Dr.%20Elena%20Torres%20—%20Interventional%20Radiologist) | Aurora In-Service, A Head to Head Study |
| `LS.MT.ProvAcctTerrInfo.012` | [Dr. Omar Hassan](makana-medtech-personas.md#Dr.%20Omar%20Hassan%20—%20Interventional%20Cardiologist) | Nimbus IVL In-Service, Aurora In-Service |
| `LS.MT.ProvAcctTerrInfo.013` | [Abbott Northwestern Hospital](makana-accounts.md#Abbott%20Northwestern%20Hospital%20(Facility)) | Aurora In-Service, A Head to Head Study |
| `LS.MT.ProvAcctTerrInfo.014` | [Mercy Hospital](makana-accounts.md#Mercy%20Hospital%20(Facility)) | Nimbus IVL In-Service |
| `LS.MT.ProvAcctTerrInfo.015` | [United Heart and Vascular Clinic](makana-accounts.md#United%20Heart%20and%20Vascular%20Clinic%20(Clinic)) | Aurora In-Service |
