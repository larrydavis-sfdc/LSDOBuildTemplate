# CumulusCI Robot Framework Integration

## Project Structure

```
robot/
    ProjectName/
        tests/
            create_contact.robot
        resources/
            ProjectName.robot
        results/
            output.xml
            log.html
            report.html
        doc/
```

## Test File Structure

```robot
*** Settings ***
Resource        cumulusci/robotframework/Salesforce.robot
Documentation   My test suite description
Suite Setup     Open test browser
Suite Teardown  Delete records and close browser

*** Test Cases ***
Create A Contact
    [Documentation]    Verify contact creation
    ${contact_id} =    Salesforce Insert    Contact
    ...    FirstName=Test
    ...    LastName=User
    ...    Email=test@example.com
    &{contact} =    Salesforce Get    Contact    ${contact_id}
    Should Be Equal    &{contact}[FirstName]    Test

*** Keywords ***
My Custom Keyword
    [Documentation]    A reusable keyword
    [Arguments]    ${name}
    Go To Object Home    Contact
    Wait Until Page Contains    ${name}
```

## Key Libraries

Auto-imported via `Salesforce.robot`:
- **CumulusCI Library** — CumulusCI-specific keywords
- **Salesforce Library** — Salesforce API and UI keywords
- **Collections** — Data structure operations
- **OperatingSystem** — File/system interactions
- **String** — Text manipulation
- **XML** — XML parsing

Must import explicitly:
- **SeleniumLibrary** — Browser automation

## Key Keywords

| Keyword | Purpose |
|---------|---------|
| `Salesforce Insert` | Create records via API |
| `Salesforce Get` | Retrieve records by ID |
| `Delete session records` | Clean up test records |
| `Open test browser` | Open browser with org auth |
| `Delete records and close browser` | Full cleanup |
| `Go to object home` | Navigate to sObject list view |
| `Wait until page contains` | Wait for element to appear |
| `Capture page screenshot` | Take screenshot |
| `Get fake data` | Generate test data (names, emails, etc.) |

## Running Tests

```bash
# Run all tests
cci task run robot --org dev

# Run specific test file
cci task run robot --suites robot/ProjectName/tests/my_test.robot --org dev

# Run all tests in directory
cci task run robot --suites robot/ProjectName/tests --org dev

# Headless browser (for CI)
cci task run robot --vars BROWSER:headlesschrome --org dev
```

## Browser Configuration

```yaml
# In cumulusci.yml
tasks:
    robot:
        options:
            vars:
                - BROWSER:firefox
```

Supported browsers: `chrome`, `firefox`, `headlesschrome`, `headlessfirefox`

## Test Output

Generated in `robot/ProjectName/results/`:

| File | Purpose |
|------|---------|
| `output.xml` | Machine-readable test data |
| `log.html` | Detailed results with debugging info |
| `report.html` | High-level pass/fail summary |
