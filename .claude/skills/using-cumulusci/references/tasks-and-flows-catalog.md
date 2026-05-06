# CumulusCI Tasks and Flows Catalog

## Standard Tasks

### Deployment Tasks
| Task | Description |
|------|-------------|
| `deploy` | Deploy metadata from repository to org |
| `deploy_pre` | Deploy all bundles under `unpackaged/pre/` |
| `deploy_post` | Deploy all bundles under `unpackaged/post/` |
| `deploy_qa_config` | Deploy QA-specific configuration |
| `dx` | Execute arbitrary Salesforce DX command |
| `dx_convert_to` | Convert metadata format to SFDX format |
| `dx_convert_from` | Convert SFDX format to metadata format |

### Source Tracking Tasks
| Task | Description |
|------|-------------|
| `list_changes` | List components modified in an org (scratch/dev sandbox only) |
| `retrieve_changes` | Retrieve modified components from org |
| `retrieve_profile` | Retrieve complete profiles with dependencies |

`retrieve_changes` options:
- `--include` — Regex patterns to include (format: `MemberType: MemberName`)
- `--exclude` — Regex patterns to exclude
- `--types` — Specific metadata types (e.g., `ApexClass`)
- `--path` — Custom output directory
- `--namespace_tokenize` — Tokenize namespace for unpackaged metadata

### Testing Tasks
| Task | Description |
|------|-------------|
| `run_tests` | Execute Apex tests with optional coverage reports |
| `robot` | Execute Robot Framework tests |
| `robot_libdoc` | Generate HTML keyword documentation |
| `robot_testdoc` | Generate HTML test documentation |

### Data Tasks
| Task | Description |
|------|-------------|
| `capture_sample_data` | Extract sample data from org to repository |
| `load_sample_data` | Load sample data into org |
| `generate_dataset_mapping` | Auto-generate dataset definition by inspecting org |
| `extract_dataset` | Extract org data to local storage |
| `load_dataset` | Load data from local storage to org |
| `delete_data` | Delete records by sObject or WHERE clause |
| `update_data` | Update records using Snowfakery recipe syntax |
| `insert_record` | Insert single record via REST API |
| `snowfakery` | Generate synthetic data from recipe files |
| `load_custom_settings` | Deploy custom settings from YAML |
| `create_bulk_data_permission_set` | Enable hard delete and audit field operations |

### Package Tasks
| Task | Description |
|------|-------------|
| `create_package` | Create package in target org |
| `create_package_version` | Upload 2GP package version |
| `promote_package_version` | Promote 2GP beta to production |
| `upload_beta` | Upload 1GP beta version |
| `upload_production` | Upload 1GP production version |
| `install_managed` | Install latest managed production release |
| `update_dependencies` | Install/update all project dependencies |
| `create_managed_src` | Modify src for managed deployment |
| `create_unmanaged_ee_src` | Modify src for EE unmanaged deployment |

### GitHub Tasks
| Task | Description |
|------|-------------|
| `github_release` | Create GitHub release for package version |
| `github_release_notes` | Generate release notes from PR bodies |
| `github_automerge_main` | Merge main into all feature branches |
| `github_automerge_feature` | Merge source branch to child branches |
| `github_clone_tag` | Clone a tag under a new name |
| `github_copy_subtree` | Copy subtrees for a release |
| `github_pull_requests` | List open PRs |
| `github_parent_pr_notes` | Merge child PR description to parent |
| `gather_release_notes` | Get latest release notes across repos |

### Metadata ETL Tasks
| Task | Description |
|------|-------------|
| `add_page_layout_related_lists` | Add Related Lists to Page Layouts |
| `add_page_layout_fields` | Add Fields/VF Pages to Page Layout |
| `add_profile_ip_ranges` | Add IP Login Ranges to Profiles |
| `add_standard_value_set_entries` | Add picklist entries to Standard Value Sets |
| `add_picklist_entries` | Add entries to custom picklist fields |
| `add_fields_to_field_set` | Add fields to a field set |
| `add_permission_set_perms` | Add Apex/FLS to Permission Set |
| `add_record_action_list_item` | Add Lightning action to page layout |
| `add_remote_site_settings` | Add Remote Site Settings |
| `assign_compact_layout` | Assign Compact Layout to objects |

### Permission Tasks
| Task | Description |
|------|-------------|
| `assign_permission_sets` | Assign Permission Sets to current user |
| `assign_permission_set_groups` | Assign Permission Set Groups |
| `assign_permission_set_licenses` | Assign Permission Set Licenses |
| `create_permission_set` | Create Permission Set with specified perms |
| `create_blank_profile` | Create a profile with no permissions |

### Org Configuration Tasks
| Task | Description |
|------|-------------|
| `activate_flow` | Activate Flows by Developer Name |
| `deactivate_flow` | Deactivate Flows by Developer Name |
| `create_community` | Create Experience Cloud site |
| `ensure_record_types` | Ensure default Record Type exists |
| `enable_einstein_prediction` | Enable Einstein Prediction Builder prediction |
| `connected_app` | Create Connected App for persistent orgs |

### Utility Tasks
| Task | Description |
|------|-------------|
| `command` | Run arbitrary shell command |
| `execute_anon` | Execute anonymous Apex via Tooling API |
| `batch_apex_wait` | Wait for batch/queueable Apex to finish |
| `custom_settings_value_wait` | Wait for custom settings field value |
| `composite_request` | Execute series of REST API requests in single call |
| `generate_data_dictionary` | Create CSV data dictionary |

### Preflight Check Tasks
| Task | Description |
|------|-------------|
| `check_components` | Check if components exist in target org |
| `check_dataset_load` | Preflight check for dataset loading |
| `check_my_domain_active` | Check if My Domain is active |
| `check_sobjects_available` | Check if sObjects are available |
| `check_sobject_permissions` | Check sObject permissions |
| `check_org_wide_defaults` | Validate OWD settings |
| `check_org_settings_value` | Validate org settings |
| `check_chatter_enabled` | Check Chatter is enabled |
| `check_enhanced_notes_enabled` | Check Enhanced Notes enabled |
| `get_installed_packages` | List installed managed packages |
| `get_available_licenses` | List available license keys |
| `get_existing_sites` | List existing Experience Cloud sites |
| `get_existing_record_types` | List all Record Types in org |

### Marketing Cloud Tasks
| Task | Description |
|------|-------------|
| `deploy_marketing_cloud_package` | Deploy to Marketing Cloud Tenant |
| `marketing_cloud_create_subscriber_attribute` | Create Subscriber Attribute |
| `marketing_cloud_create_user` | Create Marketing Cloud User |
| `marketing_cloud_get_user_info` | Get MC user info from REST API |
| `marketing_cloud_update_user_role` | Assign Role to MC User |

### Push Upgrade Tasks
| Task | Description |
|------|-------------|
| `push_all` | Push upgrades to all customer orgs |
| `push_sandbox` | Push to subscriber sandboxes only |
| `push_qa` | Push to orgs in `push/orgs_qa.txt` |
| `push_list` | Push to orgs in a custom file |
| `push_trial` | Push to Trialforce Template orgs |
| `push_failure_report` | Generate CSV of failed push jobs |

---

## Standard Flows

### Org Setup Flows
| Flow | Description |
|------|-------------|
| `dev_org` | Deploy unmanaged metadata + dependencies for development |
| `dev_org_namespaced` | Same as dev_org in a namespaced scratch org |
| `qa_org` | Deploy unmanaged metadata for QA testing |
| `qa_org_2gp` | QA using 2GP packages |
| `qa_org_unlocked` | QA using unlocked packages |
| `install_beta` | Install latest beta package version |
| `install_prod` | Install latest production package version |
| `regression_org` | Simulate upgrade from latest release to current beta |

### Dependency Flows
| Flow | Description |
|------|-------------|
| `dependencies` | Deploy all project dependencies |

### Deployment Flows
| Flow | Description |
|------|-------------|
| `deploy_unmanaged` | Deploy unmanaged metadata to org |
| `deploy_unmanaged_ee` | Deploy to Enterprise Edition org |
| `deploy_packaging` | Process and deploy to packaging org |
| `unmanaged_ee` | Deploy metadata and dependencies to EE org |

### Configuration Flows
| Flow | Description |
|------|-------------|
| `config_apextest` | Configure org for Apex test execution |
| `config_dev` | Configure as development org |
| `config_managed` | Configure after managed package install |
| `config_packaging` | Configure packaging org for upload |
| `config_qa` | Configure as QA environment |
| `config_regression` | Configure for regression testing |

### CI Flows
| Flow | Description |
|------|-------------|
| `ci_feature` | Deploy unmanaged + run Apex tests (feature branches) |
| `ci_feature_2gp` | Install as 2GP + run tests |
| `ci_master` | Deploy to packaging org (main branch) |
| `ci_beta` | Install beta + run Apex tests |
| `ci_release` | Install production + run managed tests |

### Release Flows
| Flow | Description |
|------|-------------|
| `release_beta` | Upload 1GP beta, create GitHub release, generate notes |
| `release_production` | Upload 1GP production release |
| `release_2gp_beta` | Upload 2GP beta, create GitHub release |
| `release_2gp_production` | Promote 2GP beta to production |
| `release_unlocked_beta` | Upload unlocked beta, create GitHub release |
| `release_unlocked_production` | Promote unlocked to production |

### Build Flows
| Flow | Description |
|------|-------------|
| `build_feature_test_package` | Create 2GP managed package for feature testing |
| `build_unlocked_test_package` | Create unlocked package for testing |

### Other Flows
| Flow | Description |
|------|-------------|
| `push_upgrade_org` | Simulate push upgrade with restricted admin |
| `install_2gp_commit` | Install 2GP package for specific commit |
| `install_unlocked_commit` | Install unlocked package for specific commit |
| `install_prod_no_config` | Install without configuration |
| `install_regression` | Install beta deps and upgrade |
| `uninstall_managed` | Remove managed package |

### Typical Org Setup Flow Task Order

Most org setup flows run these tasks in sequence:
1. `update_dependencies` — Install project dependencies
2. `deploy_pre` — Deploy `unpackaged/pre/` metadata
3. `deploy` — Deploy main package metadata
4. `deploy_post` — Deploy `unpackaged/post/` metadata
5. `update_admin_profile` — Configure admin profile
6. `load_sample_data` — Load test data (in some flows)
