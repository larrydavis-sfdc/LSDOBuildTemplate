---
name: using-cumulusci
description: "ALWAYS READ THIS SKILL before answering any CumulusCI or cci question — it contains verified task names, flow definitions, YAML syntax, and mapping file formats that differ from what you may recall from training data. Use for: cci commands, cumulusci.yml configuration, scratch org management (cci org), custom flows/tasks, dataset extract/load with mapping files, Snowfakery recipes, packaging workflows (1GP/2GP), MetaDeploy install plans, Robot Framework testing in CumulusCI, and GitHub Actions CI/CD with cumulus-actions. Even if you think you know CumulusCI well, consult this skill — it has the correct current syntax. Do NOT trigger for: plain sf CLI without cci, SFDMU (use migrating-sfdmu-data), or Salesforce dev without CumulusCI context."
metadata:
  version: 0.1.0
  last_updated: 2026-04-30
aliases:
  - cci
  - CumulusCI
tags:
  - salesforce
  - cumulusci
  - deployment
  - testing
  - ci-cd
---

# CumulusCI (cci)

CumulusCI is a command-line automation suite for Salesforce development. It orchestrates org setup, testing, deployment, packaging, and release management on top of Salesforce CLI (`sf`). Tasks are individual automation units; flows are ordered sequences of tasks.

> **Goal-Driven Execution:** For multi-step CumulusCI operations, state the flow steps and verification checkpoints (org auth → task → data load → Apex) before running anything. Confirm success at each checkpoint before proceeding.

## Reference Files

Detailed catalogs live in `references/`. Read the relevant file when you need specifics beyond what this SKILL.md covers.

| File | Contents |
|------|----------|
| [tasks-and-flows-catalog.md](references/tasks-and-flows-catalog.md) | All 70+ standard tasks and 30+ standard flows with descriptions and options |
| [data-operations.md](references/data-operations.md) | Dataset definitions, mapping files, extract/load, Snowfakery, bulk operations, custom settings |
| [packaging-and-releases.md](references/packaging-and-releases.md) | 1GP, 2GP, unlocked package workflows, push upgrades, release notes, dependencies |
| [cicd-and-environments.md](references/cicd-and-environments.md) | GitHub Actions, headless auth, environment variables, service registration |
| [robot-framework.md](references/robot-framework.md) | Robot Framework project structure, test syntax, keywords, browser configuration |

## Installation

```bash
# macOS
brew install pipx && pipx ensurepath && pipx install cumulusci

# Linux
pipx install cumulusci

# Windows (Python 3.9+ required)
python -m pip install --user pipx && python -m pipx ensurepath && pipx install cumulusci

# Verify
cci version
```

### Prerequisites
1. Salesforce CLI (`sf`) installed
2. Dev Hub enabled: `sf org login web --set-default-dev-hub --alias DevHub`
3. GitHub connected: `cci service connect github mygithub`

## Project Structure

```
project-root/
  cumulusci.yml          # Central configuration
  sfdx-project.json      # SFDX project definition
  force-app/             # Source (SFDX format)
  orgs/                  # Scratch org definitions (dev.json, beta.json, etc.)
  datasets/              # Data mapping files and CSVs
  robot/                 # Robot Framework test suites
  unpackaged/            # Non-packageable metadata
    pre/                 # Deployed BEFORE package install
    post/                # Deployed AFTER package install
    config/dev/          # Environment-specific configs
    config/qa/
  tasks/                 # Custom Python task files
```

Initialize: `cci project init` — prompts for name, namespace, API version, source format, branch prefixes, test patterns.

## Portability Rules

### No hardcoded Salesforce IDs

Salesforce record IDs (15- or 18-character strings like `001g8000007pWFaAAM`) are **org-specific** and meaningless in any other org. **Never hardcode them** in:
- `cumulusci.yml` task options or flow steps
- Apex scripts called by `AnonymousApexTask` or `Command` tasks
- SFDMU `export.json` queries or field mappings
- Shell scripts or Python scripts invoked during a flow

Always resolve IDs at runtime:
- **Apex**: `[SELECT Id FROM Account WHERE External_ID__c = 'LS.MT.Account.001' LIMIT 1].Id` — or collect via `Map<String, Id>` keyed on `External_ID__c`
- **SFDMU**: use relationship traversal (`Object.External_ID__c`) in queries and `externalId: "External_ID__c"` for upsert keys
- **Shell/Python**: use `sf data query` or REST API to look up IDs by stable keys; never hardcode

A deployment that works on the source org but fails on target because of hardcoded IDs is a broken deployment. Treat hardcoded IDs as bugs.

### No hardcoded org-specific metadata API names

App names, flexipage names, tab names, record type names, and profile names may differ between orgs. When referencing these in app metadata (`CustomApplication` XML), remove `profileActionOverrides`, `actionOverrides`, custom `tabs`, and `utilityBar` references that point to resources that may not exist in the target org — or make the deployment fault-tolerant by catching missing-resource errors at the flow level with `ignore_failure: true`.

## cumulusci.yml Configuration

Configuration merges across scopes (highest precedence first):
1. Local project: `~/.cumulusci/<project>/cumulusci.yml`
2. Project: `./cumulusci.yml`
3. Global: `~/.cumulusci/cumulusci.yml`
4. Universal: Built-in CumulusCI defaults

### Core Structure

```yaml
project:
    name: MyProject
    package:
        name: MyProject
        namespace: myns
        api_version: "61.0"
        install_class: InstallHandler
        uninstall_class: UninstallHandler
    git:
        default_branch: main
        prefix_feature: feature/
        prefix_beta: beta/
        prefix_release: release/
    source_format: sfdx
    test:
        name_match: "%_TEST%"
    dependencies:
        - github: https://github.com/SalesforceFoundation/NPSP
        - namespace: npe01
          version: 3.10
    custom:
        my_key: my_value    # Accessible as $project_config.project__custom__my_key

tasks:
    my_task:
        description: What the task does
        class_path: tasks.my_module.MyTaskClass
        group: MyProject
        options:
            option_name: default_value

flows:
    my_flow:
        description: What the flow does
        group: MyProject
        steps:
            1:
                task: update_dependencies
            2:
                task: deploy
            3:
                task: run_tests
                options:
                    required_org_code_coverage_percent: 75

sources:
    npsp:
        github: https://github.com/SalesforceFoundation/NPSP
        release: latest
        allow_remote_code: true

orgs:
    scratch:
        dev:
            config_file: orgs/dev.json
            days: 7
            namespaced: false
```

### Variable and Return Value References

```yaml
# Reference project config values
namespace_inject: $project_config.project__package__namespace

# Reference return values from prior flow steps (^^ prefix)
version: ^^create_package_version.version_number
```

## CLI Commands

### Core Commands
```bash
cci version                                        # Print version
cci project init                                   # Initialize project
cci project info                                   # Show project config
cci --debug <command>                              # Debug mode (HTTP traces, post-mortem)
```

### Tasks
```bash
cci task list                                      # List all tasks
cci task info <task>                               # Task details and options
cci task run <task> --org <org>                    # Run task
cci task run <task> -o option_name value --org <org>  # Run with option
```

### Flows
```bash
cci flow list                                      # List all flows
cci flow info <flow>                               # Flow steps and details
cci flow run <flow> --org <org>                   # Run flow
cci flow run <flow> -o task__option value --org <org>  # Override task option
```

### Orgs
```bash
cci org list                                       # List configured orgs
cci org info <org>                                 # Org details
cci org browser <org>                              # Open in browser
cci org default <org>                              # Set default org
cci org scratch <config> <name>                    # Create scratch org
cci org scratch_delete <org>                       # Delete scratch org
cci org connect <org>                              # Connect persistent org
cci org connect <org> --sandbox                    # Connect sandbox
cci org import <sfdx_alias> <cci_alias>            # Import from sf CLI
cci org prune                                      # Clean expired orgs
```

### Services
```bash
cci service list                                   # List services
cci service connect <type> <name>                  # Connect service
cci service connect <type> <name> --project        # Project-scoped
cci service default <type> <name>                  # Set default
```

## Scratch Org Management

### Predefined Configurations

| Config | Purpose | Lifespan |
|--------|---------|----------|
| `dev` | Development | 7 days |
| `qa` | Testing | 7 days |
| `feature` | CI feature branches | 1 day |
| `beta` | CI beta testing | 1 day |
| `release` | CI release testing | 1 day |

Scratch orgs auto-create on first use and auto-recreate when expired.

### Custom Configurations
```yaml
orgs:
    scratch:
        my_custom:
            config_file: orgs/custom.json
            days: 14
            namespaced: true
```

### Connected (Persistent) Orgs
```bash
cci org connect myorg                              # Production/DE
cci org connect mysandbox --sandbox                # Sandbox
cci org connect myorg --global-org                 # Available cross-project
```

## Custom Flows

### Defining Flows
```yaml
flows:
    my_setup:
        description: Custom org setup
        steps:
            1:
                task: update_dependencies
            2:
                task: deploy
            3:
                flow: config_dev           # Nest a flow as a step
            4:
                task: load_sample_data
```

Step numbers can be integers or decimals (0.5, 2.1) for flexible insertion.

### Extending Existing Flows
```yaml
flows:
    dev_org:
        steps:
            0.5:                           # Insert before step 1
                task: my_pre_task
            3.5:                           # Insert between steps
                task: my_mid_task
            4:
                task: None                 # Skip step 4
```

### Conditional Execution
```yaml
steps:
    1:
        task: deploy
        when: org_config.scratch           # Only in scratch orgs
    2:
        task: install_managed
        when: not org_config.scratch       # Only in persistent orgs
```

### CLI Option Override in Flows
```bash
cci flow run dev_org -o deploy__path force-app -o run_tests__test_level RunLocalTests
```
Format: `-o task_name__option_name value`

## Custom Tasks

```python
# tasks/my_task.py
from cumulusci.core.tasks import BaseTask, CCIOptions
from cumulusci.utils.options import Field

class MyCustomTask(BaseTask):
    class Options(CCIOptions):
        my_string: str = Field(..., description="Required string")
        my_flag: bool = Field(False, description="Optional flag")

    parsed_options: Options

    def _run_task(self):
        self.logger.info(f"Running: {self.parsed_options.my_string}")
        self.return_values["result_key"] = "value"
```

Register in `cumulusci.yml`:
```yaml
tasks:
    my_task:
        class_path: tasks.my_task.MyCustomTask
        group: MyProject
```

## Deployment

### Deploy Task
```bash
cci task run deploy --org dev
cci task run deploy -o path force-app/main/default --org dev
cci task run deploy -o test_level RunLocalTests --org dev
```

Test levels: `NoTestRun`, `RunLocalTests`, `RunAllTestsInOrg`, `RunSpecifiedTests`

### Unpackaged Metadata
- `unpackaged/pre/` — Deployed **before** package install (Record Types, etc.)
- `unpackaged/post/` — Deployed **after** package install (TopicsForObjects, etc.)
- `unpackaged/config/<env>/` — Environment-specific configuration

### Namespace Tokens (for unpackaged metadata)

| Token | Managed | Unmanaged |
|-------|---------|-----------|
| `%%%NAMESPACE%%%` | `ns__` | (empty) |
| `%%%NAMESPACED_ORG%%%` | `ns` (namespaced orgs) | (empty) |
| `%%%NAMESPACE_OR_C%%%` | `ns` | `c` |
| `%%%NAMESPACE_DOT%%%` | `ns.` | (empty) |

### Source Transforms
Deploy supports find-and-replace transforms:
```yaml
tasks:
    deploy:
        options:
            transforms:
                - find: "old_value"
                  replace: "new_value"
                - find: "//xpath/expression"
                  replace: "new_xml_value"
                  xpath: true
                - inject_username: true
                - inject_org_url: true
```

### Retrieve Changes
```bash
cci task run list_changes --org dev
cci task run retrieve_changes --org dev
cci task run retrieve_changes --org dev --include "ApexClass:.*" --exclude ".*Test.*"
cci task run retrieve_changes --org dev --namespace_tokenize myns
```

## Metadata ETL

ETL tasks extract metadata from an org, transform it, and redeploy — preserving existing customizations unlike static deploys.

```bash
cci task run add_standard_value_set_entries --org dev
cci task run add_page_layout_related_lists --org dev
cci task run add_page_layout_fields --org dev
cci task run add_permission_set_perms --org dev
cci task run add_picklist_entries --org dev
```

## Development Workflow Quick Reference

```bash
# 1. Set up dev org (deploys deps + metadata + config + sample data)
cci flow run dev_org --org dev

# 2. Open org
cci org browser dev

# 3. Make changes in VS Code or the org

# 4. Check org changes
cci task run list_changes --org dev

# 5. Retrieve changes to local
cci task run retrieve_changes --org dev

# 6. Deploy local changes
cci task run deploy --org dev

# 7. Run tests
cci task run run_tests --org dev

# 8. Set up QA org
cci flow run qa_org --org qa
```

## Common Patterns

```bash
# Execute anonymous Apex
cci task run execute_anon -o apex "System.debug('Hello');" --org dev

# Wait for batch Apex
cci task run batch_apex_wait -o class_name MyBatchClass --org dev

# Delete data
cci task run delete_data -o objects Account,Contact --org dev

# Activate/deactivate flows
cci task run activate_flow -o developer_name My_Flow --org dev
cci task run deactivate_flow -o developer_name My_Flow --org dev

# Assign permission sets
cci task run assign_permission_sets -o api_names MyPermSet1,MyPermSet2 --org dev

# Insert a record
cci task run insert_record -o object Account -o values "Name:Test Account" --org dev
```

## Task Domains

### Set Up a Development Org

1. **Initialize project** — Run `cci project init` if no `cumulusci.yml` exists.
2. **Configure org definitions** — Create scratch org JSON files in `orgs/`.
3. **Define dependencies** — Add managed packages and GitHub dependencies to `cumulusci.yml`.
4. **Run dev_org flow** — `cci flow run dev_org --org dev` deploys everything.
5. **Verify** — `cci org browser dev` to open and confirm.

### Create a Custom Automation Flow

1. **Identify tasks** — Use `cci task list` and read [tasks-and-flows-catalog.md](references/tasks-and-flows-catalog.md).
2. **Compose flow** — Define steps in `cumulusci.yml` under `flows:`.
3. **Use conditional execution** — Add `when` clauses for org-type-specific behavior.
4. **Test** — Run `cci flow run <flow> --org dev` and verify each step.

### Deploy Metadata

1. **Choose strategy** — `cci task run deploy` for main source, `deploy_pre`/`deploy_post` for unpackaged.
2. **Set test level** — Use `-o test_level` appropriate to the target (NoTestRun for dev, RunLocalTests for CI).
3. **Handle namespaces** — Use namespace tokens in unpackaged metadata for portability.
4. **Retrieve org changes** — `cci task run retrieve_changes` to pull back org modifications.

### Manage Data

1. **Read** [data-operations.md](references/data-operations.md) for mapping file format and advanced features.
2. **Generate mapping** — `cci task run generate_dataset_mapping --org dev` to scaffold.
3. **Extract** — `cci task run extract_dataset -o mapping datasets/mapping.yml --org dev`.
4. **Load** — `cci task run load_dataset -o mapping datasets/mapping.yml --org dev`.
5. **Synthetic data** — Use Snowfakery recipes for large-scale generation.

### Package and Release

1. **Read** [packaging-and-releases.md](references/packaging-and-releases.md) for full workflows.
2. **Choose package type** — 2GP (recommended), 1GP (legacy), or unlocked.
3. **Use standard flows** — `release_2gp_beta`, `release_2gp_production`, etc.
4. **Test** — Run `ci_beta` and `ci_release` flows after packaging.

### Set Up CI/CD

1. **Read** [cicd-and-environments.md](references/cicd-and-environments.md) for GitHub Actions setup.
2. **Configure auth** — Store SFDX auth URLs or JWT credentials as GitHub secrets.
3. **Use reusable workflows** — CumulusCI provides pre-built GitHub Actions workflows.
4. **Handle concurrency** — Scratch orgs parallelize; 1GP uploads must serialize.

## Related Skills

- [migrating-sfdmu-data](../migrating-sfdmu-data/SKILL.md) — SFDMU for data migration workflows that complement CumulusCI datasets
- [sf-cli-deployment](../sf-cli-deployment/SKILL.md) — sf CLI deployment commands used alongside cci
- [building-lsdo](../building-lsdo/SKILL.md) — LSDO build standards that rely on CumulusCI for org automation
