# orgs/

Per-org, per-customer working directory for LSDO Build Template sessions.

## Convention

```
orgs/[alias]-[customer]/
├── audit-YYYY-MM-DD-HHmm.md      # Org audit snapshot
├── demo-spec-YYYY-MM-DD-HHmm.md  # Deployment spec from /scout-sparring
├── changes-YYYY-MM-DD-HHmm.md    # Change log from /scout-building
├── readiness-YYYY-MM-DD.md        # Output from /lsdo-readiness
└── *.sh                           # Reusable data-seeding scripts
```

- **alias** = Salesforce org alias from `sf config get target-org`
- **customer** = lowercase-hyphenated customer/project name (e.g., `makana-medtech`, `acme-devices`)

## Lessons Files

- `sparring-lessons.md` — mistakes from previous sparring sessions (read by `/scout-sparring`)
- `building-lessons.md` — mistakes from previous building sessions (read by `/scout-building`)

These accumulate over time. Do not delete entries — they prevent repeat mistakes.

## Gitignore

Customer-specific data (audits, specs, change logs) is gitignored by default.
The template files (`README.md`, `sparring-lessons.md`, `building-lessons.md`) are committed.
