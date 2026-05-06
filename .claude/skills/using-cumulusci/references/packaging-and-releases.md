# CumulusCI Packaging and Releases

## Package Types

| Type | Description | Use When |
|------|-------------|----------|
| **1GP Managed** | Traditional managed package, uses packaging org | Legacy projects, AppExchange |
| **2GP Managed** | Modern managed package, recommended for new work | New projects, source-driven development |
| **Unlocked** | Non-managed distributable package | Internal distribution, config packages |

## 1GP Workflow

```bash
# 1. Deploy to packaging org
cci flow run ci_master --org packaging

# 2. Upload beta
cci flow run release_beta --org packaging
# Or just the task: cci task run upload_beta --org packaging --name "v1.2 Beta 1"

# 3. Test beta
cci flow run ci_beta --org beta

# 4. Upload production
cci flow run release_production --org packaging
# Or just the task: cci task run upload_production --name "v1.2"

# 5. Test production release
cci flow run ci_release --org release
```

`ci_master` deletes metadata from packaging org that is no longer in the repository.

## 2GP Workflow

```bash
# 1. Release beta
cci flow run release_2gp_beta --org dev

# 2. Test beta
cci flow run ci_beta --org beta

# 3. Promote to production (promotes existing beta, does NOT create new version)
cci flow run release_2gp_production --org packaging

# 4. Test production
cci flow run ci_release --org release

# Alternative: promote by version ID
cci task run promote_package_version --version_id 04t000000000000 --promote_dependencies True
```

## Unlocked Package Workflow

```bash
# 1. Install dependencies (makes version IDs available)
cci flow run dependencies --org dev

# 2. Release beta
cci flow run release_unlocked_beta --org dev

# 3. Test beta
cci flow run ci_beta --org beta

# 4. Promote to production
cci flow run release_unlocked_production --org packaging

# 5. Test production
cci flow run ci_release --org release
```

## 2GP Feature Testing

```bash
# Build test package for feature branch
cci flow run build_feature_test_package --org dev

# Test with 2GP installation
cci flow run ci_feature_2gp --org feature

# Manual QA with 2GP
cci flow run qa_org_2gp --org qa
```

## Push Upgrades

```bash
# Push to all customer orgs (immediate)
cci task run push_all --version 1.5 --org packaging

# Schedule push for specific time (UTC)
cci task run push_all --version 1.5 --start_time 2024-10-19T10:00 --org packaging

# Push to sandboxes only
cci task run push_sandbox --version 1.5 --org packaging

# Push to specific org list
cci task run push_list --version 1.5 --org packaging

# Generate failure report
cci task run push_failure_report --org packaging
```

## Release Notes

### Automatic Generation

The `github_release_notes` task parses merged PR bodies between two tags, looking for headings: Critical Changes, Changes, Issues Closed, New Metadata, Installation Info.

```bash
# Preview release notes
cci task run github_release_notes --tag release/1.2

# Show PR attribution
cci task run github_release_notes --tag release/1.2 --link_pr True

# Publish to GitHub
cci task run github_release_notes --tag release/1.2 --publish True
```

### Custom Release Note Headings

```yaml
project:
    git:
        release_notes:
            parsers:
                7:
                    title: Known Issues
                    class_path: cumulusci.tasks.release_notes.parser.GithubLinesParser
```

## Dependencies

### Dependency Types

```yaml
project:
    dependencies:
        # GitHub repository (dynamic resolution)
        - github: https://github.com/SalesforceFoundation/NPSP

        # Managed package (specific version)
        - namespace: npe01
          version: 3.10

        # Managed package with install key
        - namespace: protected_pkg
          version: 1.0
          password_env_name: PKG_INSTALL_KEY

        # Unmanaged metadata from ZIP
        - zip_url: https://github.com/org/repo/archive/main.zip
          subfolder: src
          namespace_inject: myns
          unmanaged: true
```

### Resolution Strategies

| Strategy | Behavior |
|----------|----------|
| `latest_release` | Latest production release (default) |
| `include_beta` | Include pre-release versions |
| `commit_status` | Feature branches with 2GP betas |
| `unlocked` | Unlocked package betas |

### Dependency Pinning

```yaml
project:
    dependency_pins:
        - github: https://github.com/SalesforceFoundation/NPSP
          tag: rel/3.200
```
