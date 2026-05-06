# LSDO Migration Documentation

When a user asks for migration documentation, a migration checklist, or "the LSDO docs" for a demo build, produce a filled-in markdown document using the format below.

**Pre-populate every field you can** from context — the build conversation, the cinematic universe golden records, the CCI flow, the Apex scripts, the permission sets, the org personas. Do not leave rows blank if the information is available. For rows you cannot answer, use `TBD — [what is needed]` so the builder knows exactly what to follow up on.

**"Configuration to Migrate"** — list one row per metadata item actually created or modified in this build. Remove rows for types that were not used (e.g. if no Flex Cards were created, remove that row). Add rows if you created something not listed.

**"Data to Migrate"** — list one row per sObject that has demo data loaded via SFDMU or Apex. Include the External ID pattern and point to the relevant CSV or Apex script.

---

## Demo Overview

| Question | Answer |
| -------- | ------ |
| Link to Key Demo Script(s) | |
| Demo Builders (who can answer questions) | |
| Link to Build Document(s) | |
| Demo org login / Admin / Key demo personas | |
| Date demo environment was created | |
| Date build was started | |
| Were any licenses added or changed via BlackTab? If yes, list them | |
| Does the demo reference Data Cloud? | |
| Were any SDO data, metadata (fields, agents, agent topics, permission sets, flows, classes, etc.) re-used or re-purposed? | |
| Were any SDO logins or personas re-used? | |
| Are there any hardcoded elements — row IDs, specific records, specific personas/users — in Agent Topics, Flows, etc.? List them | |
| Were any demo utilities created (e.g. Demo Reset)? | |
| Does the demo have any API integrations? | |
| Does the demo have any Agents and/or new Agent Topics/Skills? | |

---

## Configuration to Migrate

| Configuration / Metadata Type | Name / API Name |
| ----------------------------- | --------------- |
| Object | |
| Field | |
| Page Layout | |
| Lightning Application | |
| Lightning Page | |
| Record Type | |
| Button / Action | |
| Profile | |
| Permission Set | |
| Permission Set Group | |
| Flow | |
| LSC4CE Admin Console Settings | |
| Apex Class | |
| Agent | |
| Agent Topic | |
| Agent Action | |
| Prompt Template | |
| Flex Card* | |
| Data Mapper* | |
| OmniScript* | |
| Sharing Rule | |

*OmniStudio components — include only if used.

---

## Data to Migrate

| Object | New Data or Modified? | External IDs / How to identify the data | Person to contact with questions | Additional notes |
| ------ | --------------------- | --------------------------------------- | -------------------------------- | ---------------- |

---
