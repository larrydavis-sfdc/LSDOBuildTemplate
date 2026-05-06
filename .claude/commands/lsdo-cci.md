---
name: lsdo-cci
description: >
  Generate CumulusCI configuration and package the project for CCI-based deployment.
  Scans metadata, data, and scripts to produce a complete cumulusci.yml.
model: sonnet
allowed-tools: Bash, Read, Write, Edit, Glob, Grep
---

# LSDO CCI — Generate CumulusCI Configuration

Generate a `cumulusci.yml` that packages everything in this project for CumulusCI deployment.
Load `.claude/skills/using-cumulusci/SKILL.md` for correct syntax and task references.

## Step 1: Scan Project

Inventory what exists:

```bash
# Metadata in force-app/
find force-app -type f -name "*.xml" | sed 's|.*/default/||' | cut -d/ -f1 | sort -u

# SFDMU data packages
ls datasets/sfdmu/*.csv 2>/dev/null
ls datasets/sfdmu/export.json 2>/dev/null

# Apex scripts (unpackaged)
find unpackaged -name "*.apex" 2>/dev/null

# Existing cumulusci.yml
ls cumulusci.yml 2>/dev/null
```

Report findings to user before generating.

## Step 2: Determine Flow Structure

Based on what's present, determine the deployment flow:

**Metadata-only project:**
```yaml
flows:
  deploy_lsdo:
    steps:
      1:
        task: deploy
        options:
          path: force-app
```

**Metadata + Data:**
```yaml
flows:
  deploy_lsdo:
    steps:
      1:
        task: deploy
        options:
          path: force-app
      2:
        task: run_sfdmu_load
```

**Full Cinematic Universe (metadata + data + Apex scripts):**
```yaml
flows:
  deploy_lsdo:
    steps:
      1:
        task: deploy
        options:
          path: force-app
      2:
        task: run_sfdmu_load
      3:
        task: run_apex_scripts
```

## Step 3: Generate cumulusci.yml

```yaml
minimum_cumulusci_version: "3.98.0"

project:
  name: [from sfdx-project.json name field]
  package:
    name: [project name]
    api_version: "[from sfdx-project.json sourceApiVersion]"
  source_format: sfdx

sources:
  lsdo_build_template:
    github: https://github.com/[org]/[repo]

tasks:
  # SFDMU data load (if datasets/sfdmu/ exists)
  run_sfdmu_load:
    class_path: cumulusci.tasks.command.Command
    description: Load demo data via SFDMU
    options:
      command: "sf sfdmu run --sourceusername csvfile --targetusername {org_config.access_token} --path datasets/sfdmu --canmodify true"

  # SFDMU data extract (if datasets/sfdmu/ exists)
  extract_data:
    class_path: cumulusci.tasks.command.Command
    description: Extract demo data from org to CSV
    options:
      command: "sf sfdmu run --sourceusername {org_config.access_token} --targetusername csvfile --path datasets/sfdmu"

  # Apex script execution (if unpackaged/*.apex exists)
  run_apex_scripts:
    class_path: cumulusci.tasks.apex.anon.AnonymousApexTask
    description: Run post-deployment Apex scripts
    options:
      path: unpackaged/config

flows:
  deploy_lsdo:
    description: Deploy all LSDO metadata and data
    steps:
      [generated based on scan]

  deploy_lsdo_data_only:
    description: Deploy data only (skip metadata)
    steps:
      [data steps only]
```

## Step 4: Validate

- Check YAML syntax: `python3 -c "import yaml; yaml.safe_load(open('cumulusci.yml'))"`
- Verify referenced paths exist
- Check task class_paths are valid CumulusCI classes

## Step 5: Report

```
✅ Generated cumulusci.yml

Flows created:
  - deploy_lsdo: [step count] steps (metadata → data → scripts)
  - deploy_lsdo_data_only: [step count] steps (data only)
  - extract_data: Extract from org to CSV

To deploy:
  cci org import [alias] [alias]
  cci flow run deploy_lsdo --org [alias]

To extract data:
  cci task run extract_data --org [alias]
```

## Step 6: Offer Enhancements

Ask user if they want:
- Scratch org definition flow (`dev_org` with dependencies)
- CI/CD flow (for GitHub Actions)
- Package flow (for 2GP packaging)
