Read the MedTech territory model documentation and SFDMU data from `skills/medtech-territory-model/`.

## What to load

1. Read `skills/medtech-territory-model/MedTech-Territory-Model.md` for the full territory hierarchy, user assignments, account alignments, and ProviderAcctTerritoryInfo mapping.
2. The SFDMU CSV files in that folder contain the raw exported data:
   - `Territory2.csv` — 3 MedTech territories with External_ID__c
   - `User.csv` — 4 aligned users with External_ID__c
   - `UserTerritory2Association.csv` — user-to-territory assignments and roles
   - `Account.csv` — 8 aligned accounts with External_ID__c
   - `ObjectTerritory2Association.csv` — account-to-territory alignments
   - `ProviderAcctTerritoryInfo.csv` — PATI records with External_ID__c, RecommendedPresentationInfo, and Advocacy_Score__c

## When to use this context

- Creating or modifying MedTech demo scenarios that involve territories, account alignment, or user roles
- Understanding which users see which accounts and presentations in the MedTech sub-vertical
- Creating new territory-aware records (visits, opportunities, PATI entries) that must align to the MedTech hierarchy
- Debugging territory-based queries (e.g. `getMyPresentations`, `getSyncManifest`, `getRecommendedPresentations`) that filter by `UserTerritory2Association`
- Adding new accounts or users to the MedTech territory

## Key facts

- All MedTech territories use `External_ID__c` prefix `LS.MT.Territory2.*`
- All MedTech PATI records use prefix `LS.MT.ProvAcctTerrInfo.*`
- MedTech-specific accounts use prefix `LS.MT.Account.*`; shared accounts use `LS.Account.*`
- The only leaf territory with user and account assignments is `TM - MedTech - SPC - San Francisco North 20D02T11`
- The territory model is `LSCTerritoryModel` (shared with pharma sub-vertical)
- Carmen Central (`LSDO.User.010`) is the Account Executive persona for MedTech demos

## Re-exporting data

To refresh the SFDMU CSV files from the org:

```bash
sf sfdmu run --sourceusername NOICE --targetusername csvfile --path skills/medtech-territory-model
```
