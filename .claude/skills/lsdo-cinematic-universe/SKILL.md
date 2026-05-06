---
name: lsdo-cinematic-universe
description: "Golden record definitions and narrative context for the Makana MedTech demo universe used across LSDO demos. Use this skill when referencing Makana MedTech demo stories, personas, accounts, products, or competitors. TRIGGER when: user asks about Makana, demo personas, demo accounts, Konkurrent Medical, MedTech demo stories, or any golden record narrative context for LSDO MedTech demos. DO NOT TRIGGER for: general LSDO build standards (use building-lsdo skill), LSC object configuration (use building-life-sciences-cloud skill), or territory model details (use managing-medtech-territories skill)."
aliases:
  - cinematic-universe
  - Makana MedTech
  - LSDO Cinematic Universe
tags:
  - life-sciences
  - lsdo
  - demo
  - medtech
---

# LSDO Cinematic Universe

The cinematic universe is the shared fictional world used across all LSDO MedTech demos. All characters, companies, products, and relationships are designed to work together so demos tell cohesive stories.

## Universe Files

| File | Contents |
|------|----------|
| [Makana Life Sciences](makana-life-sciences.md) | Parent company overview — Makana Life Sciences, Pharmaceuticals, and MedTech divisions |
| [Makana MedTech Products](makana-medtech-products.md) | Full MedTech product catalog with External IDs, ProductCodes, SKUs, and record types |
| [Makana MedTech Personas](makana-medtech-personas.md) | All demo personas — Makana employees, customer contacts, and healthcare professionals |
| [Makana Accounts](makana-accounts.md) | Customer accounts — health systems, IDNs, GPOs, and hospitals |
| [Konkurrent Medical](makana-medtech-competitor-konkurrent.md) | Primary competitor with competing products, competitive narratives, and demo scenarios |
| [MedTech Territory Model](makana-medtech-territories.md) | 4-region territory hierarchy, persona assignments, account alignments, and PATI recommended presentations |
| [Care Taxonomy, Specialty & Licensing](makana-medtech-care-taxonomy.md) | CareTaxonomy (NUCC hierarchy, 484 records), CareSpecialty (49 records), CareSpecialtyTaxonomy (4 junction records), HealthcareProviderSpecialty and HealthcareProviderTaxonomy for all 6 physicians, BusinessLicense (16 records — state MD licenses, DEA registrations, and facility operating licenses) |

## How to Use

When building a new demo or solution:
1. Pick [personas](makana-medtech-personas.md) appropriate for the scenario
2. Reference [products](makana-medtech-products.md) by External ID — never by Salesforce Id
3. Use [accounts](makana-accounts.md) as the target customer accounts for the scenario
4. Check [territory model](makana-medtech-territories.md) to confirm account-to-territory alignments are in place

> **Surgical Changes:** When editing golden records, touch only the specific persona, product, or account fields requested. Do not reformat tables, reorder records, or adjust adjacent entries. Every changed line must trace to the user's request.

## Related Skills

- [building-lsdo](../building-lsdo/SKILL.md) — build standards for the LSDO org where these demo records live
- [building-life-sciences-cloud](../building-life-sciences-cloud/SKILL.md) — LSC objects that hold Makana account and clinical data
- [managing-medtech-territories](../managing-medtech-territories/SKILL.md) — territory alignments that connect Makana accounts to the MedTech rep hierarchy
