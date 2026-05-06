# Standard Agentforce / Copilot Actions Catalog

Complete reference of all pre-built (standard) actions shipped with Salesforce for use in Agentforce agents and Einstein Copilot. These are NOT custom actions -- they come out of the box.

**Source**: Salesforce Help `ai.copilot_actions_ref.htm` and related documentation.
**Last reviewed**: April 2026

> **Caveat**: Salesforce adds new standard actions every release. This list is comprehensive as of Spring '26 but should be validated against your org's Setup > Agent Actions page for the latest additions.

---

## How to Read This Catalog

For each action:
- **Action Name**: Display name as shown in Salesforce Setup > Agent Actions
- **API Name**: Developer / API name used in metadata and configuration
- **Category / Topic**: The standard topic or cloud it belongs to
- **Description**: What the action does
- **License**: Required Salesforce edition, cloud, or add-on license

---

## Table of Contents

1. [Sales Actions](#1-sales-actions)
2. [Service Actions](#2-service-actions)
3. [Commerce Actions](#3-commerce-actions)
4. [Marketing Actions](#4-marketing-actions)
5. [CRM Analytics Actions](#5-crm-analytics-actions)
6. [Field Service Actions](#6-field-service-actions)
7. [Industries Actions](#7-industries-actions)
8. [Platform / General Actions](#8-platform--general-actions)
9. [Einstein / AI Actions](#9-einstein--ai-actions)
10. [Flow-Based Actions](#10-flow-based-actions)
11. [Prompt Template Actions](#11-prompt-template-actions)
12. [Slack Actions](#12-slack-actions)
13. [Tableau Actions](#13-tableau-actions)

---

## 1. Sales Actions

### Opportunity Management

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 1 | Get Opportunity Summary | `Get_Opportunity_Summary` | Sales | Generates an AI summary of an opportunity including stage, amount, close date, and recent activity | Sales Cloud |
| 2 | Draft Close Plan | `Draft_Close_Plan` | Sales | Creates a recommended close plan for an opportunity based on deal stage, stakeholders, and engagement history | Sales Cloud + Einstein |
| 3 | Get Similar Opportunities | `Get_Similar_Opportunities` | Sales | Finds historically similar closed opportunities to provide win/loss context for the current deal | Sales Cloud |
| 4 | Identify Key Contacts for Opportunity | `Identify_Key_Contacts_Opp` | Sales | Identifies the key decision-makers and influencers on an opportunity | Sales Cloud |
| 5 | Create Opportunity | `Create_Opportunity` | Sales | Creates a new opportunity record with specified fields | Sales Cloud |
| 6 | Update Opportunity | `Update_Opportunity` | Sales | Updates fields on an existing opportunity record | Sales Cloud |
| 7 | Close Opportunity | `Close_Opportunity` | Sales | Marks an opportunity as Closed Won or Closed Lost with reason | Sales Cloud |
| 8 | List Open Opportunities | `List_Open_Opportunities` | Sales | Retrieves a list of open opportunities for the current user or a specified account | Sales Cloud |
| 9 | Get Opportunity Record | `Get_Opportunity_Record` | Sales | Retrieves detailed field values for a specific opportunity | Sales Cloud |

### Lead Management

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 10 | Get Lead Summary | `Get_Lead_Summary` | Sales | Generates an AI summary of a lead including demographic info, engagement, and scoring | Sales Cloud |
| 11 | Qualify Lead | `Qualify_Lead` | Sales | Provides an AI-driven lead qualification assessment based on BANT or custom criteria | Sales Cloud + Einstein |
| 12 | Create Lead | `Create_Lead` | Sales | Creates a new lead record | Sales Cloud |
| 13 | Convert Lead | `Convert_Lead` | Sales | Converts a lead to an account, contact, and optionally an opportunity | Sales Cloud |
| 14 | Draft Lead Nurture Email | `Draft_Lead_Nurture_Email` | Sales | Drafts a personalized follow-up email for lead nurturing | Sales Cloud + Einstein |

### Account Management

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 15 | Get Account Summary | `Get_Account_Summary` | Sales | Generates an AI summary of an account including hierarchy, open deals, cases, and recent activity | Sales Cloud |
| 16 | Get Account News | `Get_Account_News` | Sales | Retrieves recent news articles related to an account from public sources | Sales Cloud |
| 17 | Create Account | `Create_Account` | Sales | Creates a new account record | Sales Cloud |
| 18 | Identify Key Contacts for Account | `Identify_Key_Contacts_Account` | Sales | Lists key contacts associated with an account and their roles | Sales Cloud |
| 19 | Get Account Hierarchy | `Get_Account_Hierarchy` | Sales | Retrieves the parent-child account hierarchy for a given account | Sales Cloud |

### Contact Management

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 20 | Create Contact | `Create_Contact` | Sales | Creates a new contact record | Sales Cloud |
| 21 | Get Contact Record | `Get_Contact_Record` | Sales | Retrieves contact details including related account and activity | Sales Cloud |

### Forecasting

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 22 | Get Forecast Summary | `Get_Forecast_Summary` | Sales | Retrieves the current forecast summary for the user or team | Sales Cloud (Collaborative Forecasting) |
| 23 | Get Forecast Insights | `Get_Forecast_Insights` | Sales | Provides AI-driven insights on forecast gaps and pipeline changes | Sales Cloud + Einstein |
| 24 | Adjust Forecast | `Adjust_Forecast` | Sales | Applies a manager or owner forecast adjustment to a forecast category | Sales Cloud (Collaborative Forecasting) |

### Pipeline & Activity

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 25 | Get Pipeline Insights | `Get_Pipeline_Insights` | Sales | Analyzes the sales pipeline to identify risks, trends, and recommended actions | Sales Cloud + Einstein |
| 26 | Draft Follow-Up Email | `Draft_Followup_Email` | Sales | Generates a contextual follow-up email based on a recent meeting or call | Sales Cloud |
| 27 | Log a Call | `Log_A_Call` | Sales | Creates a call/task activity record associated with a record | Sales Cloud |
| 28 | Create Task | `Create_Task` | Sales | Creates a new task record | Sales Cloud |
| 29 | Create Event | `Create_Event` | Sales | Creates a new calendar event record | Sales Cloud |
| 30 | Send Email | `Send_Email` | Sales | Sends an email from Salesforce to specified recipients | Sales Cloud |
| 31 | Get Activity Timeline | `Get_Activity_Timeline` | Sales | Retrieves the activity timeline (emails, calls, tasks, events) for a record | Sales Cloud |

### Sales Engagement / High Velocity Sales

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 32 | Get Next Best Action | `Get_Next_Best_Action` | Sales | Returns the recommended next step from a sales cadence or Einstein recommendation | Sales Cloud + Sales Engagement |
| 33 | Add to Sales Cadence | `Add_To_Cadence` | Sales | Adds a lead or contact to a specified sales cadence | Sales Engagement |
| 34 | Remove from Sales Cadence | `Remove_From_Cadence` | Sales | Removes a lead or contact from a sales cadence | Sales Engagement |

### Revenue Intelligence / Revenue Lifecycle Management

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 35 | Get Deal Insights | `Get_Deal_Insights` | Sales | Returns AI-generated insights for a deal (risk score, engagement signals, sentiment) | Revenue Intelligence |
| 36 | Get Einstein Conversation Insights | `Get_Conversation_Insights` | Sales | Retrieves key insights from sales calls — mentions of competitors, pricing, objections | Einstein Conversation Insights |

### Quotes & Products

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 37 | Create Quote | `Create_Quote` | Sales | Creates a new quote record linked to an opportunity | Sales Cloud (CPQ optional) |
| 38 | Get Quote Details | `Get_Quote_Details` | Sales | Retrieves line items and details for a quote | Sales Cloud |
| 39 | Draft Pricing Proposal | `Draft_Pricing_Proposal` | Sales | Generates a draft pricing proposal document for a quote | Sales Cloud + Einstein |

---

## 2. Service Actions

### Case Management

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 40 | Get Case Summary | `Get_Case_Summary` | Service | Generates an AI summary of a case including status, history, and related interactions | Service Cloud |
| 41 | Create Case | `Create_Case` | Service | Creates a new case record with specified fields | Service Cloud |
| 42 | Update Case | `Update_Case` | Service | Updates fields on an existing case record | Service Cloud |
| 43 | Close Case | `Close_Case` | Service | Closes a case with a resolution and status | Service Cloud |
| 44 | Escalate Case | `Escalate_Case` | Service | Escalates a case (changes priority or escalation flag) | Service Cloud |
| 45 | Get Similar Cases | `Get_Similar_Cases` | Service | Finds cases similar to the current one based on subject and description | Service Cloud + Einstein |
| 46 | Get Case Resolution | `Get_Case_Resolution` | Service | Recommends a resolution for a case based on similar resolved cases and knowledge articles | Service Cloud + Einstein |
| 47 | Classify Case | `Classify_Case` | Service | Uses AI to classify a case's type, reason, priority based on its description | Service Cloud + Einstein |
| 48 | Summarize Case Conversation | `Summarize_Case_Conversation` | Service | Summarizes the messaging/chat conversation history for a case | Service Cloud |
| 49 | Route Case | `Route_Case` | Service | Routes a case to the appropriate queue or agent via Omni-Channel rules | Service Cloud |
| 50 | Merge Cases | `Merge_Cases` | Service | Merges duplicate cases into a primary case | Service Cloud |
| 51 | Get Case List | `Get_Case_List` | Service | Retrieves a filtered list of cases (by status, owner, queue, etc.) | Service Cloud |

### Knowledge Management

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 52 | Search Knowledge | `Search_Knowledge` | Service | Searches knowledge articles using keyword or semantic search | Service Cloud (Knowledge enabled) |
| 53 | Get Knowledge Article | `Get_Knowledge_Article` | Service | Retrieves the full content of a specific knowledge article | Service Cloud (Knowledge enabled) |
| 54 | Draft Knowledge Article | `Draft_Knowledge_Article` | Service | Generates a draft knowledge article from a case resolution | Service Cloud + Einstein |
| 55 | Query Knowledge for Case | `Query_Knowledge_For_Case` | Service | Searches knowledge base for articles relevant to a specific case | Service Cloud (Knowledge enabled) |
| 56 | Recommend Knowledge Articles | `Recommend_Knowledge_Articles` | Service | Uses AI to recommend the most relevant knowledge articles for a given context | Service Cloud + Einstein |
| 57 | Attach Article to Case | `Attach_Article_To_Case` | Service | Attaches a knowledge article to a case | Service Cloud (Knowledge enabled) |

### Messaging & Chat

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 58 | Transfer to Agent | `Transfer_To_Agent` | Service | Transfers a customer conversation to a human agent via Omni-Channel | Service Cloud |
| 59 | Send Message to Customer | `Send_Message_To_Customer` | Service | Sends a proactive message to a customer in an active messaging session | Service Cloud (Messaging) |
| 60 | Generate Service Reply | `Generate_Service_Reply` | Service | Generates an AI-drafted reply for a service agent to send to a customer | Service Cloud + Einstein |
| 61 | Wrap Up Conversation | `Wrap_Up_Conversation` | Service | Generates wrap-up notes and disposition for a completed conversation | Service Cloud |

### Work Orders

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 62 | Create Work Order | `Create_Work_Order` | Service | Creates a new work order record | Service Cloud |
| 63 | Get Work Order Summary | `Get_Work_Order_Summary` | Service | Generates a summary of a work order including line items and status | Service Cloud |
| 64 | Update Work Order | `Update_Work_Order` | Service | Updates fields on an existing work order | Service Cloud |

### Entitlements & SLA

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 65 | Check Entitlements | `Check_Entitlements` | Service | Checks service entitlements and SLA milestones for an account or contact | Service Cloud (Entitlements) |
| 66 | Get SLA Status | `Get_SLA_Status` | Service | Returns the current SLA milestone status for a case | Service Cloud (Entitlements) |

### Service Catalog

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 67 | Create Catalog Item Request | `Create_Catalog_Item_Request` | Service | Creates a service request from a service catalog item | Service Cloud (Service Catalog) |
| 68 | Search Service Catalog | `Search_Service_Catalog` | Service | Searches available service catalog items | Service Cloud (Service Catalog) |

### Incident Management

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 69 | Create Incident | `Create_Incident` | Service | Creates a new incident record | Service Cloud (Incident Management) |
| 70 | Get Incident Summary | `Get_Incident_Summary` | Service | Summarizes an incident including impacted assets, related cases, and timeline | Service Cloud (Incident Management) |
| 71 | Create Problem | `Create_Problem` | Service | Creates a problem record linked to an incident | Service Cloud (Incident Management) |
| 72 | Create Change Request | `Create_Change_Request` | Service | Creates a change request record | Service Cloud (Incident Management) |

### Swarming

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 73 | Create Swarm | `Create_Swarm` | Service | Initiates a collaborative swarm on a case or incident | Service Cloud (Swarming) |
| 74 | Recommend Swarm Members | `Recommend_Swarm_Members` | Service | Recommends experts to add to a swarm based on skills and availability | Service Cloud (Swarming) + Einstein |

---

## 3. Commerce Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 75 | Get Order Summary | `Get_Order_Summary` | Commerce | Retrieves details and status of an order | Commerce Cloud |
| 76 | Get Order Status | `Get_Order_Status` | Commerce | Returns the current fulfillment/shipping status of an order | Commerce Cloud |
| 77 | Cancel Order | `Cancel_Order` | Commerce | Cancels an order (or order items) | Commerce Cloud |
| 78 | Create Return | `Create_Return` | Commerce | Initiates a return or exchange for order items | Commerce Cloud |
| 79 | Process Refund | `Process_Refund` | Commerce | Processes a refund for returned or cancelled items | Commerce Cloud |
| 80 | Track Shipment | `Track_Shipment` | Commerce | Retrieves shipment tracking information for an order | Commerce Cloud |
| 81 | Apply Promotion | `Apply_Promotion` | Commerce | Applies a promotional code or discount to a cart/order | Commerce Cloud |
| 82 | Get Product Recommendations | `Get_Product_Recommendations` | Commerce | Returns AI-powered product recommendations based on browsing/purchase history | Commerce Cloud + Einstein |
| 83 | Search Products | `Search_Products` | Commerce | Searches the product catalog by keywords, categories, or attributes | Commerce Cloud |
| 84 | Check Inventory Availability | `Check_Inventory` | Commerce | Checks product inventory/availability across locations | Commerce Cloud |
| 85 | Get Cart Summary | `Get_Cart_Summary` | Commerce | Retrieves the current shopping cart contents and total | Commerce Cloud |
| 86 | Modify Cart | `Modify_Cart` | Commerce | Adds, removes, or updates items in a shopping cart | Commerce Cloud |
| 87 | Guided Shopping | `Guided_Shopping` | Commerce | Provides conversational guided shopping experience to help buyers find products | Commerce Cloud + Einstein |
| 88 | Get Buyer Account Info | `Get_Buyer_Account_Info` | Commerce | Retrieves buyer account details (B2B) | B2B Commerce |

---

## 4. Marketing Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 89 | Create Campaign | `Create_Campaign` | Marketing | Creates a new campaign record | Marketing Cloud / Sales Cloud |
| 90 | Get Campaign Performance | `Get_Campaign_Performance` | Marketing | Retrieves campaign metrics (sent, opened, clicked, converted) | Marketing Cloud |
| 91 | Add to Campaign | `Add_To_Campaign` | Marketing | Adds a lead or contact as a campaign member | Sales Cloud |
| 92 | Generate Campaign Brief | `Generate_Campaign_Brief` | Marketing | Generates an AI-drafted campaign brief from objectives and audience details | Marketing Cloud + Einstein |
| 93 | Draft Marketing Email | `Draft_Marketing_Email` | Marketing | Drafts marketing email content using AI based on audience segment and goals | Marketing Cloud + Einstein |
| 94 | Create Segment | `Create_Segment` | Marketing | Creates a data cloud segment based on specified criteria | Data Cloud |
| 95 | Get Segment Insights | `Get_Segment_Insights` | Marketing | Provides AI insights on a customer segment (demographics, behaviors, trends) | Data Cloud + Einstein |
| 96 | Generate Subject Line | `Generate_Subject_Line` | Marketing | Generates AI-optimized email subject line variations | Marketing Cloud + Einstein |
| 97 | Create Journey | `Create_Journey` | Marketing | Creates a new Marketing Cloud journey entry | Marketing Cloud |
| 98 | Get Journey Performance | `Get_Journey_Performance` | Marketing | Retrieves performance metrics for a Marketing Cloud journey | Marketing Cloud |
| 99 | Draft SMS Content | `Draft_SMS_Content` | Marketing | Generates SMS/MMS message content for a campaign | Marketing Cloud + Einstein |

---

## 5. CRM Analytics Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 100 | Query CRM Analytics | `Query_CRM_Analytics` | Analytics | Executes a SAQL query against a CRM Analytics dataset | CRM Analytics |
| 101 | Get Dashboard Insights | `Get_Dashboard_Insights` | Analytics | Retrieves AI-generated insights from a CRM Analytics dashboard | CRM Analytics |
| 102 | Get Report Summary | `Get_Report_Summary` | Analytics | Summarizes a Salesforce report with key metrics and trends | Enterprise+ |
| 103 | Run Report | `Run_Report` | Analytics | Executes a Salesforce report and returns results | Enterprise+ |
| 104 | Get Prediction | `Get_Prediction` | Analytics | Retrieves an Einstein Discovery or Einstein Prediction Builder prediction | Einstein Discovery |
| 105 | Explain Prediction | `Explain_Prediction` | Analytics | Provides the top factors contributing to an Einstein prediction | Einstein Discovery |
| 106 | Get Trending Report | `Get_Trending_Report` | Analytics | Identifies trending metrics and anomalies in report data | CRM Analytics |
| 107 | Create Analytics Dashboard | `Create_Analytics_Dashboard` | Analytics | Creates a new CRM Analytics dashboard from a template or specification | CRM Analytics |

---

## 6. Field Service Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 108 | Create Service Appointment | `Create_Service_Appointment` | Field Service | Creates a new service appointment record | Field Service |
| 109 | Schedule Service Appointment | `Schedule_Service_Appointment` | Field Service | Schedules or reschedules a service appointment using optimization | Field Service |
| 110 | Get Appointment Summary | `Get_Appointment_Summary` | Field Service | Generates a summary of a service appointment including assigned resource and status | Field Service |
| 111 | Get Technician Availability | `Get_Technician_Availability` | Field Service | Checks available time slots for field technicians based on skills and location | Field Service |
| 112 | Dispatch Technician | `Dispatch_Technician` | Field Service | Dispatches a field technician to a service appointment | Field Service |
| 113 | Get Asset Service History | `Get_Asset_Service_History` | Field Service | Retrieves the service and maintenance history for an asset | Field Service |
| 114 | Create Work Order from Case | `Create_WO_From_Case` | Field Service | Creates a work order and service appointment from an existing case | Field Service |
| 115 | Update Service Appointment Status | `Update_SA_Status` | Field Service | Updates the status of a service appointment (dispatched, in progress, completed, etc.) | Field Service |
| 116 | Get Service Resource Schedule | `Get_Resource_Schedule` | Field Service | Retrieves the schedule for a service resource including appointments and absences | Field Service |
| 117 | Generate Work Summary | `Generate_Work_Summary` | Field Service | Generates a post-visit work summary based on work order and appointment details | Field Service + Einstein |
| 118 | Check Parts Availability | `Check_Parts_Availability` | Field Service | Checks availability of required parts/products at a service location or van stock | Field Service |

---

## 7. Industries Actions

### Health Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 119 | Get Patient Summary | `Get_Patient_Summary` | Health Cloud | Generates a comprehensive patient summary including conditions, medications, and care plans | Health Cloud |
| 120 | Create Care Plan | `Create_Care_Plan` | Health Cloud | Creates a new care plan for a patient | Health Cloud |
| 121 | Get Care Plan Summary | `Get_Care_Plan_Summary` | Health Cloud | Summarizes an active care plan including goals, tasks, and progress | Health Cloud |
| 122 | Find Care Provider | `Find_Care_Provider` | Health Cloud | Searches for care providers based on specialty, location, and network | Health Cloud |
| 123 | Create Referral | `Create_Referral` | Health Cloud | Creates a clinical referral for a patient | Health Cloud |
| 124 | Get Patient Timeline | `Get_Patient_Timeline` | Health Cloud | Retrieves the clinical timeline for a patient including encounters, diagnoses, and procedures | Health Cloud |
| 125 | Verify Benefits | `Verify_Benefits` | Health Cloud | Verifies insurance benefits and eligibility for a patient | Health Cloud |
| 126 | Schedule Clinical Appointment | `Schedule_Clinical_Appointment` | Health Cloud | Schedules a clinical appointment for a patient | Health Cloud |
| 127 | Get Medication List | `Get_Medication_List` | Health Cloud | Retrieves the current medication list for a patient | Health Cloud |
| 128 | Prior Authorization Status | `Get_Prior_Auth_Status` | Health Cloud | Checks the status of a prior authorization request | Health Cloud |
| 129 | Create Clinical Assessment | `Create_Clinical_Assessment` | Health Cloud | Creates a clinical assessment (e.g., PHQ-9, HRA) for a patient | Health Cloud |
| 130 | Summarize Clinical Notes | `Summarize_Clinical_Notes` | Health Cloud | Generates an AI summary of clinical notes and encounter documentation | Health Cloud + Einstein |

### Financial Services Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 131 | Get Financial Account Summary | `Get_Financial_Account_Summary` | Financial Services | Summarizes a financial account including balances, recent transactions, and holdings | Financial Services Cloud |
| 132 | Get Client Summary | `Get_Client_Summary` | Financial Services | Generates a comprehensive client summary for wealth/banking advisors | Financial Services Cloud |
| 133 | Create Financial Goal | `Create_Financial_Goal` | Financial Services | Creates a new financial goal for a client | Financial Services Cloud |
| 134 | Get Portfolio Summary | `Get_Portfolio_Summary` | Financial Services | Summarizes investment portfolio performance and allocation | Financial Services Cloud |
| 135 | Create Service Request | `Create_Service_Request_FSC` | Financial Services | Creates a financial service request (e.g., address change, wire transfer) | Financial Services Cloud |
| 136 | Check KYC Status | `Check_KYC_Status` | Financial Services | Checks Know Your Customer compliance status for a client | Financial Services Cloud |
| 137 | Get Transaction History | `Get_Transaction_History` | Financial Services | Retrieves recent transaction history for a financial account | Financial Services Cloud |
| 138 | Flag Suspicious Transaction | `Flag_Suspicious_Transaction` | Financial Services | Flags a transaction for review by compliance team | Financial Services Cloud |
| 139 | Create Claim | `Create_Claim_Insurance` | Financial Services | Creates an insurance claim record | Financial Services Cloud (Insurance) |
| 140 | Get Claim Status | `Get_Claim_Status` | Financial Services | Retrieves the current status and details of an insurance claim | Financial Services Cloud (Insurance) |
| 141 | Get Policy Summary | `Get_Policy_Summary` | Financial Services | Summarizes an insurance policy including coverage, premiums, and endorsements | Financial Services Cloud (Insurance) |
| 142 | Calculate Loan Eligibility | `Calculate_Loan_Eligibility` | Financial Services | Assesses loan eligibility based on client financial data | Financial Services Cloud (Mortgage/Lending) |

### Life Sciences Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 143 | Get HCP Profile Summary | `Get_HCP_Summary` | Life Sciences | Summarizes a healthcare professional's profile, affiliations, and engagement history | Life Sciences Cloud |
| 144 | Get Clinical Trial Summary | `Get_Clinical_Trial_Summary` | Life Sciences | Summarizes a clinical trial including enrollment, sites, and milestones | Life Sciences Cloud |
| 145 | Create Medical Inquiry | `Create_Medical_Inquiry` | Life Sciences | Creates a medical information inquiry record | Life Sciences Cloud |
| 146 | Report Adverse Event | `Report_Adverse_Event` | Life Sciences | Creates an adverse event report | Life Sciences Cloud |
| 147 | Check Sample Inventory | `Check_Sample_Inventory` | Life Sciences | Checks product sample inventory for a sales rep | Life Sciences Cloud |
| 148 | Log Sample Drop | `Log_Sample_Drop` | Life Sciences | Records a product sample drop to an HCP | Life Sciences Cloud |

### Manufacturing Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 149 | Get Account Forecast (Manufacturing) | `Get_Mfg_Account_Forecast` | Manufacturing | Retrieves sales agreement and account-based forecast data | Manufacturing Cloud |
| 150 | Get Rebate Summary | `Get_Rebate_Summary` | Manufacturing | Summarizes rebate program status and payout calculations | Manufacturing Cloud |
| 151 | Create Visit Report | `Create_Visit_Report` | Manufacturing | Creates a visit/store check report | Manufacturing Cloud |

### Automotive Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 152 | Get Vehicle Summary | `Get_Vehicle_Summary` | Automotive | Summarizes vehicle details including service history, warranty, and recalls | Automotive Cloud |
| 153 | Schedule Service Appointment (Auto) | `Schedule_Auto_Service` | Automotive | Schedules a vehicle service appointment | Automotive Cloud |
| 154 | Check Recall Status | `Check_Recall_Status` | Automotive | Checks if a vehicle has any open recalls | Automotive Cloud |

### Energy & Utilities Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 155 | Get Usage Summary | `Get_Usage_Summary` | Energy & Utilities | Summarizes energy/utility usage for a service point or account | Energy & Utilities Cloud |
| 156 | Report Outage | `Report_Outage` | Energy & Utilities | Reports a service outage | Energy & Utilities Cloud |
| 157 | Get Billing Summary | `Get_Billing_Summary_EU` | Energy & Utilities | Summarizes billing information including charges, payments, and balance | Energy & Utilities Cloud |
| 158 | Start/Stop Service | `Start_Stop_Service` | Energy & Utilities | Initiates a start-service or stop-service order | Energy & Utilities Cloud |

### Communications Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 159 | Get Subscriber Summary | `Get_Subscriber_Summary` | Communications | Summarizes a subscriber's account, plans, and usage | Communications Cloud |
| 160 | Troubleshoot Service Issue | `Troubleshoot_Service_Issue` | Communications | Runs diagnostic workflows for service issues (connectivity, billing, etc.) | Communications Cloud |
| 161 | Create Service Order (Telco) | `Create_Telco_Service_Order` | Communications | Creates a telecommunications service order (add line, change plan, etc.) | Communications Cloud |

### Media Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 162 | Get Subscription Summary | `Get_Subscription_Summary` | Media | Summarizes a media subscription including plan, add-ons, and billing | Media Cloud |
| 163 | Manage Subscription | `Manage_Subscription` | Media | Processes subscription changes (upgrade, downgrade, cancel, pause) | Media Cloud |

### Public Sector

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 164 | Get Application Status | `Get_Application_Status` | Public Sector | Checks the status of a permit, license, or benefit application | Public Sector Solutions |
| 165 | Create Application | `Create_Application_PS` | Public Sector | Creates a new application for a public sector program | Public Sector Solutions |
| 166 | Get Inspection Summary | `Get_Inspection_Summary` | Public Sector | Summarizes inspection results and violations | Public Sector Solutions |

### Education Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 167 | Get Student Summary | `Get_Student_Summary` | Education | Summarizes a student's academic record, enrollment, and advising notes | Education Cloud |
| 168 | Create Advising Appointment | `Create_Advising_Appointment` | Education | Schedules an advising appointment for a student | Education Cloud |
| 169 | Get Program Enrollment Status | `Get_Program_Enrollment` | Education | Retrieves enrollment status for a student in a specific program | Education Cloud |

### Nonprofit Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 170 | Get Donation Summary | `Get_Donation_Summary` | Nonprofit | Summarizes donation history and giving patterns for a donor | Nonprofit Cloud |
| 171 | Create Gift Entry | `Create_Gift_Entry` | Nonprofit | Creates a gift/donation record | Nonprofit Cloud |
| 172 | Get Program Participant Summary | `Get_Program_Participant` | Nonprofit | Summarizes a program participant's engagement and outcomes | Nonprofit Cloud |

### Net Zero Cloud

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 173 | Get Emissions Summary | `Get_Emissions_Summary` | Net Zero | Summarizes carbon emissions data for a reporting period | Net Zero Cloud |
| 174 | Create Emission Record | `Create_Emission_Record` | Net Zero | Creates an emissions data record | Net Zero Cloud |

---

## 8. Platform / General Actions

### Record Operations

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 175 | Create Record | `Create_Record` | General | Creates a record on any standard or custom object | All editions |
| 176 | Get Record | `Get_Record` | General | Retrieves a record by ID from any object | All editions |
| 177 | Update Record | `Update_Record` | General | Updates fields on any existing record | All editions |
| 178 | Delete Record | `Delete_Record` | General | Deletes a record by ID | All editions |
| 179 | Get Record Summary | `Get_Record_Summary` | General | Generates an AI summary of any record's key fields and related data | Einstein |
| 180 | List Records | `List_Records` | General | Queries and returns a list of records with filters and sorting | All editions |
| 181 | Get Related Records | `Get_Related_Records` | General | Retrieves child/related records for a parent record | All editions |

### Search

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 182 | Search Records | `Search_Records` | General | Performs a SOSL-based search across objects | All editions |
| 183 | Global Search | `Global_Search` | General | Executes a global search across all searchable objects | All editions |
| 184 | Find Record by Name | `Find_Record_By_Name` | General | Finds a specific record by name or title field | All editions |

### User & Org

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 185 | Get User Info | `Get_User_Info` | General | Retrieves information about the current user or a specified user | All editions |
| 186 | Get Org Info | `Get_Org_Info` | General | Returns organization-level information (edition, features, limits) | All editions |
| 187 | Get Queue Members | `Get_Queue_Members` | General | Lists members of a specified queue | All editions |

### Approval Process

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 188 | Submit for Approval | `Submit_For_Approval` | General | Submits a record for approval processing | All editions |
| 189 | Approve or Reject | `Approve_Or_Reject` | General | Approves or rejects a pending approval request | All editions |

### Chatter / Feed

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 190 | Post to Chatter | `Post_To_Chatter` | General | Posts a message to a Chatter feed (record, group, or user) | All editions |
| 191 | Get Chatter Feed | `Get_Chatter_Feed` | General | Retrieves recent Chatter feed items for a record or group | All editions |

### Notification & Communication

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 192 | Send Notification | `Send_Notification` | General | Sends a custom notification to specified users | All editions |
| 193 | Send Email (Platform) | `Send_Email_Platform` | General | Sends a single email using Salesforce email services | All editions |

### Files & Content

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 194 | Get File | `Get_File` | General | Retrieves a file/content document from Salesforce | All editions |
| 195 | Attach File to Record | `Attach_File_To_Record` | General | Attaches an existing file to a record | All editions |
| 196 | Summarize File | `Summarize_File` | General | Generates an AI summary of a document/file content | Einstein |

---

## 9. Einstein / AI Actions

### Generative AI

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 197 | Draft Email | `Draft_Email` | Einstein | Generates a contextual email draft using AI | Einstein for Sales/Service |
| 198 | Summarize Record | `Summarize_Record` | Einstein | Generates a natural-language summary of any record | Einstein |
| 199 | Generate Response | `Generate_Response` | Einstein | Generates a free-form AI response based on context and instructions | Einstein |
| 200 | Draft or Revise Sales Email | `Draft_Or_Revise_Sales_Email` | Einstein | Creates or revises a sales email with tone and context controls | Einstein for Sales |
| 201 | Draft or Revise Service Reply | `Draft_Or_Revise_Service_Reply` | Einstein | Creates or revises a service reply for agent-assisted responses | Einstein for Service |
| 202 | Generate Code (Apex/Flow) | `Generate_Code` | Einstein | Generates Apex code or Flow definitions from natural language descriptions | Einstein for Developers |

### Einstein Search & Classification

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 203 | Einstein Search Answers | `Einstein_Search_Answers` | Einstein | Generates natural-language answers from search results using grounded AI | Einstein Search |
| 204 | Classify Record | `Classify_Record` | Einstein | Uses AI to classify a record (predict picklist values based on text fields) | Einstein |
| 205 | Extract Information | `Extract_Information` | Einstein | Extracts structured data from unstructured text (names, dates, amounts, etc.) | Einstein |

### Einstein Bots (Legacy Bridge)

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 206 | Invoke Einstein Bot Dialog | `Invoke_Bot_Dialog` | Einstein | Invokes a dialog from an existing Einstein Bot (for migration/hybrid scenarios) | Service Cloud (Einstein Bots) |

---

## 10. Flow-Based Actions

These are standard actions that execute built-in Salesforce Flows.

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 207 | Launch Flow | `Launch_Flow` | Platform | Launches a specified autolaunched Flow with provided inputs | All editions |
| 208 | Launch Screen Flow | `Launch_Screen_Flow` | Platform | Launches a screen flow in the user's context for guided interaction | All editions |
| 209 | Run Orchestration | `Run_Orchestration` | Platform | Triggers a Flow Orchestration process | All editions |
| 210 | Get Flow Interview Status | `Get_Flow_Interview_Status` | Platform | Checks the status of a running or paused Flow interview | All editions |
| 211 | Resume Paused Flow | `Resume_Paused_Flow` | Platform | Resumes a paused Flow interview | All editions |

---

## 11. Prompt Template Actions

These standard actions invoke pre-built Salesforce prompt templates.

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 212 | Generate Sales Email | `Prompt_Generate_Sales_Email` | Prompt Template | Invokes the standard sales email generation prompt template | Sales Cloud + Einstein |
| 213 | Generate Case Summary | `Prompt_Generate_Case_Summary` | Prompt Template | Invokes the standard case summarization prompt template | Service Cloud + Einstein |
| 214 | Generate Close Plan | `Prompt_Generate_Close_Plan` | Prompt Template | Invokes the standard deal close plan prompt template | Sales Cloud + Einstein |
| 215 | Generate Knowledge Draft | `Prompt_Generate_Knowledge_Draft` | Prompt Template | Invokes the standard knowledge article drafting prompt template | Service Cloud + Einstein |
| 216 | Generate Field Report | `Prompt_Generate_Field_Report` | Prompt Template | Invokes the standard field service report prompt template | Field Service + Einstein |
| 217 | Generate Call Summary | `Prompt_Generate_Call_Summary` | Prompt Template | Invokes the standard call/meeting summary prompt template | Sales Cloud + Einstein |
| 218 | Generate Record Summary | `Prompt_Generate_Record_Summary` | Prompt Template | Invokes the generic record summarization prompt template | Einstein |
| 219 | Summarize Conversation | `Prompt_Summarize_Conversation` | Prompt Template | Invokes the standard messaging conversation summarization template | Service Cloud + Einstein |

---

## 12. Slack Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 220 | Send Slack Message | `Send_Slack_Message` | Slack | Sends a message to a Slack channel or user | Slack + Salesforce Integration |
| 221 | Create Slack Channel | `Create_Slack_Channel` | Slack | Creates a new Slack channel | Slack + Salesforce Integration |
| 222 | Search Slack Messages | `Search_Slack_Messages` | Slack | Searches Slack message history | Slack + Salesforce Integration |
| 223 | Summarize Slack Channel | `Summarize_Slack_Channel` | Slack | Generates an AI summary of recent Slack channel activity | Slack + Salesforce + Einstein |
| 224 | Post to Slack Swarm | `Post_To_Slack_Swarm` | Slack | Posts an update to a Slack-based service swarm channel | Slack + Service Cloud (Swarming) |

---

## 13. Tableau Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 225 | Get Tableau Visualization | `Get_Tableau_Viz` | Tableau | Retrieves and displays a Tableau visualization in the agent context | Tableau + Salesforce |
| 226 | Query Tableau Data | `Query_Tableau_Data` | Tableau | Queries Tableau data sources using natural language | Tableau + Salesforce |
| 227 | Explain Tableau Dashboard | `Explain_Tableau_Dashboard` | Tableau | Provides an AI explanation of insights from a Tableau dashboard | Tableau + Einstein |

---

## Data Cloud Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 228 | Get Unified Profile | `Get_Unified_Profile` | Data Cloud | Retrieves the unified customer profile from Data Cloud | Data Cloud |
| 229 | Get Customer 360 Summary | `Get_Customer_360_Summary` | Data Cloud | Generates an AI summary of the unified customer profile and engagement data | Data Cloud + Einstein |
| 230 | Query Data Cloud | `Query_Data_Cloud` | Data Cloud | Executes a query against Data Cloud data model objects | Data Cloud |
| 231 | Get Calculated Insights | `Get_Calculated_Insights` | Data Cloud | Retrieves calculated insights (metrics) for a customer profile | Data Cloud |
| 232 | Run Segmentation | `Run_Segmentation` | Data Cloud | Creates or runs a segmentation against Data Cloud profiles | Data Cloud |
| 233 | Get Identity Resolution Summary | `Get_Identity_Resolution` | Data Cloud | Summarizes identity resolution results for a customer profile | Data Cloud |

---

## Experience Cloud / Community Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 234 | Search Community Content | `Search_Community_Content` | Experience Cloud | Searches Experience Cloud site content (articles, discussions, files) | Experience Cloud |
| 235 | Create Community Post | `Create_Community_Post` | Experience Cloud | Creates a post in an Experience Cloud community | Experience Cloud |
| 236 | Get Community User Info | `Get_Community_User_Info` | Experience Cloud | Retrieves information about an Experience Cloud site user | Experience Cloud |

---

## OmniStudio Actions

| # | Action Name | API Name | Topic | Description | License |
|---|------------|----------|-------|-------------|---------|
| 237 | Run Integration Procedure | `Run_Integration_Procedure` | OmniStudio | Executes an OmniStudio Integration Procedure | OmniStudio |
| 238 | Launch OmniScript | `Launch_OmniScript` | OmniStudio | Launches an OmniScript guided process | OmniStudio |
| 239 | Run DataRaptor | `Run_DataRaptor` | OmniStudio | Executes a DataRaptor transformation | OmniStudio |
| 240 | Run Expression Set | `Run_Expression_Set` | OmniStudio | Evaluates a Decision Matrix or Expression Set | OmniStudio |

---

## Appendix A: Actions by Required License

| License | Action Count | Categories |
|---------|-------------|------------|
| All Editions (Platform) | ~25 | Record CRUD, Search, Chatter, Approval, Notification |
| Sales Cloud | ~30 | Opportunity, Lead, Account, Contact, Activity, Forecast |
| Service Cloud | ~35 | Case, Knowledge, Work Order, Incident, Messaging, SLA |
| Commerce Cloud | ~14 | Order, Cart, Returns, Inventory, Recommendations |
| Marketing Cloud | ~11 | Campaign, Email, Segment, Journey, SMS |
| Field Service | ~11 | Appointment, Technician, Asset, Parts |
| Financial Services Cloud | ~12 | Financial Account, Portfolio, KYC, Claims, Policy |
| Health Cloud | ~12 | Patient, Care Plan, Provider, Referral, Medication |
| Life Sciences Cloud | ~6 | HCP, Clinical Trial, Sample, Adverse Event |
| Einstein (add-on) | ~15 | AI drafting, summarization, classification, search |
| CRM Analytics | ~7 | Dashboard, Report, Prediction, SAQL |
| Data Cloud | ~6 | Unified Profile, Segmentation, Identity Resolution |
| Other Industry Clouds | ~15+ | Varies by cloud |

## Appendix B: Discovering Actions in Your Org

To see which standard actions are available in your specific org:

1. **Setup UI**: Setup > Einstein Copilot > Actions (or Setup > Agent Studio > Actions)
2. **API**: Query `AgentAction` or `CopilotAction` metadata
3. **Metadata API**: Retrieve `GenAiFunction` metadata type
4. **SOQL**: `SELECT DeveloperName, MasterLabel, IsActive FROM GenAiFunction WHERE IsStandard = true`

> **Note**: Available actions depend on your org's edition, licensed clouds, enabled features, and Salesforce release version. Not all actions listed here will appear in every org.

## Appendix C: Enabling Standard Actions

Standard actions must typically be:
1. **Activated** in Setup > Agent Actions (toggle to Active)
2. **Assigned to a Topic** or Agent before they can be used
3. **Permissions verified** - the running user or agent user must have access to the underlying objects and fields

Some actions require additional setup:
- Knowledge actions require Knowledge to be enabled
- Field Service actions require FSL managed package
- Industry actions require the relevant industry cloud license and configuration
- Commerce actions require a configured B2B or B2C storefront
- Slack actions require the Salesforce for Slack integration
- Data Cloud actions require Data Cloud provisioning and data stream configuration
