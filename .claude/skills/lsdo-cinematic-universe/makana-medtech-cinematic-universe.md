---
aliases:
  - Makana MedTech Cinematic Universe
  - cinematic universe
  - LSDO Cinematic Universe
tags:
  - lsdo
  - lsdo/cinematic-universe
  - MOC
---
# Makana MedTech Cinematic Universe

The cinematic universe is the shared fictional world used across all LSDO MedTech demos. All characters, companies, products, and relationships are designed to work together so demos tell cohesive stories. Follow [LSDO](skills/building-lsdo/SKILL.md) build standards when extending this universe.

## Universe Files

| File | Contents |
|------|----------|
| [Makana Life Sciences](makana-life-sciences.md) | Parent company overview — Makana Life Sciences, Pharmaceuticals, and MedTech divisions |
| [Makana MedTech Products](makana-medtech-products.md) | Full MedTech product catalog with External IDs, ProductCodes, SKUs, and record types |
| [Makana MedTech Personas](makana-medtech-personas.md) | All demo personas — Makana employees, customer contacts, and healthcare professionals |
| [Makana Accounts](makana-accounts.md) | Customer accounts — health systems, IDNs, GPOs, and hospitals |
| [Konkurrent Medical](makana-medtech-competitor-konkurrent.md) | Primary competitor with competing products, competitive narratives, and demo scenarios |
| [MedTech Territory Model](makana-medtech-territories.md) | 4-region territory hierarchy, persona assignments, account alignments, and PATI recommended presentations |

## How to Use

When building a new demo or solution:
1. Pick [personas](makana-medtech-personas.md) appropriate for the scenario
2. Reference [products](makana-medtech-products.md) by External ID — never by Salesforce Id
3. Use [existing accounts](makana-accounts.md) before creating new ones
4. For competitive scenarios, use [Konkurrent Medical](makana-medtech-competitor-konkurrent.md) as the competitor
5. Ground the story in [Makana's](makana-life-sciences.md) corporate context (divisions, therapeutic areas)
6. Verify [territory alignments](../managing-medtech-territories/SKILL.md) match persona assignments

## External ID Ranges

| Range | Allocation |
|-------|-----------|
| `LS.MT.Product2.001`–`LS.MT.Product2.099` | [Makana MedTech products](makana-medtech-products.md) |
| `LS.MT.Product2.101`–`LS.MT.Product2.159` | [Konkurrent Medical products](makana-medtech-competitor-konkurrent.md) |
| `LS.MT.Account.*` | [MedTech-specific customer accounts](makana-accounts.md) |
| `LS.MT.Territory2.*` | [MedTech territory records](../managing-medtech-territories/SKILL.md) |
| `LS.MT.ProvAcctTerrInfo.*` | [Provider account territory info](../managing-medtech-territories/SKILL.md#ProviderAcctTerritoryInfo%20(PATI)) |
| `LSDO.User.*` | [Demo user records](makana-medtech-personas.md#Territory%20Model%20Alignment) |
