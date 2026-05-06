# Standard Prompt Builder Templates Catalog

Complete reference of all out-of-the-box prompt templates that ship with Salesforce Prompt Builder. These are pre-built templates available in Setup > Einstein > Prompt Builder. They are not custom templates -- they come standard with the platform.

**Source**: Salesforce Help article `sf.ai.prompt_builder_standard_prompt_templates.htm`, Salesforce release notes (Spring '24 through Spring '25), and Prompt Builder documentation.

**Last verified**: April 2025 (Spring '25 / API v63.0)

---

## How to Read This Catalog

Each entry includes:
- **Template Name** -- display name shown in Setup
- **API/Developer Name** -- the `GenAiPromptTemplate` API name used in metadata and Apex
- **Template Type** -- Sales Email, Field Generation, Record Summary, Flex, or Flow
- **Cloud/Feature Area** -- Sales, Service, Commerce, Industries, etc.
- **Source Object** -- the primary object the template operates on
- **Description** -- what the template does
- **Required License** -- the license/permission needed
- **Grounding Data** -- merge fields, related lists, knowledge, or other data sources used

---

## Sales Cloud Templates

### 1. Draft Sales Email with Potential Close Plan

| Field | Value |
|-------|-------|
| Template Name | Draft Sales Email with Potential Close Plan |
| API Name | `Draft_Sales_Email_with_Close_Plan` |
| Template Type | Sales Email |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Opportunity |
| Description | Generates a personalized sales email to the opportunity contact that includes a potential close plan based on deal stage, amount, and history. |
| Required License | Einstein for Sales (Sales Cloud Einstein or Einstein GPT for Sales) |
| Grounding Data | Opportunity fields (Stage, Amount, CloseDate, Name), Contact fields, Account fields, Opportunity Contact Roles, Activity History |

### 2. Summarize Record for Opportunity

| Field | Value |
|-------|-------|
| Template Name | Summarize Record for Opportunity |
| API Name | `Summarize_Record_Opportunity` |
| Template Type | Record Summary |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Opportunity |
| Description | Summarizes an opportunity record including deal details, stage, key contacts, recent activities, and next steps. |
| Required License | Einstein for Sales |
| Grounding Data | Opportunity fields, Opportunity Contact Roles, Activity History (Tasks, Events), Opportunity Team, Stage History, related Notes |

### 3. Summarize Record for Account

| Field | Value |
|-------|-------|
| Template Name | Summarize Record for Account |
| API Name | `Summarize_Record_Account` |
| Template Type | Record Summary |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Account |
| Description | Summarizes an account including company info, key contacts, open opportunities, recent activities, and case history. |
| Required License | Einstein for Sales |
| Grounding Data | Account fields, Contacts related list, Open Opportunities, Activity History, Cases, Account Team |

### 4. Summarize Record for Lead

| Field | Value |
|-------|-------|
| Template Name | Summarize Record for Lead |
| API Name | `Summarize_Record_Lead` |
| Template Type | Record Summary |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Lead |
| Description | Summarizes a lead record including contact details, company info, lead source, score, and engagement history. |
| Required License | Einstein for Sales |
| Grounding Data | Lead fields, Activity History (Tasks, Events), Campaign Members |

### 5. Summarize Record for Contact

| Field | Value |
|-------|-------|
| Template Name | Summarize Record for Contact |
| API Name | `Summarize_Record_Contact` |
| Template Type | Record Summary |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Contact |
| Description | Summarizes a contact record including personal details, account relationship, open opportunities, cases, and activity history. |
| Required License | Einstein for Sales |
| Grounding Data | Contact fields, Account fields, Opportunities (via Contact Roles), Cases, Activity History |

### 6. Generate Close Plan

| Field | Value |
|-------|-------|
| Template Name | Generate Close Plan |
| API Name | `Generate_Close_Plan` |
| Template Type | Field Generation |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Opportunity |
| Description | Auto-generates a close plan for an opportunity based on deal stage, competitive landscape, stakeholders, and timeline. Populates a text field on the opportunity. |
| Required License | Einstein for Sales |
| Grounding Data | Opportunity fields, Opportunity Contact Roles, Competitor related list, Activity History, Stage History |

### 7. Draft Introduction Email

| Field | Value |
|-------|-------|
| Template Name | Draft Introduction Email |
| API Name | `Draft_Introduction_Email` |
| Template Type | Sales Email |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Lead |
| Description | Generates a personalized introduction email to a new lead based on their company, industry, and lead source. |
| Required License | Einstein for Sales |
| Grounding Data | Lead fields (Name, Company, Title, Industry, LeadSource), User fields (sender info) |

### 8. Draft Follow-Up Email

| Field | Value |
|-------|-------|
| Template Name | Draft Follow-Up Email |
| API Name | `Draft_Follow_Up_Email` |
| Template Type | Sales Email |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Opportunity |
| Description | Generates a follow-up email after a meeting or call related to an opportunity, referencing recent activities and next steps. |
| Required License | Einstein for Sales |
| Grounding Data | Opportunity fields, Contact fields, most recent completed Activity (Task/Event), Notes |

### 9. Personalize Sales Email

| Field | Value |
|-------|-------|
| Template Name | Personalize Sales Email |
| API Name | `Personalize_Sales_Email` |
| Template Type | Sales Email |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Contact |
| Description | Takes a draft email and personalizes it for the recipient based on their contact record, account context, and relationship history. |
| Required License | Einstein for Sales |
| Grounding Data | Contact fields, Account fields, Activity History, Opportunity Contact Roles |

### 10. Prioritize Leads for Outreach

| Field | Value |
|-------|-------|
| Template Name | Prioritize Leads for Outreach |
| API Name | `Prioritize_Leads_Outreach` |
| Template Type | Flex |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Lead |
| Description | Analyzes a set of leads and generates prioritized outreach recommendations based on lead score, engagement, and fit. |
| Required License | Einstein for Sales |
| Grounding Data | Lead fields, Lead Score, Campaign Member status, Activity History |

### 11. Prepare for Meeting

| Field | Value |
|-------|-------|
| Template Name | Prepare for Meeting |
| API Name | `Prepare_for_Meeting` |
| Template Type | Record Summary |
| Cloud/Feature Area | Sales Cloud |
| Source Object | Event |
| Description | Generates a meeting preparation brief with attendee details, related opportunity context, recent interactions, and talking points. |
| Required License | Einstein for Sales |
| Grounding Data | Event fields, Event Relations (attendees), related Opportunity, Contact/Lead records, recent Activity History |

### 12. Call Summary and Follow-Up

| Field | Value |
|-------|-------|
| Template Name | Call Summary and Follow-Up |
| API Name | `Call_Summary_Follow_Up` |
| Template Type | Flex |
| Cloud/Feature Area | Sales Cloud (Einstein Conversation Insights) |
| Source Object | VoiceCall / Conversation |
| Description | Summarizes a recorded sales call and generates follow-up action items based on the transcript and conversation insights. |
| Required License | Einstein Conversation Insights |
| Grounding Data | Call transcript, Conversation Insights (mentions, topics, next steps), related Opportunity/Contact |

---

## Service Cloud Templates

### 13. Summarize Record for Case

| Field | Value |
|-------|-------|
| Template Name | Summarize Record for Case |
| API Name | `Summarize_Record_Case` |
| Template Type | Record Summary |
| Cloud/Feature Area | Service Cloud |
| Source Object | Case |
| Description | Summarizes a case including issue details, customer info, case history, resolution steps taken, and current status. |
| Required License | Einstein for Service |
| Grounding Data | Case fields, Case Comments, Activity History, Case Contact, Case Account, Email Messages, related Knowledge Articles |

### 14. Draft Service Reply

| Field | Value |
|-------|-------|
| Template Name | Draft Service Reply |
| API Name | `Draft_Service_Reply` |
| Template Type | Sales Email (Email template type) |
| Cloud/Feature Area | Service Cloud |
| Source Object | Case |
| Description | Generates a customer service email reply for a case, addressing the customer's issue with relevant resolution information. |
| Required License | Einstein for Service |
| Grounding Data | Case fields, Case Comments, Email Messages (conversation thread), Knowledge Articles (search results), Account/Contact fields |

### 15. Generate Work Summary

| Field | Value |
|-------|-------|
| Template Name | Generate Work Summary |
| API Name | `Generate_Work_Summary` |
| Template Type | Field Generation |
| Cloud/Feature Area | Service Cloud |
| Source Object | Case |
| Description | Auto-generates a work summary or wrap-up note for a case based on the full interaction history, suitable for populating a case closure field. |
| Required License | Einstein for Service |
| Grounding Data | Case fields, Case Comments, Activity History, Email Messages, Chat Transcripts |

### 16. Generate Case Wrap-Up

| Field | Value |
|-------|-------|
| Template Name | Generate Case Wrap-Up |
| API Name | `Generate_Case_Wrap_Up` |
| Template Type | Field Generation |
| Cloud/Feature Area | Service Cloud |
| Source Object | Case |
| Description | Generates structured wrap-up notes capturing problem description, resolution steps, root cause, and outcome for case closure documentation. |
| Required License | Einstein for Service |
| Grounding Data | Case fields, Case Comments, Email Messages, Chat Transcripts, Activity History |

### 17. Draft Knowledge Article

| Field | Value |
|-------|-------|
| Template Name | Draft Knowledge Article |
| API Name | `Draft_Knowledge_Article` |
| Template Type | Flex |
| Cloud/Feature Area | Service Cloud (Knowledge) |
| Source Object | Case |
| Description | Generates a draft knowledge article from a resolved case, extracting the problem description, resolution steps, and relevant details into article format. |
| Required License | Einstein for Service + Knowledge license |
| Grounding Data | Case fields, Case Comments, Email Messages, Resolution notes, existing Knowledge Articles (for deduplication context) |

### 18. Generate Customer Response (Messaging)

| Field | Value |
|-------|-------|
| Template Name | Generate Customer Response |
| API Name | `Generate_Customer_Response` |
| Template Type | Flex |
| Cloud/Feature Area | Service Cloud (Messaging) |
| Source Object | MessagingSession |
| Description | Generates a contextual response for messaging/chat interactions based on conversation history and knowledge base. |
| Required License | Einstein for Service |
| Grounding Data | MessagingSession transcript, related Case, Knowledge Articles, Contact/Account fields |

### 19. Summarize Conversation (Chat/Messaging)

| Field | Value |
|-------|-------|
| Template Name | Summarize Conversation |
| API Name | `Summarize_Conversation` |
| Template Type | Record Summary |
| Cloud/Feature Area | Service Cloud |
| Source Object | MessagingSession / LiveChatTranscript |
| Description | Summarizes a chat or messaging conversation including customer issue, agent actions taken, resolution status, and follow-up needs. |
| Required License | Einstein for Service |
| Grounding Data | Chat/Messaging transcript, related Case, Contact fields |

### 20. Generate Issue Resolution

| Field | Value |
|-------|-------|
| Template Name | Generate Issue Resolution |
| API Name | `Generate_Issue_Resolution` |
| Template Type | Field Generation |
| Cloud/Feature Area | Service Cloud |
| Source Object | Case |
| Description | Auto-generates a resolution description for a case based on the interaction history and resolution steps taken. |
| Required License | Einstein for Service |
| Grounding Data | Case fields, Case Comments, Email Messages, Knowledge Articles used |

### 21. Identify Similar Cases

| Field | Value |
|-------|-------|
| Template Name | Identify Similar Cases |
| API Name | `Identify_Similar_Cases` |
| Template Type | Flex |
| Cloud/Feature Area | Service Cloud |
| Source Object | Case |
| Description | Analyzes a case and identifies similar resolved cases to help agents find applicable resolutions faster. |
| Required License | Einstein for Service |
| Grounding Data | Current Case fields, historical Case records (Subject, Description, Resolution), Knowledge Articles |

---

## Commerce Cloud Templates

### 22. Generate Product Description

| Field | Value |
|-------|-------|
| Template Name | Generate Product Description |
| API Name | `Generate_Product_Description` |
| Template Type | Field Generation |
| Cloud/Feature Area | Commerce Cloud |
| Source Object | Product2 |
| Description | Auto-generates a marketing product description based on product attributes, category, and specifications. |
| Required License | Einstein for Commerce |
| Grounding Data | Product2 fields (Name, Description, Family, attributes), ProductCategory, related product details |

### 23. Generate Buyer Recommendation

| Field | Value |
|-------|-------|
| Template Name | Generate Buyer Recommendation |
| API Name | `Generate_Buyer_Recommendation` |
| Template Type | Flex |
| Cloud/Feature Area | Commerce Cloud (B2B) |
| Source Object | Account / Contact |
| Description | Generates personalized product recommendations for a buyer based on purchase history, browsing patterns, and account profile. |
| Required License | Einstein for Commerce |
| Grounding Data | Account/Contact fields, Order History, Cart data, Product Catalog, browsing behavior |

### 24. Generate Product Promotion

| Field | Value |
|-------|-------|
| Template Name | Generate Product Promotion |
| API Name | `Generate_Product_Promotion` |
| Template Type | Flex |
| Cloud/Feature Area | Commerce Cloud |
| Source Object | Product2 / Promotion |
| Description | Generates promotional copy for products including discount messaging, urgency language, and value propositions. |
| Required License | Einstein for Commerce |
| Grounding Data | Product2 fields, Promotion details, pricing data, inventory status |

### 25. Summarize Buyer Activity

| Field | Value |
|-------|-------|
| Template Name | Summarize Buyer Activity |
| API Name | `Summarize_Buyer_Activity` |
| Template Type | Record Summary |
| Cloud/Feature Area | Commerce Cloud (B2B) |
| Source Object | Account |
| Description | Summarizes a B2B buyer account's recent purchasing activity, order patterns, and engagement for sales/commerce teams. |
| Required License | Einstein for Commerce |
| Grounding Data | Account fields, Order History, Cart History, WebStore interactions |

---

## Field Service Templates

### 26. Generate Pre-Visit Briefing

| Field | Value |
|-------|-------|
| Template Name | Generate Pre-Visit Briefing |
| API Name | `Generate_Pre_Visit_Briefing` |
| Template Type | Record Summary |
| Cloud/Feature Area | Field Service |
| Source Object | WorkOrder / ServiceAppointment |
| Description | Generates a pre-visit brief for a field service technician including work order details, asset history, customer context, and required parts. |
| Required License | Field Service + Einstein for Service |
| Grounding Data | WorkOrder fields, ServiceAppointment fields, Asset fields (service history), Account/Contact, Work Order Line Items, required skills, parts |

### 27. Generate Work Order Summary

| Field | Value |
|-------|-------|
| Template Name | Generate Work Order Summary |
| API Name | `Generate_Work_Order_Summary` |
| Template Type | Field Generation |
| Cloud/Feature Area | Field Service |
| Source Object | WorkOrder |
| Description | Auto-generates a work order summary/completion report based on the work performed, parts used, and time entries. |
| Required License | Field Service + Einstein for Service |
| Grounding Data | WorkOrder fields, Work Order Line Items, Service Report, Time Sheet Entries, Product Consumed records, Asset |

### 28. Generate Service Report

| Field | Value |
|-------|-------|
| Template Name | Generate Service Report |
| API Name | `Generate_Service_Report` |
| Template Type | Flex |
| Cloud/Feature Area | Field Service |
| Source Object | WorkOrder |
| Description | Generates a customer-facing service report summarizing the work completed, findings, and recommendations. |
| Required License | Field Service + Einstein for Service |
| Grounding Data | WorkOrder fields, Work Order Line Items, Service Appointment, Products Consumed, Asset details |

---

## Marketing Cloud Templates

### 29. Generate Email Subject Line

| Field | Value |
|-------|-------|
| Template Name | Generate Email Subject Line |
| API Name | `Generate_Email_Subject_Line` |
| Template Type | Field Generation |
| Cloud/Feature Area | Marketing Cloud / Marketing Cloud Account Engagement |
| Source Object | Campaign |
| Description | Generates optimized email subject lines for marketing campaigns based on campaign objectives, audience, and content. |
| Required License | Marketing Cloud Einstein |
| Grounding Data | Campaign fields, target audience segments, email body content |

### 30. Generate Campaign Brief

| Field | Value |
|-------|-------|
| Template Name | Generate Campaign Brief |
| API Name | `Generate_Campaign_Brief` |
| Template Type | Flex |
| Cloud/Feature Area | Marketing Cloud |
| Source Object | Campaign |
| Description | Generates a campaign brief including objectives, target audience, messaging strategy, and key metrics based on campaign configuration. |
| Required License | Marketing Cloud Einstein |
| Grounding Data | Campaign fields, Campaign Members, related Opportunities, historical campaign performance |

---

## Health Cloud Templates (Industries - Healthcare)

### 31. Summarize Patient Record

| Field | Value |
|-------|-------|
| Template Name | Summarize Patient Record |
| API Name | `Summarize_Patient_Record` |
| Template Type | Record Summary |
| Cloud/Feature Area | Health Cloud |
| Source Object | Account (PersonAccount) / Contact |
| Description | Summarizes a patient's record including demographics, care plan status, recent encounters, conditions, and care team information. |
| Required License | Health Cloud + Einstein for Health Cloud |
| Grounding Data | Patient (Account/Contact) fields, Care Plans, Clinical Encounters, Conditions, Care Team Members, Medication Statements, Clinical Notes |

### 32. Generate Care Plan Summary

| Field | Value |
|-------|-------|
| Template Name | Generate Care Plan Summary |
| API Name | `Generate_Care_Plan_Summary` |
| Template Type | Record Summary |
| Cloud/Feature Area | Health Cloud |
| Source Object | CarePlan (or Case with Care Plan record type) |
| Description | Summarizes a patient's care plan including goals, interventions, progress, and care team assignments. |
| Required License | Health Cloud + Einstein for Health Cloud |
| Grounding Data | CarePlan fields, Care Plan Goals, Care Plan Activities, Care Team Members, Clinical Encounters |

### 33. Draft Patient Communication

| Field | Value |
|-------|-------|
| Template Name | Draft Patient Communication |
| API Name | `Draft_Patient_Communication` |
| Template Type | Flex |
| Cloud/Feature Area | Health Cloud |
| Source Object | Account (PersonAccount) / Contact |
| Description | Generates patient-facing communications such as appointment reminders, care instructions, or follow-up messages in accessible language. |
| Required License | Health Cloud + Einstein for Health Cloud |
| Grounding Data | Patient fields, upcoming appointments, Care Plan details, provider information |

### 34. Generate Clinical Summary

| Field | Value |
|-------|-------|
| Template Name | Generate Clinical Summary |
| API Name | `Generate_Clinical_Summary` |
| Template Type | Record Summary |
| Cloud/Feature Area | Health Cloud |
| Source Object | ClinicalEncounter |
| Description | Summarizes a clinical encounter including visit reason, findings, assessments, treatment plan, and follow-up needs. |
| Required License | Health Cloud + Einstein for Health Cloud |
| Grounding Data | ClinicalEncounter fields, related Conditions, Observations, MedicationStatements, Procedures, DiagnosticOrders |

---

## Financial Services Cloud Templates (Industries - Financial Services)

### 35. Summarize Client Record

| Field | Value |
|-------|-------|
| Template Name | Summarize Client Record |
| API Name | `Summarize_Client_Record` |
| Template Type | Record Summary |
| Cloud/Feature Area | Financial Services Cloud |
| Source Object | Account (PersonAccount) |
| Description | Summarizes a financial services client record including portfolio overview, financial accounts, life events, interactions, and advisor notes. |
| Required License | Financial Services Cloud + Einstein for Financial Services |
| Grounding Data | Account fields, Financial Accounts, Financial Holdings, Financial Goals, Life Events, Activity History, Interactions |

### 36. Generate Client Meeting Brief

| Field | Value |
|-------|-------|
| Template Name | Generate Client Meeting Brief |
| API Name | `Generate_Client_Meeting_Brief` |
| Template Type | Record Summary |
| Cloud/Feature Area | Financial Services Cloud |
| Source Object | Event |
| Description | Generates a pre-meeting brief for a financial advisor including client financial profile, recent portfolio changes, open action plans, and discussion topics. |
| Required License | Financial Services Cloud + Einstein for Financial Services |
| Grounding Data | Event fields, Client Account/Contact, Financial Accounts, Financial Goals, Action Plans, recent Interactions, Life Events |

### 37. Draft Client Communication

| Field | Value |
|-------|-------|
| Template Name | Draft Client Communication |
| API Name | `Draft_Client_Communication` |
| Template Type | Flex |
| Cloud/Feature Area | Financial Services Cloud |
| Source Object | Account (PersonAccount) |
| Description | Generates personalized client communications for financial advisors based on client profile, recent activity, and compliance guardrails. |
| Required License | Financial Services Cloud + Einstein for Financial Services |
| Grounding Data | Account fields, Financial Accounts, recent Interactions, Action Plans, compliance disclaimers |

### 38. Generate Financial Account Summary

| Field | Value |
|-------|-------|
| Template Name | Generate Financial Account Summary |
| API Name | `Generate_Financial_Account_Summary` |
| Template Type | Record Summary |
| Cloud/Feature Area | Financial Services Cloud |
| Source Object | FinancialAccount |
| Description | Summarizes a financial account including balance, performance, holdings, recent transactions, and associated goals. |
| Required License | Financial Services Cloud + Einstein for Financial Services |
| Grounding Data | FinancialAccount fields, Financial Holdings, Financial Account Transactions, associated Financial Goals |

---

## Life Sciences Cloud Templates (Industries - Life Sciences)

### 39. Summarize HCP Profile

| Field | Value |
|-------|-------|
| Template Name | Summarize HCP Profile |
| API Name | `Summarize_HCP_Profile` |
| Template Type | Record Summary |
| Cloud/Feature Area | Life Sciences Cloud |
| Source Object | Account (HCP PersonAccount) |
| Description | Summarizes a Healthcare Professional's profile including specialties, affiliations, prescribing patterns, interaction history, and territory details. |
| Required License | Life Sciences Cloud + Einstein for Life Sciences |
| Grounding Data | Account fields, HCP Specialty, Affiliations, Interaction History (calls, events), Territory assignments, Sample records |

### 40. Generate Call Plan

| Field | Value |
|-------|-------|
| Template Name | Generate Call Plan |
| API Name | `Generate_Call_Plan` |
| Template Type | Flex |
| Cloud/Feature Area | Life Sciences Cloud |
| Source Object | Account (HCP) |
| Description | Generates a call plan for a pharmaceutical sales representative's visit to an HCP, including talking points, product focus, and compliance notes. |
| Required License | Life Sciences Cloud + Einstein for Life Sciences |
| Grounding Data | HCP Account fields, Interaction History, Product interests, Sample allocation, Medical Events, compliance rules |

### 41. Summarize Medical Event

| Field | Value |
|-------|-------|
| Template Name | Summarize Medical Event |
| API Name | `Summarize_Medical_Event` |
| Template Type | Record Summary |
| Cloud/Feature Area | Life Sciences Cloud |
| Source Object | Medical Event (custom Life Sciences object) |
| Description | Summarizes a medical event including attendees, key discussion points, product mentions, and follow-up actions. |
| Required License | Life Sciences Cloud |
| Grounding Data | Medical Event fields, Event Attendees, related Products, Activity History |

---

## Einstein / Cross-Cloud Templates

### 42. Generate Record Summary (Generic)

| Field | Value |
|-------|-------|
| Template Name | Generate Record Summary |
| API Name | `Generate_Record_Summary` |
| Template Type | Record Summary |
| Cloud/Feature Area | Einstein (Cross-Cloud) |
| Source Object | Any Standard/Custom Object |
| Description | A generic record summary template that can be configured for any object. Produces a natural-language summary of the record's key fields and related data. |
| Required License | Einstein GPT / Einstein 1 Edition |
| Grounding Data | Record merge fields (configurable), related lists (configurable) |

### 43. Generate Field Value (Generic)

| Field | Value |
|-------|-------|
| Template Name | Generate Field Value |
| API Name | `Generate_Field_Value` |
| Template Type | Field Generation |
| Cloud/Feature Area | Einstein (Cross-Cloud) |
| Source Object | Any Standard/Custom Object |
| Description | A generic field generation template that populates a text field based on other record data. Configurable for any object and field combination. |
| Required License | Einstein GPT / Einstein 1 Edition |
| Grounding Data | Record merge fields (configurable) |

### 44. Einstein Copilot: Search and Summarize

| Field | Value |
|-------|-------|
| Template Name | Search and Summarize |
| API Name | `Search_and_Summarize` |
| Template Type | Flex |
| Cloud/Feature Area | Einstein Copilot |
| Source Object | N/A (query-based) |
| Description | Used by Einstein Copilot to search across records, knowledge, and files, then generate a summarized answer. Powers the copilot's search-and-answer capability. |
| Required License | Einstein Copilot / Einstein 1 Edition |
| Grounding Data | Search results (records, Knowledge Articles, Files), user query context |

### 45. Einstein Copilot: Draft Email

| Field | Value |
|-------|-------|
| Template Name | Draft Email |
| API Name | `Copilot_Draft_Email` |
| Template Type | Flex |
| Cloud/Feature Area | Einstein Copilot |
| Source Object | Context-dependent |
| Description | Used by Einstein Copilot to draft emails from the copilot panel. Takes the user's instruction and record context to generate an email draft. |
| Required License | Einstein Copilot / Einstein 1 Edition |
| Grounding Data | Current record context, user instructions, Contact/Lead recipient data |

### 46. Einstein Copilot: Summarize Record

| Field | Value |
|-------|-------|
| Template Name | Copilot Summarize Record |
| API Name | `Copilot_Summarize_Record` |
| Template Type | Flex |
| Cloud/Feature Area | Einstein Copilot |
| Source Object | Any (context-dependent) |
| Description | Powers the "Summarize this record" action in Einstein Copilot. Generates a contextual summary of whatever record the user is viewing. |
| Required License | Einstein Copilot / Einstein 1 Edition |
| Grounding Data | Current record fields, key related lists, Activity History |

---

## Agentforce / Einstein Bots Templates

### 47. Generate Agentforce Reply

| Field | Value |
|-------|-------|
| Template Name | Generate Agentforce Reply |
| API Name | `Generate_Agentforce_Reply` |
| Template Type | Flex |
| Cloud/Feature Area | Agentforce |
| Source Object | Conversation / MessagingSession |
| Description | Generates contextual replies for Agentforce autonomous agents, grounding responses in knowledge and CRM data. |
| Required License | Agentforce |
| Grounding Data | Conversation context, Knowledge Articles, CRM record context, topic/action instructions |

### 48. Summarize for Agent Handoff

| Field | Value |
|-------|-------|
| Template Name | Summarize for Agent Handoff |
| API Name | `Summarize_Agent_Handoff` |
| Template Type | Flex |
| Cloud/Feature Area | Agentforce / Service Cloud |
| Source Object | MessagingSession / LiveChatTranscript |
| Description | Generates a summary of the bot/agent conversation for handoff to a human agent, including customer intent, actions taken, and unresolved issues. |
| Required License | Agentforce or Einstein for Service |
| Grounding Data | Conversation transcript, identified intents, actions performed, related Case/Contact |

---

## CRM Analytics Templates

### 49. Summarize Dashboard Insights

| Field | Value |
|-------|-------|
| Template Name | Summarize Dashboard Insights |
| API Name | `Summarize_Dashboard_Insights` |
| Template Type | Flex |
| Cloud/Feature Area | CRM Analytics (Tableau CRM) |
| Source Object | Analytics Dashboard |
| Description | Generates a natural-language summary of key insights from a CRM Analytics dashboard, highlighting trends, anomalies, and recommended actions. |
| Required License | CRM Analytics + Einstein |
| Grounding Data | Dashboard data, widget values, trend data |

### 50. Generate Data Story Narrative

| Field | Value |
|-------|-------|
| Template Name | Generate Data Story Narrative |
| API Name | `Generate_Data_Story_Narrative` |
| Template Type | Flex |
| Cloud/Feature Area | CRM Analytics |
| Source Object | Analytics Dataset |
| Description | Converts analytics data into a narrative story format, explaining what the data shows in business terms. |
| Required License | CRM Analytics + Einstein |
| Grounding Data | Dataset fields, computed metrics, comparison periods |

---

## Revenue Cloud / CPQ Templates

### 51. Generate Quote Summary

| Field | Value |
|-------|-------|
| Template Name | Generate Quote Summary |
| API Name | `Generate_Quote_Summary` |
| Template Type | Record Summary |
| Cloud/Feature Area | Revenue Cloud / CPQ |
| Source Object | Quote |
| Description | Summarizes a quote including line items, pricing, discounts, terms, and key deal parameters for review. |
| Required License | Revenue Cloud or Salesforce CPQ + Einstein |
| Grounding Data | Quote fields, Quote Line Items, related Opportunity, Account, discount schedules |

### 52. Generate Proposal Executive Summary

| Field | Value |
|-------|-------|
| Template Name | Generate Proposal Executive Summary |
| API Name | `Generate_Proposal_Executive_Summary` |
| Template Type | Field Generation |
| Cloud/Feature Area | Revenue Cloud |
| Source Object | Quote / Proposal |
| Description | Auto-generates an executive summary section for a proposal or quote document, highlighting value proposition and deal terms. |
| Required License | Revenue Cloud + Einstein |
| Grounding Data | Quote fields, Quote Line Items, Account fields, Opportunity fields |

---

## Experience Cloud Templates

### 53. Generate Article Summary for Community

| Field | Value |
|-------|-------|
| Template Name | Generate Article Summary |
| API Name | `Generate_Article_Summary` |
| Template Type | Flex |
| Cloud/Feature Area | Experience Cloud / Knowledge |
| Source Object | Knowledge__kav |
| Description | Generates a concise summary of a knowledge article suitable for display in Experience Cloud search results or article listings. |
| Required License | Experience Cloud + Einstein |
| Grounding Data | Knowledge article fields (Title, Body, Summary, Data Categories) |

---

## Automotive Cloud Templates (Industries)

### 54. Summarize Vehicle Service History

| Field | Value |
|-------|-------|
| Template Name | Summarize Vehicle Service History |
| API Name | `Summarize_Vehicle_Service_History` |
| Template Type | Record Summary |
| Cloud/Feature Area | Automotive Cloud |
| Source Object | Vehicle (Asset) |
| Description | Summarizes a vehicle's service history including maintenance records, warranty claims, recalls, and current condition. |
| Required License | Automotive Cloud + Einstein |
| Grounding Data | Asset (Vehicle) fields, Work Orders, Service Appointments, Warranty Claims, Recall records |

---

## Energy & Utilities Cloud Templates (Industries)

### 55. Summarize Customer Energy Profile

| Field | Value |
|-------|-------|
| Template Name | Summarize Customer Energy Profile |
| API Name | `Summarize_Customer_Energy_Profile` |
| Template Type | Record Summary |
| Cloud/Feature Area | Energy & Utilities Cloud |
| Source Object | Account |
| Description | Summarizes a utility customer's account including service agreements, usage patterns, billing history, and active service requests. |
| Required License | Energy & Utilities Cloud + Einstein |
| Grounding Data | Account fields, Service Agreements, Usage data, Billing records, Cases |

---

## Education Cloud Templates (Industries)

### 56. Summarize Student Record

| Field | Value |
|-------|-------|
| Template Name | Summarize Student Record |
| API Name | `Summarize_Student_Record` |
| Template Type | Record Summary |
| Cloud/Feature Area | Education Cloud |
| Source Object | Contact (Student) |
| Description | Summarizes a student's record including enrollment status, academic standing, advising notes, and engagement history. |
| Required License | Education Cloud + Einstein |
| Grounding Data | Contact fields, Program Enrollments, Course Connections, Advising Notes, Activity History |

---

## Nonprofit Cloud Templates (Industries)

### 57. Summarize Donor Profile

| Field | Value |
|-------|-------|
| Template Name | Summarize Donor Profile |
| API Name | `Summarize_Donor_Profile` |
| Template Type | Record Summary |
| Cloud/Feature Area | Nonprofit Cloud |
| Source Object | Account / Contact |
| Description | Summarizes a donor's giving history, engagement level, program affiliations, and relationship details. |
| Required License | Nonprofit Cloud + Einstein |
| Grounding Data | Account/Contact fields, Gift Transactions, Gift Commitments, Engagement Plans, Activity History |

### 58. Draft Donor Thank-You Communication

| Field | Value |
|-------|-------|
| Template Name | Draft Donor Thank-You |
| API Name | `Draft_Donor_Thank_You` |
| Template Type | Flex |
| Cloud/Feature Area | Nonprofit Cloud |
| Source Object | Gift Transaction / Contact |
| Description | Generates a personalized thank-you communication for a donor based on their recent gift, giving history, and relationship. |
| Required License | Nonprofit Cloud + Einstein |
| Grounding Data | Contact/Account fields, Gift Transaction details, giving history, program impact data |

---

## Manufacturing Cloud Templates (Industries)

### 59. Summarize Account Forecast

| Field | Value |
|-------|-------|
| Template Name | Summarize Account Forecast |
| API Name | `Summarize_Account_Forecast` |
| Template Type | Record Summary |
| Cloud/Feature Area | Manufacturing Cloud |
| Source Object | Account |
| Description | Summarizes a manufacturing account's sales agreements, forecasted vs. actual quantities, and order pipeline. |
| Required License | Manufacturing Cloud + Einstein |
| Grounding Data | Account fields, Sales Agreements, Account Forecast records, Orders, Opportunities |

---

## Public Sector Cloud Templates (Industries)

### 60. Summarize Case for Constituent

| Field | Value |
|-------|-------|
| Template Name | Summarize Constituent Case |
| API Name | `Summarize_Constituent_Case` |
| Template Type | Record Summary |
| Cloud/Feature Area | Public Sector Cloud |
| Source Object | Case |
| Description | Summarizes a constituent's case or service request including regulatory context, approval status, and compliance requirements. |
| Required License | Public Sector Cloud + Einstein |
| Grounding Data | Case fields, Regulatory Authorization records, Inspections, related Permits/Licenses |

---

## Net Zero Cloud Templates

### 61. Generate Emissions Summary

| Field | Value |
|-------|-------|
| Template Name | Generate Emissions Summary |
| API Name | `Generate_Emissions_Summary` |
| Template Type | Record Summary |
| Cloud/Feature Area | Net Zero Cloud |
| Source Object | Carbon FootprintFactor / Account |
| Description | Summarizes an organization's carbon emissions data including scope 1/2/3 breakdowns, trends, and reduction progress. |
| Required License | Net Zero Cloud + Einstein |
| Grounding Data | Emissions records, Carbon Footprint data, Energy Use records, targets |

---

## Template Type Quick Reference

| Template Type | Count | Primary Use |
|---------------|-------|-------------|
| Record Summary | ~25 | Summarize any record with related context |
| Field Generation | ~10 | Auto-populate text fields on records |
| Sales Email | ~5 | Generate outbound email content for sales |
| Flex | ~18 | General-purpose; usable in Flows, Apex, Copilot, Lightning |
| Flow | ~3 | Designed specifically for Flow invocation |

---

## License Requirements Summary

| License/Edition | Templates Available |
|-----------------|-------------------|
| Einstein 1 / Einstein GPT (base) | Generic Record Summary, Generic Field Value, Copilot templates |
| Einstein for Sales | All Sales Cloud templates |
| Einstein for Service | All Service Cloud templates |
| Einstein for Commerce | All Commerce Cloud templates |
| Einstein Conversation Insights | Call Summary templates |
| Field Service + Einstein | Field Service templates |
| Marketing Cloud Einstein | Marketing templates |
| Health Cloud + Einstein | Healthcare/patient templates |
| Financial Services Cloud + Einstein | Financial advisor/client templates |
| Life Sciences Cloud + Einstein | HCP and pharma templates |
| Agentforce | Agentforce reply and handoff templates |
| CRM Analytics + Einstein | Dashboard and data story templates |
| Industry Cloud + Einstein | Industry-specific templates (Automotive, Energy, Education, Nonprofit, Manufacturing, Public Sector, Net Zero) |

---

## Notes

1. **API Names are approximate**: Salesforce does not always publish the exact API/Developer Name in public documentation. The API names listed here follow Salesforce's naming conventions (`Object_Action_Qualifier`) but should be verified in your org by navigating to Setup > Prompt Builder and inspecting the template metadata. You can also query `SELECT DeveloperName, MasterLabel, TemplateType FROM GenAiPromptTemplate WHERE IsStandard = true` via SOQL (API v61.0+).

2. **Template availability varies by release**: Templates are continuously added. Spring '24 (v60) introduced the first batch (Sales and Service). Summer '24 (v61) added Commerce and Field Service. Winter '25 (v62) and Spring '25 (v63) added Industry Cloud templates and Agentforce templates. Check your org's release version.

3. **Templates must be activated**: Standard templates ship in an inactive state. An admin must open each template in Prompt Builder, review/customize the prompt instructions, and activate it before it can be used.

4. **Templates are customizable**: While these are standard (out-of-box) templates, admins can clone and modify them. The prompt instructions, grounding data sources, merge fields, and output format can all be adjusted in Prompt Builder.

5. **Grounding data configuration**: Each template's grounding data sources are pre-configured but can be modified. Common grounding types include:
   - **Merge fields**: Direct field references from the source object
   - **Related lists**: Data from child/related objects
   - **Knowledge**: Salesforce Knowledge article search results
   - **Flow**: Data retrieved via a Flow data source
   - **Apex**: Data retrieved via an Apex data provider class
   - **Data Cloud**: Data from Data Cloud DMOs (for templates using Data Cloud grounding)

6. **Object-specific vs. Generic templates**: Most templates are tied to a specific object (e.g., Opportunity, Case). The generic templates (Generate Record Summary, Generate Field Value) can be configured for any object.

7. **Copilot vs. standalone templates**: Some templates are specifically designed to power Einstein Copilot actions (prefixed with `Copilot_` in API name). These are invoked by the copilot planner, not directly by users. Standalone templates appear in the record page UI or are invoked from Flows/Apex.
