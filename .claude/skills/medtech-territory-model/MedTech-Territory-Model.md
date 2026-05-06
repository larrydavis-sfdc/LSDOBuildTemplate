# MedTech Territory Model — LSDO

## Overview

The MedTech territories live inside the **LSC Territory Model** (`DeveloperName: LSCTerritoryModel`, `External_ID__c: n/a on model`). This is the single active `Territory2Model` in the org. The MedTech branch is a self-contained sub-tree distinguished by `MedTech` / `MT` in territory names and `_MT_` in developer names. All three levels use Territory2Type = **Geographical** (`DeveloperName: Geographical`).

## Hierarchy

```
RD - MedTech - West 20D                                 (Regional Director)
  └── DM - MedTech - San Francisco 20D02                (District Manager)
        └── TM - MedTech - SPC - San Francisco North 20D02T11  (Territory Manager)
```

| Level | Name | DeveloperName | External_ID__c | Territory2Type |
|-------|------|---------------|----------------|----------------|
| RD | RD - MedTech - West 20D | `RD_MT_West_20D` | `LS.MT.Territory2.001` | Geographical |
| DM | DM - MedTech - San Francisco 20D02 | `DM_MT_San_Francisco_20D02` | `LS.MT.Territory2.002` | Geographical |
| TM | TM - MedTech - SPC - San Francisco North 20D02T11 | `TM_MT_SPC_San_Francisco_North_20D02T11` | `LS.MT.Territory2.003` | Geographical |

### Naming convention

- **Prefix** = level abbreviation: `RD` (Regional Director), `DM` (District Manager), `TM` (Territory Manager)
- **MedTech** or **MT** signals the sub-vertical
- **SPC** = Specialty Care product line (on TM level)
- **Trailing code** = region + district + territory number (e.g. `20D02T11`)

## User Assignments

All users are assigned at the **TM leaf territory** (`TM - MedTech - SPC - San Francisco North 20D02T11`). No users are assigned at RD or DM levels.

| User | Username | External_ID__c | Role in Territory |
|------|----------|----------------|-------------------|
| Carmen Central | `carmen.central@trailsignup-372b45ad8abcf3.com` | `LSDO.User.010` | Account Executive |
| Larry Davis | `trailsignup.372b45ad8abcf3@salesforce.com` | `User.001` | Solution Engineer |
| Admin2 User | `admin2.osauuchaau06@salesforce.com` | `LSDO.User.002` | Account Partner |
| Admin4 User | `admin4.mppl2z8ypfne@salesforce.com` | `LSDO.User.004` | Account Partner |

## Account Alignments (ObjectTerritory2Association)

All 8 accounts are aligned at the **TM leaf territory**. No accounts are aligned at RD or DM levels.

| Account | External_ID__c | Territory |
|---------|----------------|-----------|
| Acme Healthcare | `LS.Account.2` | TM - MedTech - SPC - San Francisco North 20D02T11 |
| Allina Health IDN | `LS.MT.Account.002` | TM - MedTech - SPC - San Francisco North 20D02T11 |
| Brigham City Community Health System | `LS.Account.75` | TM - MedTech - SPC - San Francisco North 20D02T11 |
| Brigham City Community Hospital | `LS.Account.66` | TM - MedTech - SPC - San Francisco North 20D02T11 |
| Rachel Shell | `LS.Account.17` | TM - MedTech - SPC - San Francisco North 20D02T11 |
| Santa Clarita Hospital | `LS.Account.71` | TM - MedTech - SPC - San Francisco North 20D02T11 |
| United Hospital | `LS.MT.Account.001` | TM - MedTech - SPC - San Francisco North 20D02T11 |
| Vizient GPO | `LS.MT.Account.003` | TM - MedTech - SPC - San Francisco North 20D02T11 |

> Accounts prefixed `LS.MT.Account.*` are MedTech-specific golden records. Others (`LS.Account.*`) are shared across sub-verticals.

## ProviderAcctTerritoryInfo (PATI)

PATI records link accounts to territories with recommended presentation info. All 7 PATI records are on the TM leaf territory.

| Account | External_ID__c (PATI) | Recommended Presentations |
|---------|----------------------|---------------------------|
| Acme Healthcare | `LS.MT.ProvAcctTerrInfo.007` | Aurora In-Service |
| Ashok Kumar | `LS.MT.ProvAcctTerrInfo.004` | Aurora In-Service |
| Brigham City Community Health System | `LS.MT.ProvAcctTerrInfo.006` | Aurora In-Service |
| Brigham City Community Hospital | `LS.MT.ProvAcctTerrInfo.002` | Aurora In-Service |
| Rachel Shell | `LS.MT.ProvAcctTerrInfo.005` | Aurora In-Service, A Head to Head Study, Agentforce Video |
| Santa Clarita Hospital | `LS.MT.ProvAcctTerrInfo.003` | Aurora In-Service |
| United Hospital | `LS.MT.ProvAcctTerrInfo.001` | Aurora In-Service, Introduction to Immunexis, A Head to Head Study |

## Territory2 Types (org-wide)

| MasterLabel | DeveloperName |
|-------------|---------------|
| Channel | `Channel` |
| Geographical | `Geographical` |
| Named | `Named` |
| Overlay | `Overlay` |
| Regional | `Regional` |

The MedTech branch uses **Geographical** exclusively.

## Relationship to non-MedTech territories

The LSC Territory Model contains ~359 territories total. The non-MedTech territories follow a similar hierarchy (RD → DM → TM) for the pharma/biotech sub-vertical. The MedTech branch is structurally separate — `RD - MedTech - West 20D` has no parent territory, making it a top-level node alongside the pharma RD territories.

## SFDMU Data

Use the SFDMU export.json in this folder to download or restore the MedTech territory data:

```bash
sf sfdmu run --sourceusername <org-alias> --targetusername csvfile --path skills/medtech-territory-model
```

This exports Territory2, UserTerritory2Association, ObjectTerritory2Association, and ProviderAcctTerritoryInfo records for MedTech territories only.
