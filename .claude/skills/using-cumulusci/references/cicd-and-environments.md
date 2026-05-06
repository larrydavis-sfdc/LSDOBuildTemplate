# CumulusCI CI/CD and Environments

## GitHub Actions Architecture

CumulusCI provides four tiers of GitHub Actions (highest to lowest abstraction):

| Tier | Name | Use When |
|------|------|----------|
| 1 | **Reusable Workflows** (`cumulus-actions/standard-workflows`) | Standard pipelines, no customization needed |
| 2 | **Job-Based Actions** | Building blocks for custom workflows |
| 3 | **Base Actions** (`run-flow-scratch`, `run-robot-flow-scratch`) | Run flows/Robot tests in scratch orgs |
| 4 | **Primitive Actions** (`setup-cumulus`, `authorize-org`, `run-flow`, `run-task`) | Full control over each step |

### Available Reusable Workflows

**Packaging:**
- `beta-1gp`, `production-1gp`
- `beta-2gp`, `production-2gp`

**Feature testing:**
- `feature`, `feature-with-robot`
- `feature-2gp`, `feature-2gp-with-robot`
- `feature-namespaced`

## Authentication

### Dev Hub Credentials

Store SFDX auth URL as a GitHub secret:

```bash
sf org display -u <devhub> --json --verbose | jq -r .result.sfdxAuthUrl
```

### Packaging Org

Use GitHub Environments for protection. Restrict packaging secrets to `main` branch builds.

### SFDX Auth URL Method

```bash
sf org login sfdx-url --sfdx-url-file authurl.txt
cci org import <org_name> <org_name>
```

### JWT Flow Method

```bash
export CUMULUSCI_ORG_orgName='{"username":"user@org.com","instance_url":"https://myorg.salesforce.com"}'
export SFDX_CLIENT_ID="connected_app_client_id"
export SFDX_HUB_KEY="$(cat server.key)"
# For instanceless sandbox URLs:
export SFDX_AUDIENCE_URL="https://test.salesforce.com"
```

## Concurrency

- Scratch org operations can run in parallel
- 1GP package uploads require serialization via `concurrency: packaging`

Minimum CumulusCI version for packaging: 3.61.1

## Service Registration via Environment Variables

Pattern: `CUMULUSCI_SERVICE_<service_type>[__service_name]`

```bash
# Default GitHub service (name: "env")
export CUMULUSCI_SERVICE_github='{"username":"jdoe","email":"jane@example.com","token":"ghp_xxx"}'

# Named GitHub service (name: "env-integration-user")
export CUMULUSCI_SERVICE_github__integration_user='{"username":"bot","email":"bot@example.com","token":"ghp_yyy"}'

# Connected app service
export CUMULUSCI_SERVICE_connected_app__sandbox='{"client_id":"xxx","client_secret":"yyy"}'
```

## Persistent Org Authorization via Environment Variables

```bash
export CUMULUSCI_ORG_orgName='{"username":"user@org.com","instance_url":"https://myorg.salesforce.com"}'
```

## Key Environment Variables

| Variable | Purpose |
|----------|---------|
| `CUMULUSCI_KEY` | Encrypt org credentials when OS keychain unavailable |
| `CUMULUSCI_REPO_URL` | GitHub repository URL for CI |
| `CUMULUSCI_AUTO_DETECT` | Auto-detect branch/commit from CI env vars |
| `CUMULUSCI_DISABLE_REFRESH` | Prevent OAuth token refresh |
| `CUMULUSCI_SYSTEM_CERTS` | Use system TLS certificates |
| `GITHUB_TOKEN` | GitHub personal access token |
| `GITHUB_APP_ID` | GitHub App identifier |
| `GITHUB_APP_KEY` | GitHub App JWT |
| `SFDX_CLIENT_ID` | Connected App client ID |
| `SFDX_HUB_KEY` | JWT private key contents |
| `SFDX_ORG_CREATE_ARGS` | Extra args for org creation (e.g., `--release=preview`) |
| `HEROKU_TEST_RUN_BRANCH` | Branch for Heroku CI |
| `HEROKU_TEST_RUN_COMMIT_VERSION` | Commit for Heroku CI |

## org_config Reference

Properties available in `when` clauses and configuration:

### Authentication & Identity
- `org_config.access_token` — Current auth token
- `org_config.username` — Active username
- `org_config.user_id` — Active user ID

### Org Location
- `org_config.instance_url` — Full org URL
- `org_config.instance_name` — Shortened name
- `org_config.org_id` — Organization ID
- `org_config.start_url` — Frontdoor login URL
- `org_config.lightning_base_url` — Lightning Experience base URL

### Org Classification
- `org_config.scratch` — Boolean: is scratch org
- `org_config.is_sandbox` — Boolean: is sandbox
- `org_config.org_type` — Edition type (e.g., "Enterprise Edition")

### Features
- `org_config.is_person_accounts_enabled`
- `org_config.is_advanced_currency_management_enabled`
- `org_config.is_multiple_currencies_enabled`
- `org_config.is_survey_advanced_features_enabled`

### Namespace & Packages
- `org_config.namespace` — Org namespace
- `org_config.namespaced` — Boolean: namespace present
- `org_config.installed_packages` — Dict of installed packages

### Methods
- `org_config.has_minimum_package_version(package_id, version)` — Check installed package version
