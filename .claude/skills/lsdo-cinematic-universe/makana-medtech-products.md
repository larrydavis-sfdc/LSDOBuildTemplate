---
aliases:
  - Makana MedTech Products
  - MedTech Product Catalog
  - Makana Products
  - Aurora
  - Aurora Surgical Robot
  - Nimbus IVL
  - PTA Balloon Catheters
  - Makana Sense Monitor
tags:
  - lsdo
  - lsdo/cinematic-universe
  - lsdo/medtech
  - lsdo/products
---
# Makana MedTech Product Catalog

Part of the [Makana MedTech Cinematic Universe](makana-medtech-cinematic-universe.md).

Product catalog for [Makana](makana-life-sciences.md) MedTech demos. All products use the `Product2` object with External IDs following [LSDO](skills/building-lsdo/SKILL.md) conventions (`LS.MT.Product2.###`). When creating demo data, orders, or commerce scenarios, reference these products by External ID — never by Salesforce Id. For competitor products, see [Konkurrent Medical](makana-medtech-competitor-konkurrent.md). For demo personas who sell and buy these products, see [Makana MedTech Personas](makana-medtech-personas.md).

## Product Family Overview

| Product Family | Category | Sales Model | Record Types Used |
|---------------|----------|-------------|-------------------|
| Aurora Surgical Robot | Capital equipment + instruments + service | System configured via CPQ; instruments ordered separately | LSDO MedTech Order, LS Sample |
| Nimbus IVL | Capital equipment + consumable catheters | Generator is capital; catheters are single-use consumables | LSDO MedTech Order |
| Stratus PTA Balloon Catheters | Single-use interventional | Consumable, ordered by size configuration | LSDO MedTech Order |
| Cyclone PTA Balloon Catheters | Single-use interventional | Consumable, ordered by size configuration | LSDO MedTech Order |
| Peripheral Vascular Accessories | Single-use interventional | Consumable, ordered alongside catheters | LSDO MedTech Order |
| Diabetes / DME | Durable medical equipment | DME channel; Makana Sense Monitor also used in Commerce | LSDO MedTech Order |
| Renal | Capital equipment | Legacy CPQ — retain for legacy CPQ demos; evaluate for new CPQ | LSDO MedTech Order |
| Marketing Materials | Non-saleable | Not sold; used in marketing demos | LS Marketing Item |

---

## Aurora Surgical Robot

Makana's AI-powered robotic surgical platform for minimally invasive procedures. Aurora differentiates on integrated AI-assisted planning, real-time intraoperative guidance overlays, and a physician analytics ecosystem (Aurora Halo) — making it the most technologically advanced platform in its class. Sold as a configured capital system (console + tower + cart + port model), with single-use and multi-use instruments ordered separately. Includes annual maintenance contracts. Competes with [Konkurrent's Fjord Surgical Robot](makana-medtech-competitor-konkurrent.md#Fjord%20Surgical%20Robot).

Key personas: [Carmen Central](makana-medtech-personas.md#Carmen%20Central%20—%20MedTech%20Sales%20Rep) (sells), [Sasha Sato](makana-medtech-personas.md#Sasha%20Sato%20—%20MedTech%20Clinical%20Specialist) (clinical support), [Rachel Shell](makana-medtech-personas.md#Rachel%20Shell%20—%20Cardiothoracic%20Surgeon) (uses), [Jordan Kim](makana-medtech-personas.md#Jordan%20Kim%20—%20Field%20Service%20Technician) (services), [Kai Kowalski](makana-medtech-personas.md#Kai%20Kowalski%20—%20OR%20Nurse%20Manager) (manages instruments).

### System Components (Capital — configured together)

| External_Id__c | Name | ProductCode | SKU | RecordType |
|---------------|------|-------------|-----|------------|
| LS.MT.Product2.024 | Aurora Surgical Robot System | AUR781304952617 | 781304952617 | LSDO MedTech Order |
| LS.MT.Product2.025 | Aurora Surgeon Console | AUR892415063728 | 892415063728 | LSDO MedTech Order |
| LS.MT.Product2.026 | Aurora 3D Tower | AUR903526174839 | 903526174839 | LSDO MedTech Order |
| LS.MT.Product2.027 | Aurora Patient Cart | AUR014637285940 | 14637285940 | LSDO MedTech Order |
| LS.MT.Product2.029 | Aurora Single Port | AUR236859408162 | 236859408162 | LSDO MedTech Order |
| LS.MT.Product2.030 | Aurora Multiport | AUR347960519273 | 347960519273 | LSDO MedTech Order |
| LS.MT.Product2.028 | Aurora Maintenance Annual | AUR125748397051 | 125748397051 | LSDO MedTech Order |

**System configuration:** A complete Aurora system includes the Robot System, Surgeon Console, 3D Tower, Patient Cart, and one port model (Single Port or Multiport). Maintenance Annual is sold as a recurring service contract.

**Port models:** Single Port enables multiple instruments through one small incision. Multiport allows independent instrument positioning through separate ports.

### Instruments

| External_Id__c | Name | ProductCode | SKU | RecordType | Use Type |
|---------------|------|-------------|-----|------------|----------|
| LS.MT.Product2.031 | Aurora Forceps - single use | AUR458071630384 | 458071630384 | LS Sample | Single-use |
| LS.MT.Product2.032 | Aurora Stapler - single use | AUR569182741495 | 569182741495 | LSDO MedTech Order | Single-use |
| LS.MT.Product2.033 | Aurora Scissors - multi-use | AUR670293852506 | 670293852506 | LS Sample | Multi-use |
| LS.MT.Product2.034 | Aurora Needle Driver - multi-use | AUR781304963617 | 781304963617 | LSDO MedTech Order | Multi-use |
| LS.MT.Product2.035 | Aurora Camera - multi-use | AUR892415074728 | 892415074728 | LSDO MedTech Order | Multi-use |

**Instrument descriptions:**
- **Forceps** — Sterile disposable grasping instrument with AI-guided tension feedback for precise tissue manipulation
- **Stapler** — Disposable robotic stapling device with AI-recommended staple height selection for optimal tissue closure
- **Scissors** — Reusable precision cutting instrument with articulating tips and AI-assisted dissection guidance
- **Needle Driver** — Reusable robotic needle holder with AI suture tension monitoring for consistent, reliable closure
- **Camera** — High-resolution endoscopic camera with AI-powered tissue classification and real-time anatomical overlay

### Accessories

| External_Id__c | Name | ProductCode | SKU | RecordType |
|---------------|------|-------------|-----|------------|
| LS.MT.Product2.036 | Aurora Sterilization Tray | AUR903526185839 | 903526185839 | LSDO MedTech Order |

Specialized instrument tray for safe sterilization and storage of reusable Aurora components.

### Portal

**Aurora Halo** — Makana's AI-powered physician experience portal. Provides pre-operative procedure planning recommendations, real-time intraoperative guidance overlays, post-operative outcome analytics, and physician-specific benchmarking against anonymized peer data. Rachel Shell uses Aurora Halo to review procedure analytics and access clinical evidence. Competes with [Fjord Insight](makana-medtech-competitor-konkurrent.md#Portal).

### Marketing

| External_Id__c | Name | RecordType |
|---------------|------|------------|
| LS.MT.Product2.040 | Aurora Marketing Brochure | LS Marketing Item |

Marketing brochure with the latest clinical data. Non-saleable; used in marketing and content demos. Distributed by [Lennox Liu](makana-medtech-personas.md#Lennox%20Liu%20—%20Marketing%20Manager).

---

## Nimbus IVL (Intravascular Lithotripsy)

Intravascular lithotripsy (IVL) is a minimally invasive procedure that uses acoustic pressure waves to break up calcium deposits in arteries, particularly coronary and peripheral arteries. This allows easier expansion of stents and other angioplasty devices. The Nimbus system consists of a capital generator and single-use catheters. Competes with [Konkurrent's Strøm IVL System](makana-medtech-competitor-konkurrent.md#Strøm%20IVL%20System).

| External_Id__c | Name | ProductCode | SKU | RecordType | Type |
|---------------|------|-------------|-----|------------|------|
| LS.MT.Product2.037 | Nimbus IVL Generator | NIM014637296940 | 14637296940 | LSDO MedTech Order | Capital |
| LS.MT.Product2.038 | Nimbus Sprite IVL Catheter | NIM125748307051 | 125748307051 | LSDO MedTech Order | Single-use |
| LS.MT.Product2.039 | Nimbus Slipstream IVL Catheter | NIM236859418162 | 236859418162 | LSDO MedTech Order | Single-use |

- **Generator** — Console generating controlled acoustic pulses for intravascular calcium disruption and plaque modification
- **Sprite** — Compact catheter with integrated lithotripsy emitters for calcified lesions in smaller vessels
- **Slipstream** — High-performance catheter for rapid crossing and efficient calcium fracturing in complex coronary lesions

---

## PTA Balloon Catheters

PTA (percutaneous transluminal angioplasty) balloon catheters open narrowed or blocked peripheral arteries. A flexible catheter with an inflatable balloon at the tip expands to restore blood flow. Used in minimally invasive procedures for peripheral artery disease (PAD). CMS C-Code: **C1725** (Catheter, transluminal angioplasty, non-laser). Competes with [Konkurrent's Vann PTA Balloon Catheters](makana-medtech-competitor-konkurrent.md#Vann%20PTA%20Balloon%20Catheters).

Makana offers two product lines: **Stratus** (standard) and **Cyclone** (advanced). Both come in multiple size configurations.

### Size Convention

Product names follow the pattern: `[Brand] PTA Balloon Catheter [French] x [Balloon Length mm] x [Catheter Length cm]`

Available configurations: 6 French across balloon lengths 40, 60, 80, 100 mm and catheter lengths 40, 75, 135 cm.

### Stratus PTA Balloon Catheters

ProductCode prefix: `PTA`

| External_Id__c | Size (Fr x Balloon x Catheter) | ProductCode | SKU |
|---------------|-------------------------------|-------------|-----|
| LS.MT.Product2.001 | 6 x 40 x 40 | PTA391710602401 | 391710602401 |
| LS.MT.Product2.002 | 6 x 40 x 75 | PTA391710602702 | 391710602702 |
| LS.MT.Product2.003 | 6 x 40 x 135 | PTA391710602103 | 391710602103 |
| LS.MT.Product2.004 | 6 x 60 x 40 | PTA391710606404 | 391710606404 |
| LS.MT.Product2.005 | 6 x 60 x 75 | PTA391710606705 | 391710606705 |
| LS.MT.Product2.006 | 6 x 60 x 135 | PTA391710606106 | 391710606106 |
| LS.MT.Product2.007 | 6 x 80 x 40 | PTA391710608407 | 391710608407 |
| LS.MT.Product2.008 | 6 x 80 x 75 | PTA391710608708 | 391710608708 |
| LS.MT.Product2.009 | 6 x 80 x 135 | PTA391710608109 | 391710608109 |
| LS.MT.Product2.010 | 6 x 100 x 40 | PTA391710610410 | 391710610410 |
| LS.MT.Product2.011 | 6 x 100 x 75 | PTA391710610711 | 391710610711 |
| LS.MT.Product2.012 | 6 x 100 x 135 | PTA391710610112 | 391710610112 |

All Stratus products use RecordType: **LSDO MedTech Order**

### Cyclone PTA Balloon Catheters

ProductCode prefix: `BAL`

| External_Id__c | Size (Fr x Balloon x Catheter) | ProductCode | SKU |
|---------------|-------------------------------|-------------|-----|
| LS.MT.Product2.013 | 6 x 40 x 75 | BAL391710602413 | 391710602413 |
| LS.MT.Product2.014 | 6 x 40 x 135 | BAL391710602714 | 391710602714 |
| LS.MT.Product2.015 | 6 x 60 x 75 | BAL391710602115 | 391710602115 |
| LS.MT.Product2.016 | 6 x 60 x 135 | BAL391710612416 | 391710612416 |
| LS.MT.Product2.017 | 6 x 80 x 75 | BAL391710612717 | 391710612717 |
| LS.MT.Product2.018 | 6 x 80 x 135 | BAL391710612118 | 391710612118 |
| LS.MT.Product2.019 | 6 x 100 x 75 | BAL392060602719 | 392060602719 |
| LS.MT.Product2.020 | 6 x 100 x 135 | BAL392060602120 | 392060602120 |

All Cyclone products use RecordType: **LSDO MedTech Order**

---

## Peripheral Vascular Accessories

Single-use accessories used alongside PTA balloon catheters during interventional procedures. Competes with [Konkurrent's Bølge accessories](makana-medtech-competitor-konkurrent.md#Bølge%20Guidewires%20and%20Accessories).

| External_Id__c | Name | ProductCode | SKU | RecordType | CMS C-Code |
|---------------|------|-------------|-----|------------|------------|
| LS.MT.Product2.021 | Introducer Sheath 7 French by 11cm | MAK115714100021 | 115714100021 | LSDO MedTech Order | C1894 |
| LS.MT.Product2.022 | Straight Guidewire 0.035mm by 145cm | MAK146517200022 | 146517200022 | LSDO MedTech Order | C1769 |
| LS.MT.Product2.023 | J-Tip Guidewire 0.035mm by 180cm | MAK146501200023 | 146501200023 | LSDO MedTech Order | C1769 |

- **Introducer Sheath** — Provides stable vessel access point with hemostatic valve to minimize blood loss during catheter insertion (C1894: Introducer/sheath, other than guiding)
- **Guidewires** — Flexible thin wires for navigating blood vessels and guiding catheter placement. J-Tip has a curved tip for atraumatic vessel navigation; Straight is for direct access (C1769: Guidewire)

---

## Diabetes / DME (Durable Medical Equipment)

> **Note:** The Makana Sense Monitor is also used in Commerce demos.

These products do not yet have External IDs or ProductCodes assigned in the catalog. When creating demo data for these products, generate External IDs following the `LS.MT.Product2.###` pattern and assign appropriate ProductCodes.

| Product | Description |
|---------|-------------|
| Makana Sense Monitor | Blood glucose monitor — also used in B2B/B2C Commerce demos |
| Insulin Pump | Insulin delivery device for diabetes management |
| Glucose Monitor | Continuous glucose monitoring system |
| Synergy Pacemaker | Cardiac rhythm management device ecosystem |

---

## Renal

> **Note:** Retain for legacy CPQ demos. Evaluate whether to include in new CPQ configurations.

| Product | Description |
|---------|-------------|
| Renal Dialysis Device X100 | Renal dialysis capital equipment with related devices — used in CPQ configuration demos |

---

## Typical Demo Procedure Kits

When building demos for interventional procedures, these products are commonly ordered together with a heavy focus on the Aurora Surgical Robot line of products:

**PTA Procedure (peripheral vascular intervention):**
- 1x Introducer Sheath
- 1x Guidewire (J-Tip or Straight)
- 1x PTA Balloon Catheter (Stratus or Cyclone, size per vessel)

**IVL Procedure (calcified lesion treatment):**
- 1x Nimbus IVL Generator (capital, one-time or already installed)
- 1x Nimbus Catheter (Sprite for smaller vessels, Slipstream for complex coronary)
- 1x Introducer Sheath
- 1x Guidewire

**Aurora Robotic Surgery:**
- 1x Aurora System (configured: Robot System + Console + 3D Tower + Patient Cart + Port Model)
- Aurora instruments per procedure (Forceps, Stapler, Scissors, Needle Driver, Camera as needed)
- 1x Aurora Sterilization Tray (for reusable instruments)
- Aurora Maintenance Annual (service contract)
