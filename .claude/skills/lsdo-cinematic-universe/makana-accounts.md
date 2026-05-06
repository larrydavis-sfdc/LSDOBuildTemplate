---
aliases:
  - Makana Accounts
  - LSDO Accounts
  - customer accounts
  - United Hospital
  - Allina Health
  - Vizient
tags:
  - lsdo
  - lsdo/cinematic-universe
  - lsdo/medtech
  - lsdo/accounts
---
# Makana MedTech Customer Accounts

Part of the [Makana MedTech Cinematic Universe](makana-medtech-cinematic-universe.md).

Customer accounts used in [LSDO](skills/building-lsdo/SKILL.md) MedTech demos. These represent the healthcare organizations that buy [Makana products](makana-medtech-products.md) and interact with [Makana personas](makana-medtech-personas.md). For the primary competitor tracked at these accounts, see [Konkurrent Medical](makana-medtech-competitor-konkurrent.md). All accounts are aligned to the TM leaf territory — see [MedTech Territory Model](makana-medtech-territories.md) for full alignment details.

## Account Hierarchy

MedTech demos use a multi-tier account hierarchy reflecting real-world healthcare purchasing. The `Account.ParentId` hierarchy captures organizational ownership. Lateral relationships (IDN peer affiliations, care network membership, direct GPO contracts) are modeled via `AccountAccountRelation` + `PartyRoleRelation` — see [Account Affiliations](#account-affiliations) below.

| Tier | Role | Example Account | RecordType |
|------|------|----------------|------------|
| GPO (Group Purchasing Organization) | Negotiates contracts on behalf of member systems | Vizient, Captis | LSDO_Healthcare_Organization |
| Care Network | Cross-IDN clinical collaboration entity that member hospitals join | Allina Care Network | LSDO_Healthcare_Organization |
| IDN (Integrated Delivery Network) | Regional health system operating multiple facilities | Allina Health | LSDO_Healthcare_Organization |
| Hospital / Facility | Individual hospital where products are used and serviced | United Hospital | LSDO_Healthcare_Organization |

### Vizient (GPO)

| Field | Value |
|-------|-------|
| Name | Vizient |
| External_Id__c | `LS.MT.Account.003` |
| Type | GPO |
| BillingAddress | P.O. Box 140909, Irving, TX 75014-0909 |
| ShippingAddress | 290 E John Carpenter Freeway, Irving, TX 75062 |
| Description | LS — Group Purchasing Organization. Negotiates pricing and contracts for member IDNs and hospitals. |

Allina Health IDN holds a Vizient membership (IDN-level contract). All Allina member hospitals gain access to Vizient pricing through their IDN membership.

### Captis (GPO)

| Field | Value |
|-------|-------|
| Name | Captis |
| External_ID__c | `LS.MT.Account.013` |
| Type | GPO |
| BillingAddress | 1000 Westgate Drive, Suite 210, St. Paul, MN 55114 |
| Description | LS — Independent group purchasing organization focused on cardiology, vascular, and surgical device categories. Individual hospital members hold direct Captis contracts independent of their IDN's primary GPO relationships. |

United Hospital and Mercy Hospital each hold **direct** Captis memberships — independent of Allina's Vizient IDN contract. This creates a multi-GPO pricing scenario: Carmen may need to honor Captis pricing for IVL and PTA catheter categories at United Hospital and Mercy, even though Allina's network-level contract is through Vizient. This is a common real-world complexity in hospital device purchasing.

### Allina Care Network

| Field | Value |
|-------|-------|
| Name | Allina Care Network |
| External_ID__c | `LS.MT.Account.012` |
| Type | Care Network |
| Parent | Allina Health IDN |
| BillingAddress | 2925 Chicago Avenue, Minneapolis, MN 55407 |
| Description | LS — Clinical collaboration and care access network operated by Allina Health. Member hospitals gain access to Allina flagship facilities and Centers of Excellence for advanced referrals, shared clinical protocols, and specialty expertise (particularly cardiac and vascular). Membership is independent of IDN affiliation — community hospitals can join the care network without joining the IDN. |

This is the CU's representation of the Mayo Clinic Care Network pattern: a named care network entity that hospitals join for clinical collaboration access. United Hospital and Abbott Northwestern are full members; Mercy Hospital joined as a community partner specifically for access to Abbott Northwestern's cardiac CoE.

### Allina Health (IDN)

| Field | Value |
|-------|-------|
| Name | Allina Health |
| External_Id__c | `LS.MT.Account.002` |
| Parent | Vizient |
| Type | IDN |
| BillingAddress | 2925 Chicago Avenue, Minneapolis, MN 55407 |
| ShippingAddress | 2925 Chicago Avenue, Minneapolis, MN 55407 |
| Description | LS — Integrated Delivery Network operating 12 hospitals and 90+ clinics across Minnesota and Wisconsin. Member of Vizient GPO. |

### United Hospital (Facility)

| Field | Value |
|-------|-------|
| Name | United Hospital |
| External_Id__c | `LS.MT.Account.001` |
| Parent | Allina Health |
| Type | Hospital |
| BillingAddress | 333 Smith Avenue North, Saint Paul, MN 55102 |
| ShippingAddress | 333 Smith Avenue North, Saint Paul, MN 55102 |
| Location | `LS.MT.Location.001` — United Hospital (Hospital) |
| BusinessLicense | `LS.MT.BusinessLicense.013` — MN-HOSP-0147 (MN Hospital License) |
| Description | LS — 545-bed facility in St. Paul, MN. Primary demo account for MedTech sales scenarios. |

Key personas at United Hospital: [Kimberly Spark](makana-medtech-personas.md#Kimberly%20Spark%20—%20Procurement%20Manager) (Procurement), [Rachel Shell](makana-medtech-personas.md#Rachel%20Shell%20—%20Cardiothoracic%20Surgeon) (Cardiothoracic Surgery), [Kai Kowalski](makana-medtech-personas.md#Kai%20Kowalski%20—%20OR%20Nurse%20Manager) (OR Nurse Manager), [Tobin Tanaka](makana-medtech-personas.md#Tobin%20Tanaka%20—%20Hospital%20CFO) (CFO), [Nico Navarro](makana-medtech-personas.md#Nico%20Navarro%20—%20Biomedical%20Engineer) (Biomedical Engineering), and [Dr. Marcus Chen](makana-medtech-personas.md#Dr.%20Marcus%20Chen%20—%20Interventional%20Cardiologist) (Interventional Cardiology).

United Hospital is the **primary demo account** — most opportunity, order, and service scenarios reference it. It is where [Carmen Central](makana-medtech-personas.md#Carmen%20Central%20—%20MedTech%20Sales%20Rep) (MedTech Sales Rep) focuses her territory.

### Abbott Northwestern Hospital (Facility)

| Field | Value |
|-------|-------|
| Name | Abbott Northwestern Hospital |
| External_Id__c | `LS.MT.Account.004` |
| Parent | Allina Health |
| Type | Hospital |
| BillingAddress | 800 E 28th Street, Minneapolis, MN 55407 |
| ShippingAddress | 800 E 28th Street, Minneapolis, MN 55407 |
| Location | `LS.MT.Location.003` — Abbott Northwestern Hospital (Hospital) |
| BusinessLicense | `LS.MT.BusinessLicense.014` — MN-HOSP-0032 (MN Hospital License) |
| Description | LS — 697-bed flagship academic medical center for Allina Health. Cardiac surgery and structural heart center of excellence. Primary site for a second Aurora Surgical Robot capital sale and Nimbus IVL expansion. |

Key physicians: [Dr. James Park](makana-medtech-personas.md#Dr.%20James%20Park%20—%20Cardiothoracic%20Surgeon) (Cardiothoracic Surgery), [Dr. Elena Torres](makana-medtech-personas.md#Dr.%20Elena%20Torres%20—%20Interventional%20Radiologist) (Interventional Radiology).

### Mercy Hospital (Facility)

| Field | Value |
|-------|-------|
| Name | Mercy Hospital |
| External_Id__c | `LS.MT.Account.005` |
| Parent | Allina Health |
| Type | Hospital |
| BillingAddress | 4050 Coon Rapids Boulevard, Coon Rapids, MN 55433 |
| ShippingAddress | 4050 Coon Rapids Boulevard, Coon Rapids, MN 55433 |
| Location | `LS.MT.Location.004` — Mercy Hospital (Hospital) |
| BusinessLicense | `LS.MT.BusinessLicense.015` — MN-HOSP-0219 (MN Hospital License) |
| Description | LS — 269-bed community hospital serving the northern Twin Cities suburbs. Cath lab focused on interventional cardiology and peripheral vascular. Target for Nimbus IVL generator and PTA catheter standardization. |

Key physicians: [Dr. Omar Hassan](makana-medtech-personas.md#Dr.%20Omar%20Hassan%20—%20Interventional%20Cardiologist) (Interventional Cardiology).

### United Heart and Vascular Clinic (Clinic)

| Field | Value |
|-------|-------|
| Name | United Heart and Vascular Clinic |
| External_Id__c | `LS.MT.Account.006` |
| Parent | United Hospital |
| Type | Clinic |
| BillingAddress | 225 Smith Avenue North, Suite 600, Saint Paul, MN 55102 |
| ShippingAddress | 225 Smith Avenue North, Suite 600, Saint Paul, MN 55102 |
| Location | `LS.MT.Location.005` — United Heart and Vascular Clinic (Clinic) |
| BusinessLicense | `LS.MT.BusinessLicense.016` — MN-CLIN-1084 (MN Clinic License) |
| Description | LS — Vascular surgery and interventional radiology clinic co-located with United Hospital. Primary outpatient site for PTA balloon catheter procedures. Reports up through United Hospital. |

Key physicians: [Dr. Sofia Reyes](makana-medtech-personas.md#Dr.%20Sofia%20Reyes%20—%20Vascular%20Surgeon) (Vascular Surgery).

## Provider Accounts (Physician Person Accounts)

Individual physicians are represented as Person Accounts using RecordType `LSDO_Healthcare_Provider`. All are aligned to the TM leaf territory and have PATI records with product-appropriate presentations.

| External ID | Name | Specialty | Home Facility | Billing/Shipping Address | Primary Products |
|-------------|------|-----------|---------------|--------------------------|-----------------|
| `LS.MT.Account.007` | Dr. Marcus Chen | Interventional Cardiologist | United Hospital | 333 Smith Avenue North, Saint Paul, MN 55102 | Nimbus IVL, PTA Catheters |
| `LS.MT.Account.008` | Dr. Sofia Reyes | Vascular Surgeon | United Heart and Vascular Clinic | 225 Smith Avenue North, Suite 600, Saint Paul, MN 55102 | PTA Balloon Catheters (Stratus/Cyclone), Accessories |
| `LS.MT.Account.009` | Dr. James Park | Cardiothoracic Surgeon | Abbott Northwestern Hospital | 800 E 28th Street, Minneapolis, MN 55407 | Aurora Surgical Robot |
| `LS.MT.Account.010` | Dr. Elena Torres | Interventional Radiologist | Abbott Northwestern Hospital | 800 E 28th Street, Minneapolis, MN 55407 | PTA Balloon Catheters, Nimbus IVL |
| `LS.MT.Account.011` | Dr. Omar Hassan | Interventional Cardiologist | Mercy Hospital | 4050 Coon Rapids Boulevard, Coon Rapids, MN 55433 | Nimbus IVL |

Rachel Shell (`LS.Account.17`, Cardiothoracic Surgeon at United Hospital) is a shared cross-vertical Person Account with billing/shipping address 333 Smith Avenue North, Saint Paul, MN 55102. For full persona details see [makana-medtech-personas.md](makana-medtech-personas.md).

## Location & Address Model

LSC `Location` and `Address` records provide department-level placement for assets, trunk stock, and direct-ship consumable delivery. Each facility has a top-level `Location` (linked via `HealthcareFacility.LocationId`) with child sub-locations for the operating rooms, cath labs, and procedure rooms where Makana products are actually used and serviced.

### Location Hierarchy

```
LS.MT.Location.001  United Hospital (Hospital)
  ├── LS.MT.Location.002  United Hospital Cardiothoracic Operating Room
  │     └── Addresses: .001 Billing, .002 Shipping (OR), .014 Shipping (main dock)
  │         Assets: Aurora Surgeon Console (.001), Aurora Surgical Robot (.002),
  │                 Aurora 3D Tower (.003), Aurora Patient Cart (.004), Aurora Single Port (.005)
  └── LS.MT.Location.006  United Hospital Cath Lab
        └── Address: .009 Shipping (cath lab direct delivery)
            Asset: Nimbus IVL Generator (.006)

LS.MT.Location.003  Abbott Northwestern Hospital (Hospital)
  ├── LS.MT.Location.007  Abbott Northwestern Cardiothoracic Suite
  │     └── Address: .010 Shipping (CT OR direct delivery)
  └── LS.MT.Location.008  Abbott Northwestern IR Suite
        └── Address: .011 Shipping (IR direct delivery)

LS.MT.Location.004  Mercy Hospital (Hospital)
  └── LS.MT.Location.009  Mercy Hospital Cath Lab
        └── Address: .012 Shipping (cath lab direct delivery)

LS.MT.Location.005  United Heart and Vascular Clinic (Clinic)
  └── LS.MT.Location.010  United Heart and Vascular Procedure Room
        └── Address: .013 Shipping (procedure room direct delivery)
```

### Location Records

| External ID | Name | LocationType | Parent Location | Account |
|-------------|------|-------------|-----------------|---------|
| `LS.MT.Location.001` | United Hospital | Hospital | — | United Hospital |
| `LS.MT.Location.002` | United Hospital Cardiothoracic Operating Room | Operating Room | `.001` | United Hospital |
| `LS.MT.Location.003` | Abbott Northwestern Hospital | Hospital | — | Abbott Northwestern Hospital |
| `LS.MT.Location.004` | Mercy Hospital | Hospital | — | Mercy Hospital |
| `LS.MT.Location.005` | United Heart and Vascular Clinic | Clinic | — | United Heart and Vascular Clinic |
| `LS.MT.Location.006` | United Hospital Cath Lab | Operating Room | `.001` | United Hospital |
| `LS.MT.Location.007` | Abbott Northwestern Cardiothoracic Suite | Operating Room | `.003` | Abbott Northwestern Hospital |
| `LS.MT.Location.008` | Abbott Northwestern IR Suite | Operating Room | `.003` | Abbott Northwestern Hospital |
| `LS.MT.Location.009` | Mercy Hospital Cath Lab | Operating Room | `.004` | Mercy Hospital |
| `LS.MT.Location.010` | United Heart and Vascular Procedure Room | Operating Room | `.005` | United Heart and Vascular Clinic |

### Address Records

| External ID | AddressType | LocationType | Parent Location | Street |
|-------------|-------------|-------------|-----------------|--------|
| `LS.MT.Address.001` | Billing | Hospital | `.001` United Hospital | 333 Smith Avenue North |
| `LS.MT.Address.002` | Shipping | Operating Room | `.002` United Hospital CT OR | 333 Smith Avenue North, Floor 3 East |
| `LS.MT.Address.003` | Billing | Hospital | `.003` Abbott Northwestern | 800 E 28th Street |
| `LS.MT.Address.004` | Shipping | Hospital | `.003` Abbott Northwestern | 800 E 28th Street |
| `LS.MT.Address.005` | Billing | Hospital | `.004` Mercy Hospital | 4050 Coon Rapids Boulevard |
| `LS.MT.Address.006` | Shipping | Hospital | `.004` Mercy Hospital | 4050 Coon Rapids Boulevard |
| `LS.MT.Address.007` | Billing | Clinic | `.005` United Heart and Vascular Clinic | 225 Smith Avenue North, Suite 600 |
| `LS.MT.Address.008` | Shipping | Clinic | `.005` United Heart and Vascular Clinic | 225 Smith Avenue North, Suite 600 |
| `LS.MT.Address.009` | Shipping | Operating Room | `.006` United Hospital Cath Lab | 333 Smith Avenue North, Floor 4 West — Cath Lab |
| `LS.MT.Address.010` | Shipping | Operating Room | `.007` Abbott Northwestern CT Suite | 800 E 28th Street, Floor 3 — Cardiothoracic OR |
| `LS.MT.Address.011` | Shipping | Operating Room | `.008` Abbott Northwestern IR Suite | 800 E 28th Street, Floor 2 — Interventional Radiology |
| `LS.MT.Address.012` | Shipping | Operating Room | `.009` Mercy Hospital Cath Lab | 4050 Coon Rapids Boulevard — Cath Lab Suite |
| `LS.MT.Address.013` | Shipping | Operating Room | `.010` United Heart and Vascular Procedure Room | 225 Smith Avenue North, Suite 600 — Procedure Room A |
| `LS.MT.Address.014` | Shipping | Hospital | `.001` United Hospital | 333 Smith Avenue North |

### Asset Location Assignments

| External ID | Asset | Location |
|-------------|-------|----------|
| `LS.MT.Asset.001` | United Aurora Surgeon Console | `.002` United Hospital CT OR |
| `LS.MT.Asset.002` | United Aurora Surgical Robot System | `.002` United Hospital CT OR |
| `LS.MT.Asset.003` | United Aurora 3D Tower | `.002` United Hospital CT OR |
| `LS.MT.Asset.004` | United Aurora Patient Cart | `.002` United Hospital CT OR |
| `LS.MT.Asset.005` | United Aurora Single Port | `.002` United Hospital CT OR |
| `LS.MT.Asset.006` | United Nimbus IVL Generator | `.006` United Hospital Cath Lab |

## Existing Demo Data

| External ID | Description |
|-------------|-------------|
| HLS_RDO_Competitor_MedTech.001 | [Konkurrent Vann PTA](makana-medtech-competitor-konkurrent.md#Vann%20PTA%20Balloon%20Catheters) tracked at United Hospital, related to United Hospital - Add-On Business - 128K opportunity |

## Account Affiliations

Lateral account relationships are modeled via `AccountAccountRelation` (standard Salesforce, no LSC4CE dependency), typed by `PartyRoleRelation` records. These express relationships that `Account.ParentId` can't — peer affiliations, cross-IDN care network membership, and direct GPO contracts that coexist with IDN-level contracts.

### Relationship Type Definitions (PartyRoleRelation)

| External ID | RoleName (AccountId side) | RelatedRoleName | Used For |
|---|---|---|---|
| `LS.MT.PartyRoleRelation.001` | IDN Member | Integrated Delivery Network | Hospital → IDN formal membership |
| `LS.MT.PartyRoleRelation.002` | IDN Peer | IDN Peer | Lateral peer relationship between sibling IDN hospitals |
| `LS.MT.PartyRoleRelation.003` | Referral Partner | Receiving Center of Excellence | One-way referral relationship for complex cases |
| `LS.MT.PartyRoleRelation.004` | Clinic Integration | Integrated Hospital | Clinic ↔ hospital operational integration |
| `LS.MT.PartyRoleRelation.005` | Care Network Member | Care Network | Hospital → Care Network membership |
| `LS.MT.PartyRoleRelation.006` | GPO Contract Member | Group Purchasing Organization | IDN-level GPO contract |
| `LS.MT.PartyRoleRelation.007` | Direct GPO Member | Group Purchasing Organization | Hospital-level direct GPO membership |

### Layer 1 — IDN Membership

| Account | Related Account | HierarchyType | Role |
|---|---|---|---|
| United Hospital `.001` | Allina Health IDN `.002` | Child | IDN Member |
| Abbott Northwestern `.004` | Allina Health IDN `.002` | Child | IDN Member |
| Mercy Hospital `.005` | Allina Health IDN `.002` | Child | IDN Member |

### Layer 2 — Peer Affiliations Within IDN

| Account | Related Account | HierarchyType | Role | Story |
|---|---|---|---|---|
| United Hospital `.001` | Abbott Northwestern `.004` | Peer | IDN Peer | Shared cardiac surgery protocols and patient transfer agreements |
| United Hospital `.001` | Mercy Hospital `.005` | Peer | IDN Peer | Shared clinical services and on-call coverage |
| Mercy Hospital `.005` | Abbott Northwestern `.004` | Peer | Referral Partner | Mercy routes complex cardiac/structural heart cases to Abbott Northwestern CoE |
| United Heart & Vascular `.006` | United Hospital `.001` | Peer | Clinic Integration | Bidirectional inpatient/outpatient continuum |

### Layer 3 — Care Network Membership

| Account | Related Account | HierarchyType | Role | Story |
|---|---|---|---|---|
| United Hospital `.001` | Allina Care Network `.012` | Child | Care Network Member | Flagship network member |
| Abbott Northwestern `.004` | Allina Care Network `.012` | Child | Care Network Member | CoE hub for cardiac and structural heart referrals |
| Mercy Hospital `.005` | Allina Care Network `.012` | Child | Care Network Member | Community partner; joined for CoE access |

### Layer 4 — GPO Contracts

| Account | Related Account | HierarchyType | Role | Story |
|---|---|---|---|---|
| Allina Health IDN `.002` | Vizient GPO `.003` | Child | GPO Contract Member | IDN-level Vizient contract — applies to all Allina member hospitals |
| United Hospital `.001` | Captis `.013` | Child | Direct GPO Member | Direct hospital membership for cardiology/vascular device categories |
| Mercy Hospital `.005` | Captis `.013` | Child | Direct GPO Member | Direct hospital membership for cardiology/vascular device categories |

### Demo Story Implications

- **Multi-IDN pull-through**: Carmen can show that winning United Hospital has pull-through value across the Allina IDN. Mercy and Abbott Northwestern are formal IDN peers — standardization decisions propagate.
- **Care network referral volume**: Mercy routes complex cardiac cases to Abbott Northwestern CoE via the care network. This drives procedure volume at Abbott Northwestern, justifying the second Aurora system and increasing Nimbus IVL urgency.
- **Multi-GPO pricing complexity**: United Hospital and Mercy hold direct Captis contracts for cardiology/vascular alongside Allina's Vizient contract. Carmen needs to know which contract applies to which device category when talking to Kimberly Spark (Procurement).
- **Clinic integration**: Dr. Sofia Reyes at United Heart and Vascular routes vascular cases requiring inpatient care to United Hospital — the PTA catheter standardization deal spans both accounts because of this integration.

## Usage Notes

- All customer accounts use RecordType `LSDO_Healthcare_Organization` (not `LSDO_MedTech_Competitor`, which is for [Konkurrent](makana-medtech-competitor-konkurrent.md))
- External IDs follow the pattern `LS.MT.Account.*` — see the [territory model](../managing-medtech-territories/SKILL.md#Account%20Alignments%20(ObjectTerritory2Association)) for full External ID list
- The GPO → IDN → Hospital hierarchy (via `Account.ParentId`) plus the `AccountAccountRelation` affiliations together model the full complexity of health system purchasing relationships
