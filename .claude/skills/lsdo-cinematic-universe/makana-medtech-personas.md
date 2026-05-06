---
aliases:
  - Personas
  - persona
  - Makana Personas
  - MedTech Personas
  - Carmen Central
  - Sasha Sato
  - Morgan Medina
  - Ezra Executive
  - Lennox Liu
  - Casey Quinn
  - Jim Riley
  - Jordan Kim
  - Alex River
  - Rachel Shell
  - Kai Kowalski
  - Kimberly Spark
  - Tobin Tanaka
  - Nico Navarro
tags:
  - lsdo
  - lsdo/cinematic-universe
  - lsdo/medtech
  - lsdo/personas
---
# Makana MedTech Personas

Part of the [Makana MedTech Cinematic Universe](makana-medtech-cinematic-universe.md).

Demo personas for [Makana](makana-life-sciences.md) MedTech and customer [accounts](makana-accounts.md). When building demos, assign these personas to appropriate roles rather than using System Administrator (per [LSDO](skills/building-lsdo/SKILL.md) standards). Each persona has a specific job, organizational position, and set of demo features they exercise. Use these details to ground demo stories in realistic workflows.

## How to Use Personas

- **Pick by demo feature** — Use the Demo Features column to find the right persona for the Salesforce capability being demonstrated
- **Respect reporting lines** — Persona org charts are designed so roll-up reports, forecasts, and approvals flow correctly
- **Pair personas for scenarios** — Most demo stories involve at least one Makana employee and one customer persona interacting
- **Reference by name** — Other cinematic universe files reference these personas by name; keep names consistent across all files

---

## Makana Employee Personas

### Sales Organization

#### Carmen Central — MedTech Sales Rep

| Field | Value |
|-------|-------|
| Role | MedTech Sales Representative (Account Executive) |
| Division | Makana MedTech — Sales |
| Territory | TM - MedTech - SPC - Minneapolis North 20A01T01 |
| District | DM - MedTech - Minneapolis 20A01 |
| Region | RD - MedTech - Midwest 20A |
| Reports To | Morgan Medina (Regional Director) |
| Username | `carmen.central@trailsignup-372b45ad8abcf3.com` |
| External_ID__c | `LSDO.User.010` |
| Profile | `LS MT Field Sales Representative` |
| User Role | (none assigned) |
| Title | Field Sales Rep |
| Department | Sales |
| Division (Org) | Cardiovascular |
| Permission Sets | `LSDO_MedTech_Field_Sales_PSG` (PSG), `LSDO_MedTech_Field_Sales_Rep_pset`, `LSDO_MedTech_Field_Sales_Rep_Agent`, `LSDO_All_Life_Science_Commercial_Users`, `LifeSciencesCore`, `MedTech_NOICE`, `Flow_Agentforce_Chat_Access`, `xDO_Sales_Base_Access` |
| Aligned Accounts | [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)), Allina Health IDN, [Vizient](makana-accounts.md#Vizient%20(GPO)) GPO, Acme Healthcare, Brigham City Community Health System, Brigham City Community Hospital, Santa Clarita Hospital, Rachel Shell (Person Account) |
| Products | Full [Makana MedTech portfolio](makana-medtech-products.md) — [Aurora](makana-medtech-products.md#Aurora%20Surgical%20Robot), [Nimbus IVL](makana-medtech-products.md#Nimbus%20IVL%20(Intravascular%20Lithotripsy)), [PTA Catheters](makana-medtech-products.md#PTA%20Balloon%20Catheters), [Accessories](makana-medtech-products.md#Peripheral%20Vascular%20Accessories) |
| Competitor | Tracks [Konkurrent Medical](makana-medtech-competitor-konkurrent.md) activity across accounts |
| Demo Features | Opportunity management, pipeline tracking, competitive intelligence, quoting/CPQ, order management, territory management, account planning, activity logging, mobile sales |
| Key Scenarios | New business pursuit, competitive displacement of [Fjord](makana-medtech-competitor-konkurrent.md#Fjord%20Surgical%20Robot), contract renewals, multi-site standardization deals, win-back campaigns |

Carmen is the **primary sales demo persona** and the only user assigned as Account Executive in the [territory model](../managing-medtech-territories/SKILL.md). Most opportunity, quote, and order demos should use Carmen. Carmen manages the Minneapolis North territory within the Midwest region's Specialty Care product line, selling capital equipment (Aurora robots, Nimbus generators) and consumables (PTA catheters, guidewires, sheaths) to 8 aligned accounts. Carmen spends time in the field visiting surgeons and procurement contacts, logging activities, and tracking competitive intelligence on Konkurrent.

#### Sasha Sato — MedTech Clinical Specialist

| Field | Value |
|-------|-------|
| Role | Clinical Specialist |
| Division | Makana MedTech — Sales (Clinical Support) |
| Territory | TM - MedTech - SPC - Minneapolis North 20A01T01 (aligned to Carmen) |
| Reports To | Morgan Medina (Regional Director, dotted-line to clinical leadership) |
| Aligned Accounts | Same as Carmen — all 8 accounts in Minneapolis North territory |
| Products | [Aurora Surgical Robot](makana-medtech-products.md#Aurora%20Surgical%20Robot) and [Nimbus IVL](makana-medtech-products.md#Nimbus%20IVL%20(Intravascular%20Lithotripsy)) (product expert) |
| Demo Features | Case support logging, procedure scheduling, clinical evidence sharing, competitive product intelligence, surgeon engagement tracking, training and certification records |
| Key Scenarios | Supporting live surgical cases, product in-servicing, gathering competitive intel on [Fjord](makana-medtech-competitor-konkurrent.md#Fjord%20Surgical%20Robot) usage, physician training on Aurora, clinical evaluations |

Sasha is a clinical product expert who supports surgeries and interventional procedures at hospitals alongside the sales team. Clinical specialists scrub into cases, provide real-time product guidance to surgeons, train OR staff on [Aurora](makana-medtech-products.md#Aurora%20Surgical%20Robot) instruments, and are often the first to learn about [Konkurrent](makana-medtech-competitor-konkurrent.md) product usage at accounts. Sasha works closely with Carmen on deals but focuses on clinical rather than commercial relationships.

#### Morgan Medina — Regional Director of Sales

| Field | Value |
|-------|-------|
| Role | Regional Director of Sales |
| Division | Makana MedTech — Sales |
| Region | RD - MedTech - West 20D |
| Reports To | Ezra Executive (VP of Sales) |
| Direct Reports | Carmen Central (Sales Rep), Sasha Sato (Clinical Specialist), and other territory reps |
| Demo Features | Regional forecast rollups, pipeline reviews, team performance dashboards, deal approvals, territory alignment, coaching notes, competitive win/loss analysis |
| Key Scenarios | Quarterly business reviews, forecast commits, approving large capital deals, regional strategy for [Konkurrent](makana-medtech-competitor-konkurrent.md) displacement, headcount and territory rebalancing |

Morgan is Carmen's direct manager and the Regional Director for the West region (`RD - MedTech - West 20D`), overseeing district managers, sales reps, and clinical specialists across the western US. Morgan reviews Carmen's pipeline, approves pricing exceptions on large [Aurora](makana-medtech-products.md#Aurora%20Surgical%20Robot) deals, and rolls up forecasts to Ezra. Use Morgan for mid-management demos where regional oversight, deal approvals, or team performance analytics are the focus.

#### Ezra Executive — VP of Sales

| Field | Value |
|-------|-------|
| Role | Vice President of Sales |
| Division | Makana MedTech — Sales |
| Scope | National (all regions) |
| Reports To | Makana MedTech General Manager |
| Direct Reports | Morgan Medina and other Regional Directors |
| Demo Features | National forecast, executive dashboards, strategic pipeline reviews, board-level reporting, market share analysis, competitive landscape, revenue analytics |
| Key Scenarios | National forecast calls, board presentations, market share vs. [Konkurrent](makana-medtech-competitor-konkurrent.md), strategic account reviews, annual planning |

Ezra is the top sales executive. Use Ezra for executive-level demos: C-suite dashboards, national forecast rollups, strategic competitive analysis against Konkurrent, and high-level pipeline reviews. Ezra rarely interacts with individual accounts — that flows through Regional Directors like Morgan.

### Marketing

#### Lennox Liu — Marketing Manager

| Field | Value |
|-------|-------|
| Role | Marketing Manager, MedTech |
| Division | Makana MedTech — Marketing |
| Scope | All MedTech product lines |
| Demo Features | Campaign management, content authoring, email marketing, lead scoring, marketing analytics, event management, digital engagement tracking, content distribution to sales |
| Key Scenarios | Product launch campaigns for [Aurora](makana-medtech-products.md#Aurora%20Surgical%20Robot) upgrades, physician engagement programs, trade show follow-up, competitive positioning content, [Aurora Marketing Brochure](makana-medtech-products.md#Marketing) distribution |

Lennox manages marketing programs for the MedTech division, creating campaigns that generate leads for the sales team and distributing clinical content to physicians. Use Lennox for Marketing Cloud, Pardot/Account Engagement, content management, and campaign ROI demos. Lennox produces the materials (like the [Aurora Marketing Brochure](makana-medtech-products.md#Marketing)) that Carmen and Sasha share with customers.

### Customer Service

#### Casey Quinn — Customer Service Representative

| Field | Value |
|-------|-------|
| Role | Customer Service Representative |
| Division | Makana MedTech — Customer Service |
| Channel | Phone, email, chat, web portal |
| Reports To | Jim Riley (Contact Center Supervisor) |
| Demo Features | Case management, knowledge articles, omnichannel routing, order status inquiries, product returns/exchanges, entitlement verification, case escalation, customer satisfaction surveys |
| Key Scenarios | Surgeon calls about [Aurora](makana-medtech-products.md#Aurora%20Surgical%20Robot) instrument defect, hospital reorders [PTA catheters](makana-medtech-products.md#PTA%20Balloon%20Catheters), tracking a delayed shipment, warranty claim on [Aurora Sterilization Tray](makana-medtech-products.md#Accessories), product recall communication |

Casey handles inbound customer inquiries across all channels. Use Casey for Service Cloud demos: case creation, routing, knowledge base lookups, entitlement checks, and resolution workflows. Casey frequently takes calls from [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) staff about [product](makana-medtech-products.md) orders, instrument issues, and service requests.

#### Jim Riley — Contact Center Supervisor

| Field | Value |
|-------|-------|
| Role | Contact Center Supervisor |
| Division | Makana MedTech — Customer Service |
| Reports To | Customer Service Director |
| Direct Reports | Casey Quinn and other service reps |
| Demo Features | Queue management, agent performance dashboards, SLA monitoring, case escalation handling, workforce scheduling, quality monitoring, real-time agent assist |
| Key Scenarios | Managing case backlog during a product advisory, escalating a VIP surgeon complaint, monitoring SLAs for [Allina Health](makana-accounts.md#Allina%20Health%20(IDN)) service contract, reviewing agent performance metrics |

Jim supervises the contact center team including Casey. Use Jim for supervisor-tier Service Cloud demos: real-time queue dashboards, omnichannel supervisor console, agent coaching, and escalation management.

### Field Service

#### Jordan Kim — Field Service Technician

| Field | Value |
|-------|-------|
| Role | Field Service Technician |
| Division | Makana MedTech — Field Service |
| Territory | Minneapolis North (co-located with Carmen's sales territory) |
| Reports To | Field Service Manager |
| Dispatched By | Alex River |
| Products Serviced | [Aurora Surgical Robot](makana-medtech-products.md#Aurora%20Surgical%20Robot) (installation, maintenance, calibration, repair), [Nimbus IVL Generator](makana-medtech-products.md#Nimbus%20IVL%20(Intravascular%20Lithotripsy)) (maintenance) |
| Demo Features | Work order execution, mobile field service app, parts inventory, time tracking, service reports, asset management, preventive maintenance schedules, knowledge articles, customer signature capture |
| Key Scenarios | Aurora system installation at new hospital, annual maintenance visit under [Aurora Maintenance Annual](makana-medtech-products.md#Aurora%20Surgical%20Robot) contract, emergency repair of [Aurora Patient Cart](makana-medtech-products.md#Aurora%20Surgical%20Robot), Nimbus generator calibration, parts ordering from van stock |

Jordan is dispatched to hospital sites to install, maintain, and repair Makana capital equipment. Use Jordan for Field Service Lightning demos: mobile work order management, asset tracking, parts consumption, service history, and preventive maintenance scheduling. Jordan's most common work involves [Aurora Surgical Robot](makana-medtech-products.md#Aurora%20Surgical%20Robot) systems at [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)).

#### Alex River — Field Service Dispatcher

| Field | Value |
|-------|-------|
| Role | Field Service Dispatcher |
| Division | Makana MedTech — Field Service |
| Scope | West Region dispatch |
| Reports To | Field Service Manager |
| Demo Features | Dispatch console, scheduling optimization, route planning, technician skill matching, SLA-based prioritization, capacity planning, emergency dispatch, parts availability check |
| Key Scenarios | Scheduling Jordan for an Aurora installation, re-routing a technician for an emergency robot down call, balancing workload across technicians, coordinating multi-day installation projects |

Alex manages the dispatch board and schedules field technicians like Jordan. Use Alex for Field Service dispatcher console demos: drag-and-drop scheduling, optimization, emergency dispatch, and capacity planning.

---

## Customer Personas

These personas work at customer [accounts](makana-accounts.md) (hospitals, IDNs, GPOs) — they are the people Makana sells to and serves.

### Physicians / Clinical

#### Rachel Shell — Cardiothoracic Surgeon

| Field | Value |
|-------|-------|
| Role | Cardiothoracic Surgeon |
| Organization | [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) (Allina Health) |
| External_ID__c (Account) | `LS.Account.17` |
| External_ID__c (HealthcareProviderSpecialty) | `LS.MT.HealthcareProviderSpecialty.006` |
| External_ID__c (BusinessLicense — State) | `LS.MT.BusinessLicense.001` — MN-72165 |
| External_ID__c (BusinessLicense — DEA) | `LS.MT.BusinessLicense.002` — BS3729410 |
| CareSpecialty | Cardiothoracic Surgery (`LS.MT.CareSpecialty.001`) |
| Clinical Focus | Minimally invasive cardiac and thoracic surgery, vascular intervention |
| Makana Relationship | Clinical champion — evaluates and advocates for Makana technology |
| Products Used | [Aurora Surgical Robot](makana-medtech-products.md#Aurora%20Surgical%20Robot), [Nimbus IVL](makana-medtech-products.md#Nimbus%20IVL%20(Intravascular%20Lithotripsy)), [PTA Balloon Catheters](makana-medtech-products.md#PTA%20Balloon%20Catheters) |
| Portal | Aurora Halo (AI-powered physician analytics portal — pre-op planning, real-time guidance, outcome benchmarking) |
| Demo Features | Physician engagement tracking, clinical evidence requests, AI-powered procedure planning (Aurora Halo), product evaluation workflow, training certification, key opinion leader (KOL) management |
| Key Scenarios | Evaluating Aurora (AI platform) vs. [Fjord](makana-medtech-competitor-konkurrent.md#Fjord%20Surgical%20Robot) (legacy platform with no AI), championing Nimbus IVL adoption internally, requesting clinical trial data from Sasha, reviewing AI procedure recommendations on Aurora Halo portal, providing feedback on instrument performance |

Rachel is the clinical decision-influencer at United Hospital. Surgeons like Rachel don't sign purchase orders but they drive product selection through clinical preference. Aurora Halo's AI planning and analytics capabilities are a key reason Rachel champions Aurora — she can see pre-operative AI recommendations, compare her outcomes against peers, and access clinical evidence directly in the portal. Use Rachel for physician engagement demos, Experience Cloud portal demos (Aurora Halo), and any scenario where the Aurora vs. Fjord AI story matters. Rachel works closely with Sasha Sato (Clinical Specialist) on product evaluations.

#### Dr. Marcus Chen — Interventional Cardiologist

| Field | Value |
|-------|-------|
| Role | Interventional Cardiologist |
| Organization | [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) (Allina Health) |
| External_ID__c (Account) | `LS.MT.Account.007` |
| External_ID__c (HealthcareProviderSpecialty) | `LS.MT.HealthcareProviderSpecialty.007` |
| External_ID__c (BusinessLicense — State) | `LS.MT.BusinessLicense.003` — MN-48293 |
| External_ID__c (BusinessLicense — DEA) | `LS.MT.BusinessLicense.004` — BC4817302 |
| CareSpecialty | Interventional Cardiology (`LS.MT.CareSpecialty.003`) |
| PersonTitle | Interventional Cardiologist |
| PersonEmail | marcus.chen@united-hospital.demo |
| Clinical Focus | Coronary and peripheral intervention, calcified lesion management |
| Makana Relationship | IVL champion — primary clinical decision-maker for Nimbus IVL adoption at United Hospital |
| Products Used | [Nimbus IVL Generator + Catheters](makana-medtech-products.md#Nimbus%20IVL%20(Intravascular%20Lithotripsy)), [PTA Balloon Catheters](makana-medtech-products.md#PTA%20Balloon%20Catheters) |
| Competitive Scenario | Evaluating Nimbus vs. Strøm IVL for first IVL purchase at United Hospital |
| Demo Features | Physician engagement, IVL product evaluation, clinical evidence requests, procedure analytics |

#### Dr. Sofia Reyes — Vascular Surgeon

| Field | Value |
|-------|-------|
| Role | Vascular Surgeon |
| Organization | [United Heart and Vascular Clinic](makana-accounts.md#United%20Heart%20and%20Vascular%20Clinic%20(Clinic)) (United Hospital) |
| External_ID__c (Account) | `LS.MT.Account.008` |
| External_ID__c (HealthcareProviderSpecialty) | `LS.MT.HealthcareProviderSpecialty.008` |
| External_ID__c (BusinessLicense — State) | `LS.MT.BusinessLicense.005` — MN-61047 |
| External_ID__c (BusinessLicense — DEA) | `LS.MT.BusinessLicense.006` — BR5924810 |
| CareSpecialty | Vascular Surgery (`LS.MT.CareSpecialty.002`) |
| PersonTitle | Vascular Surgeon |
| PersonEmail | sofia.reyes@united-hospital.demo |
| Clinical Focus | Peripheral arterial disease, lower extremity revascularization |
| Makana Relationship | High-volume PTA user — key account for Stratus/Cyclone catheter standardization |
| Products Used | [Stratus and Cyclone PTA Balloon Catheters](makana-medtech-products.md#PTA%20Balloon%20Catheters), [Introducer Sheath, Guidewires](makana-medtech-products.md#Peripheral%20Vascular%20Accessories) |
| Competitive Scenario | Currently split between Makana Stratus and Konkurrent Vann catheters |
| Demo Features | High-volume consumable ordering, product preference tracking, standardization deals |

#### Dr. James Park — Cardiothoracic Surgeon

| Field | Value |
|-------|-------|
| Role | Cardiothoracic Surgeon |
| Organization | [Abbott Northwestern Hospital](makana-accounts.md#Abbott%20Northwestern%20Hospital%20(Facility)) (Allina Health) |
| External_ID__c (Account) | `LS.MT.Account.009` |
| External_ID__c (HealthcareProviderSpecialty) | `LS.MT.HealthcareProviderSpecialty.009` |
| External_ID__c (BusinessLicense — State) | `LS.MT.BusinessLicense.007` — MN-39821 |
| External_ID__c (BusinessLicense — DEA) | `LS.MT.BusinessLicense.008` — BP6037291 |
| CareSpecialty | Cardiothoracic Surgery (`LS.MT.CareSpecialty.001`) |
| PersonTitle | Cardiothoracic Surgeon |
| PersonEmail | james.park@abbott-northwestern.demo |
| Clinical Focus | Minimally invasive cardiac and thoracic surgery |
| Makana Relationship | Target for second Aurora system in the Allina network — aware of Aurora from United Hospital |
| Products Used | [Aurora Surgical Robot](makana-medtech-products.md#Aurora%20Surgical%20Robot) (evaluation) |
| Competitive Scenario | Deciding between Aurora and Fjord for Abbott Northwestern's first robotic system |
| Demo Features | Surgeon preference cultivation, Aurora demo workflows, multi-site capital deal |

#### Dr. Elena Torres — Interventional Radiologist

| Field | Value |
|-------|-------|
| Role | Interventional Radiologist |
| Organization | [Abbott Northwestern Hospital](makana-accounts.md#Abbott%20Northwestern%20Hospital%20(Facility)) (Allina Health) |
| External_ID__c (Account) | `LS.MT.Account.010` |
| External_ID__c (HealthcareProviderSpecialty) | `LS.MT.HealthcareProviderSpecialty.010` |
| External_ID__c (BusinessLicense — State) | `LS.MT.BusinessLicense.009` — MN-52736 |
| External_ID__c (BusinessLicense — DEA) | `LS.MT.BusinessLicense.010` — BT7148392 |
| CareSpecialty | Interventional Radiology (`LS.MT.CareSpecialty.004`) |
| PersonTitle | Interventional Radiologist |
| PersonEmail | elena.torres@abbott-northwestern.demo |
| Clinical Focus | Peripheral vascular, oncology interventions, calcified lesion management |
| Makana Relationship | Mixed peripheral/coronary caseload; active PTA user evaluating IVL for calcified cases |
| Products Used | [PTA Balloon Catheters](makana-medtech-products.md#PTA%20Balloon%20Catheters), [Nimbus IVL](makana-medtech-products.md#Nimbus%20IVL%20(Intravascular%20Lithotripsy)) (evaluation) |
| Demo Features | Physician engagement, cross-product demos (PTA + IVL), multi-product account planning |

#### Dr. Omar Hassan — Interventional Cardiologist

| Field | Value |
|-------|-------|
| Role | Interventional Cardiologist |
| Organization | [Mercy Hospital](makana-accounts.md#Mercy%20Hospital%20(Facility)) (Allina Health) |
| External_ID__c (Account) | `LS.MT.Account.011` |
| External_ID__c (HealthcareProviderSpecialty) | `LS.MT.HealthcareProviderSpecialty.011` |
| External_ID__c (BusinessLicense — State) | `LS.MT.BusinessLicense.011` — MN-44619 |
| External_ID__c (BusinessLicense — DEA) | `LS.MT.BusinessLicense.012` — BH8259403 |
| CareSpecialty | Interventional Cardiology (`LS.MT.CareSpecialty.003`) |
| PersonTitle | Interventional Cardiologist |
| PersonEmail | omar.hassan@mercy-hospital.demo |
| Clinical Focus | Coronary intervention, structural heart, calcified lesion management |
| Makana Relationship | New IVL account — clinical decision-maker for Mercy's first Nimbus IVL generator purchase |
| Products Used | [Nimbus IVL Generator + Catheters](makana-medtech-products.md#Nimbus%20IVL%20(Intravascular%20Lithotripsy)) (new evaluation) |
| Competitive Scenario | First IVL technology evaluation at Mercy; Nimbus vs. Strøm |
| Demo Features | New logo acquisition, IVL product evaluation, community hospital deal scenario |

#### Kai Kowalski — OR Nurse Manager

| Field | Value |
|-------|-------|
| Role | Operating Room Nurse Manager |
| Organization | [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) (Allina Health) |
| Department | Surgical Services |
| Makana Relationship | Operational stakeholder — manages OR scheduling, instrument processing, and staff training |
| Products Used | [Aurora instruments](makana-medtech-products.md#Instruments) (Forceps, Stapler, Scissors, Needle Driver, Camera), [Aurora Sterilization Tray](makana-medtech-products.md#Accessories) |
| Demo Features | Inventory management, instrument reprocessing tracking, OR scheduling, staff training records, supply chain ordering, usage reporting, par level management |
| Key Scenarios | Reordering [Aurora single-use instruments](makana-medtech-products.md#Instruments), tracking sterilization cycles for reusable instruments, scheduling staff for Aurora training with Sasha, managing instrument par levels, reporting instrument usage per procedure |

Kai manages the day-to-day operations of the OR at United Hospital, including instrument inventory, staff scheduling, and supply ordering. Use Kai for inventory management, B2B Commerce reordering, and operational workflow demos. Kai is the person who actually places recurring orders for Aurora consumable instruments and manages the sterilization workflow for reusable ones.

### Procurement / Administration

#### Kimberly Spark — Procurement Manager

| Field | Value |
|-------|-------|
| Role | Procurement Manager |
| Organization | [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) (Allina Health) |
| Scope | Medical device and surgical supply purchasing |
| Makana Relationship | Key buyer — negotiates contracts, manages RFPs, approves purchase orders |
| Demo Features | Contract management, RFP evaluation, purchase order approval, vendor management, GPO contract compliance ([Vizient](makana-accounts.md#Vizient%20(GPO))), spend analytics, price benchmarking |
| Key Scenarios | RFP for PTA catheter standardization across Allina network, Aurora capital purchase negotiation, reviewing [Konkurrent](makana-medtech-competitor-konkurrent.md) vs. Makana pricing, ensuring purchases align with [Vizient](makana-accounts.md#Vizient%20(GPO)) GPO contract terms, annual contract renewal |

Kimberly is the commercial decision-maker at United Hospital. While Rachel Shell influences which products get selected clinically, Kimberly negotiates pricing, manages contracts, and signs purchase orders. Use Kimberly for CPQ, contract management, and procurement workflow demos. Kimberly interfaces with Carmen Central (Sales Rep) on deal terms.

#### Tobin Tanaka — Hospital CFO

| Field | Value |
|-------|-------|
| Role | Chief Financial Officer |
| Organization | [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) (Allina Health) |
| Scope | Financial oversight for all capital and operational expenditures |
| Makana Relationship | Executive sponsor — approves major capital purchases |
| Demo Features | ROI analysis, total cost of ownership (TCO) modeling, capital budget approval, financial dashboards, service contract cost review |
| Key Scenarios | Approving $2M+ Aurora Surgical Robot capital purchase, comparing Aurora vs. [Fjord](makana-medtech-competitor-konkurrent.md#Fjord%20Surgical%20Robot) TCO (system price vs. per-procedure instrument cost), reviewing [Aurora Maintenance Annual](makana-medtech-products.md#Aurora%20Surgical%20Robot) contract value, evaluating ROI from surgical volume growth |

Tobin is the financial executive who signs off on major capital equipment purchases. Use Tobin for executive-level customer demos where ROI justification, TCO comparison against [Konkurrent](makana-medtech-competitor-konkurrent.md), or capital budget approval workflows are the focus. Tobin relies on data from Kimberly (procurement) and Rachel (clinical outcomes) to make purchase decisions.

### Clinical Engineering / IT

#### Nico Navarro — Biomedical Engineer

| Field | Value |
|-------|-------|
| Role | Biomedical Engineer |
| Organization | [United Hospital](makana-accounts.md#United%20Hospital%20(Facility)) (Allina Health) |
| Department | Clinical Engineering |
| Makana Relationship | Technical stakeholder — manages installed equipment, maintenance schedules, and integration |
| Products Managed | [Aurora Surgical Robot](makana-medtech-products.md#Aurora%20Surgical%20Robot) system, [Nimbus IVL Generator](makana-medtech-products.md#Nimbus%20IVL%20(Intravascular%20Lithotripsy)) |
| Demo Features | Asset management, service history tracking, maintenance scheduling, equipment lifecycle, vendor portal access, integration/connectivity, compliance documentation |
| Key Scenarios | Coordinating Aurora installation with Jordan Kim (Field Service Tech), managing preventive maintenance schedule, tracking Aurora system uptime, reviewing service history before contract renewal, ensuring equipment compliance with hospital standards |

Nico is the technical point of contact at the hospital who manages installed Makana equipment. Use Nico for asset management, IoT/connected device, and customer portal demos. Nico works with Jordan Kim (Field Service Tech) during installations and maintenance visits, and provides technical input to Kimberly Spark during equipment purchase evaluations.

---

## Persona Org Charts

### Makana MedTech Sales

```
Ezra Executive (VP of Sales, National)
  └── Morgan Medina (Regional Director, RD - MedTech - Midwest 20A)
        └── District Manager (DM - MedTech - Minneapolis 20A01)
              ├── Carmen Central (Account Executive, TM - MedTech - SPC - Minneapolis North 20A01T01)
              └── Sasha Sato (Clinical Specialist, aligned to Minneapolis North)
```

### Makana MedTech Service & Field

```
Contact Center                    Field Service
  Jim Riley (Supervisor)            Field Service Manager
    └── Casey Quinn (Rep)             ├── Alex River (Dispatcher)
                                      └── Jordan Kim (Technician)
```

### Makana MedTech Marketing

```
Lennox Liu (Marketing Manager)
```

### United Hospital (Customer)

```
Tobin Tanaka (CFO)
  └── Kimberly Spark (Procurement Manager)

Rachel Shell (Cardiothoracic Surgeon)

Kai Kowalski (OR Nurse Manager)

Nico Navarro (Biomedical Engineer)
```

---

## Territory Model Alignment

Personas are aligned to the **Midwest** branch of the **LSC Territory Model** (`LSCTerritoryModel`). The MedTech branch uses a three-level hierarchy: Regional Director → District Manager → Territory Manager. All user and account assignments are at the Midwest leaf (TM) level. For full territory details including all 4 regions, see [MedTech Territory Model](../managing-medtech-territories/SKILL.md).

### Hierarchy

```
RD - MedTech - Midwest 20A                                    (Regional Director → Morgan Medina)
  └── DM - MedTech - Minneapolis 20A01                        (District Manager)
        └── TM - MedTech - SPC - Minneapolis North 20A01T01   (Territory Manager → Carmen Central, Sasha Sato)
```

### Territory Naming Convention

- **Prefix** = level: `RD` (Regional Director), `DM` (District Manager), `TM` (Territory Manager)
- **MedTech / MT** = sub-vertical
- **SPC** = Specialty Care product line (TM level only)
- **Trailing code** = region + district + territory number (e.g. `20A01T01`)
- **Territory2Type** = Geographical (all levels)

### User Assignments (Midwest TM leaf — `LS.MT.Territory2.006`)

| User | External_ID__c | Role in Territory | Profile | User Role |
|------|----------------|-------------------|---------|-----------|
| Carmen Central | `LSDO.User.010` | Account Executive | LS MT Field Sales Representative | MT MedTech Territory Manager |
| Sasha Sato | `LSDO.User.013` | Account Executive | Standard User | MT MedTech Territory Manager |
| Larry Davis | `User.001` | Solution Engineer | System Administrator | CEO |
| Admin2 User | `LSDO.User.002` | Account Partner | System Administrator | CEO |
| Admin4 User | `LSDO.User.004` | Account Partner | System Administrator | CEO |

Morgan Medina (`LSDO.User.014`) is assigned at the **Midwest RD** (`LS.MT.Territory2.004`) with role Manager and UserRole MT MedTech Regional Director.

### Account Alignments (Midwest TM leaf territory — `LS.MT.Territory2.006`)

All accounts are aligned at the Midwest TM leaf territory. Accounts prefixed `LS.MT.Account.*` are MedTech-specific golden records; `LS.Account.*` are shared across sub-verticals.

| Account | External_ID__c |
|---------|----------------|
| United Hospital | `LS.MT.Account.001` |
| Allina Health IDN | `LS.MT.Account.002` |
| Vizient GPO | `LS.MT.Account.003` |
| Acme Healthcare | `LS.Account.2` |
| Brigham City Community Health System | `LS.Account.75` |
| Brigham City Community Hospital | `LS.Account.66` |
| Santa Clarita Hospital | `LS.Account.71` |
| Rachel Shell | `LS.Account.17` |

### ProviderAcctTerritoryInfo (PATI)

PATI records link accounts to territories with recommended presentation content.

| Account | External_ID__c (PATI) | Recommended Presentations |
|---------|----------------------|---------------------------|
| United Hospital | `LS.MT.ProvAcctTerrInfo.001` | Aurora In-Service, Introduction to Immunexis, A Head to Head Study |
| Rachel Shell | `LS.MT.ProvAcctTerrInfo.005` | Aurora In-Service, A Head to Head Study, Agentforce Video |
| Brigham City Community Hospital | `LS.MT.ProvAcctTerrInfo.002` | Aurora In-Service |
| Santa Clarita Hospital | `LS.MT.ProvAcctTerrInfo.003` | Aurora In-Service |
| Ashok Kumar | `LS.MT.ProvAcctTerrInfo.004` | Aurora In-Service |
| Brigham City Community Health System | `LS.MT.ProvAcctTerrInfo.006` | Aurora In-Service |
| Acme Healthcare | `LS.MT.ProvAcctTerrInfo.007` | Aurora In-Service |

---

## Persona–Feature Matrix

Quick reference for matching personas to Salesforce demo features.

| Persona | Sales Cloud | Service Cloud | Field Service | CPQ | Experience Cloud | Commerce | Marketing | Analytics |
|---------|:-----------:|:------------:|:------------:|:---:|:---------------:|:--------:|:---------:|:---------:|
| Carmen Central | **Primary** | | | Yes | | | | Yes |
| Sasha Sato | Yes | | | | Yes | | | |
| Morgan Medina | Yes | | | Approver | | | | **Primary** |
| Ezra Executive | Yes | | | | | | | **Primary** |
| Lennox Liu | | | | | | | **Primary** | Yes |
| Casey Quinn | | **Primary** | | | | | | |
| Jim Riley | | **Primary** | | | | | | Yes |
| Jordan Kim | | | **Primary** | | | | | |
| Alex River | | | **Primary** | | | | | |
| Rachel Shell | | | | | **Primary** | | | |
| Kai Kowalski | | | | | | **Primary** | | |
| Kimberly Spark | | | | **Primary** | Yes | Yes | | |
| Tobin Tanaka | | | | Approver | | | | Yes |
| Nico Navarro | | | Yes | | Yes | | | |

---

## Persona Pairing Guide

Common persona pairings for demo scenarios.

| Scenario Type | Makana Persona | Customer Persona | Key Interaction |
|--------------|---------------|-----------------|-----------------|
| New capital sale | Carmen Central | Kimberly Spark + Rachel Shell | Carmen pitches Aurora; Rachel evaluates clinically; Kimberly negotiates price |
| Competitive displacement | Carmen Central + Sasha Sato | Rachel Shell | Sasha demonstrates Aurora advantages over [Fjord](makana-medtech-competitor-konkurrent.md#Fjord%20Surgical%20Robot) in clinical setting |
| Consumable reorder | Carmen Central | Kai Kowalski | Kai reorders Aurora instruments; Carmen manages relationship |
| Equipment service | Jordan Kim | Nico Navarro | Jordan performs Aurora maintenance; Nico manages equipment records |
| Service case | Casey Quinn | Kai Kowalski or Nico Navarro | Hospital contacts service center about product issue |
| Capital approval | Carmen Central + Morgan Medina | Tobin Tanaka + Kimberly Spark | Large deal requires CFO approval and pricing exception from Regional Director |
| Forecast review | Ezra Executive + Morgan Medina | — | Internal: Morgan presents regional forecast to Ezra |
| Marketing campaign | Lennox Liu | Rachel Shell | Lennox targets KOL surgeons with clinical content |

---

## Org User Configuration (NOICE)

Live configuration of known users provisioned in the NOICE org. Only Carmen Central uses the custom `LS MT Field Sales Representative` profile; the other three users are System Administrators who use admin-level access for demo setup and Login-As workflows.

### Carmen Central — `LSDO.User.010`

| Field | Value |
|-------|-------|
| Username | `carmen.central@trailsignup-372b45ad8abcf3.com` |
| Alias | `carcent` |
| Profile | **LS MT Field Sales Representative** |
| User Role | (none) |
| Title | Field Sales Rep |
| Department | Sales |
| Division | Cardiovascular |
| IsActive | true |

**Permission Sets (non-profile):**

| Label | API Name | Category |
|-------|----------|----------|
| LSDO MedTech Field Sales PSG | `LSDO_MedTech_Field_Sales_PSG` | PSG — primary MedTech sales group |
| LSDO - MedTech Field Sales Rep | `LSDO_MedTech_Field_Sales_Rep_pset` | MedTech field sales field-level permissions |
| LSDO - MedTech Field Sales Rep Agent | `LSDO_MedTech_Field_Sales_Rep_Agent` | Agentforce access for MedTech sales |
| LSDO-All Life Science Commercial Users | `LSDO_All_Life_Science_Commercial_Users` | Cross-vertical LSC commercial base |
| Life Sciences Core | `LifeSciencesCore` | Life Sciences Cloud platform objects |
| MedTech NOICE | `MedTech_NOICE` | NOICE-specific MedTech customizations |
| Flow Agentforce Chat Access | `Flow_Agentforce_Chat_Access` | Agentforce chat flow access |
| Sales - Base Brix Access | `xDO_Sales_Base_Access` | SDO Sales base permissions |

Carmen's permission stack is intentionally lean — only the LSDO MedTech-specific sets plus base Sales and Life Sciences Core access. This makes Carmen the realistic field rep persona for demos, showing what an actual sales user would see (not admin-level access).

### Larry Davis — `User.001`

| Field | Value |
|-------|-------|
| Username | `trailsignup.372b45ad8abcf3@salesforce.com` |
| Alias | `admin` |
| Profile | **System Administrator** |
| User Role | CEO |
| IsActive | true |

**Permission Sets (non-profile, LSDO/MedTech-relevant only):**

| Label | API Name |
|-------|----------|
| LSDO MedTech Field Sales PSG | `LSDO_MedTech_Field_Sales_PSG` |
| LSDO - MedTech Field Sales Rep | `LSDO_MedTech_Field_Sales_Rep_pset` |
| LSDO-All Life Science Commercial Users | `LSDO_All_Life_Science_Commercial_Users` |
| LSDO-Life Sciences Commercial Admin | `LSDO_Life_Sciences_Commercial_Admin` |
| LSDO-PH Field Sales Rep Agent | `LSDO_PH_Field_Sales_Rep_Agent` |
| LSDO-PH KAM Agent | `LSDO_PH_KAM_Agent` |
| LSDO-PH-Care Manager_PSG | `LSDO_PH_Care_Manager_PSG` |
| LSDO-PH-Field Reimb Mgt Agent | `LSDO_PH_Field_Reimb_Mgt_Agent` |
| LSDO-PH-MSL Agent | `LSDO_PH_MSL_Agent` |
| Life Sciences Core | `LifeSciencesCore` |
| MedTech NOICE | `MedTech_NOICE` |
| Flow Agentforce Chat Access | `Flow_Agentforce_Chat_Access` |
| Sales Account Plans | `Sales_Account_Plans` |

**Additional SDO/platform permission sets** (90+ total): Full admin-level SDO stack including Sales, Service, Field Service, CPQ, Maps, Analytics, Marketing Cloud, Pardot, Commerce, Scheduler, Community, Data Cloud, Tableau, Enablement, Slack, and all SDO tooling permission sets.

### Admin2 User — `LSDO.User.002`

| Field | Value |
|-------|-------|
| Username | `admin2.osauuchaau06@salesforce.com` |
| Alias | `jthur` |
| Profile | **System Administrator** |
| User Role | CEO |
| IsActive | true |

**Permission Sets (non-profile, LSDO-relevant only):**

| Label | API Name |
|-------|----------|
| LSDO Admin PSG | `LSDO_Admin_PSG` |
| LSDO-All Life Science Commercial Users | `LSDO_All_Life_Science_Commercial_Users` |
| LSDO-PH Field Sales Rep Agent | `LSDO_PH_Field_Sales_Rep_Agent` |
| LSDO-PH KAM Agent | `LSDO_PH_KAM_Agent` |
| LSDO-PH-Care Manager_PSG | `LSDO_PH_Care_Manager_PSG` |
| LSDO-PH-Field Reimb Mgt Agent | `LSDO_PH_Field_Reimb_Mgt_Agent` |
| LSDO-PH-MSL Agent | `LSDO_PH_MSL_Agent` |
| Life Sciences Core | `LifeSciencesCore` |

**Additional SDO/platform permission sets** (85+ total): Full admin-level SDO stack (same categories as Larry Davis, minus a few MedTech-specific and Data Cloud sets).

### Admin4 User — `LSDO.User.004`

| Field | Value |
|-------|-------|
| Username | `admin4.mppl2z8ypfne@salesforce.com` |
| Alias | `admin4` |
| Profile | **System Administrator** |
| User Role | CEO |
| IsActive | true |

**Permission Sets (non-profile, LSDO/MedTech-relevant only):**

| Label | API Name |
|-------|----------|
| LSDO Admin PSG | `LSDO_Admin_PSG` |
| LSDO MedTech Field Sales PSG | `LSDO_MedTech_Field_Sales_PSG` |
| LSDO - MedTech Field Sales Rep | `LSDO_MedTech_Field_Sales_Rep_pset` |
| LSDO - MedTech Field Sales Rep Agent | `LSDO_MedTech_Field_Sales_Rep_Agent` |
| LSDO - Pharma District Manager | `LSDO_Pharma_District_Manager` |
| LSDO-All Life Science Commercial Users | `LSDO_All_Life_Science_Commercial_Users` |
| LSDO-Life Sciences Commercial Admin | `LSDO_Life_Sciences_Commercial_Admin` |
| LSDO-Life Sciences Field Medical | `LSDO_Life_Sciences_Field_Medical` |
| LSDO-Life Sciences Key Account Mgt | `LSDO_Life_Sciences_Key_Account_Mgt` |
| LSDO-PH Field Sales Rep | `LSDO_PH_Field_Sales_Rep` |
| LSDO-PH Field Sales Rep Agent | `LSDO_PH_Field_Sales_Rep_Agent` |
| LSDO-PH KAM Agent | `LSDO_PH_KAM_Agent` |
| LSDO-PH-Care Manager_PSG | `LSDO_PH_Care_Manager_PSG` |
| LSDO-PH-Field Reimb Mgt Agent | `LSDO_PH_Field_Reimb_Mgt_Agent` |
| LSDO-PH-MSL Agent | `LSDO_PH_MSL_Agent` |
| LSDO-Post Spin DemoXRef | `LSDO_Post_Spin_DemoXRef` |
| LSDO-Tableau Next Additional Permissions | `LSDO_Tableau_Next_Additional_Permissions` |
| Life Sciences Core | `LifeSciencesCore` |

**Additional SDO/platform permission sets** (85+ total): Full admin-level SDO stack (same categories as Admin2).

Admin4 has the broadest LSDO permission set coverage of the admin users — it includes both MedTech-specific sets (`LSDO_MedTech_Field_Sales_PSG`, `LSDO_MedTech_Field_Sales_Rep_pset`, `LSDO_MedTech_Field_Sales_Rep_Agent`) and Pharma-specific sets (`LSDO_Pharma_District_Manager`, `LSDO_PH_Field_Sales_Rep`, `LSDO_Life_Sciences_Field_Medical`, `LSDO_Life_Sciences_Key_Account_Mgt`), making it the best admin user for cross-vertical testing.

### Key Permission Set Groups (PSGs)

| PSG Label | API Name | Assigned To |
|-----------|----------|-------------|
| LSDO MedTech Field Sales PSG | `LSDO_MedTech_Field_Sales_PSG` | Carmen Central, Larry Davis, Admin4 |
| LSDO Admin PSG | `LSDO_Admin_PSG` | Admin2, Admin4 |
| LSDO-PH-Care Manager_PSG | `LSDO_PH_Care_Manager_PSG` | Larry Davis, Admin2, Admin4 |

### Profile Summary

| Profile | Users | License | Description |
|---------|-------|---------|-------------|
| LS MT Field Sales Representative | Carmen Central | Salesforce | Custom profile (ISS) for MedTech field reps — limited to sales-relevant objects, Visit record types for MedTech Clinical Case / MT Visit / PH MSL Visit / PH Visit |
| System Administrator | Larry Davis, Admin2, Admin4 | Salesforce | Full admin access with CEO user role — used for demo setup, Login-As, and cross-persona testing |
