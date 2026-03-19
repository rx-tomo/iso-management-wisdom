---
name: iso-management-wisdom
description: >-
  Instantly leverage management wisdom grounded in ISO standards. Covers policy
  development, audit preparation, risk assessment, security measures, quality
  management, compliance, ESG, human resources, project management, incident
  response, gap analysis, RACI creation, BCP, and procurement evaluation.
  Addresses any organizational challenge through the expertise of 23 specialist
  roles (CEO/CISO/QMS/PMO, etc.). Also applicable to code review, documentation,
  and organizational design.
---

# ISO Management Wisdom

## Purpose
ISO standards represent widely established management wisdom.
This skill dynamically selects and applies ISO-aligned knowledge accumulated
across 23 organizational roles, matching the context of each request
and converting it immediately into actionable output.

## When to Use (Triggers)
- Designing or reviewing organizational policies, structures, or processes
- Preparing for audits, reviews, or management meetings; checking for gaps
- Designing responses to incidents, accidents, or compliance breaches
- Reviewing codebases or documentation from an ISO perspective
- Comprehensive checks when "unsure what to consider"
- Situations requiring expert judgment in security, quality, compliance, ESG, etc.

## Procedure

### Step 1: Analyze the Request
Identify the following from the user's request:
- **Target domain**: What is the request about? (security / quality / HR / ESG, etc.)
- **Action type**: What does the user want to do? (one of the 5 modes below)
- **Scope**: Target organization / business area / time period
- If anything is unclear, ask the user (up to 3 questions)

### Step 2: Automatic Role Selection
Refer to `references/role-index.md` and select the optimal role(s) (1 to 3) for the request.
For compound issues (e.g., security incident -> CISO + Legal + BCM), combine multiple roles.

### Step 3: Load Role Knowledge
Load the selected role(s) from `references/roles/*.md` (e.g., `governance-ceo.md`, `security-ciso.md`) and
retrieve the relevant ISO standard requirements and checklist items.

### Step 4: Execute Action (5 Modes)

#### Mode A: Advice & Guidance
"Tell me about..." / "What should I consider?"
-> Provide a systematic answer based on ISO standard requirements.

#### Mode B: Document Generation
"I want to create a policy" / "I need a RACI chart" / "I want to write a procedure"
-> Generate a draft using `references/templates/` templates + ISO requirements.

#### Mode C: Check & Review
"I want to audit the current state" / "Audit preparation" / "Review code from an ISO perspective"
-> Output an ISO clause-based gap analysis table or check results.

#### Mode D: Incident Response
"An incident occurred" / "Incident response needed" / "I need corrective action"
-> Automatically combine related roles + produce an initial response checklist + draft report.

#### Mode E: Meeting & Process Design
"Design a management review" / "Agenda for a regular meeting"
-> Produce an ISO clause-based agenda, frequency plan, and minutes template.

### Step 5: Verification
- Confirm that key requirements are reflected in the deliverables
- If gaps remain, supplement with knowledge from additional roles
- Request the user to review the output

## 23 Roles (Automatic Selection Targets)

| Domain | Role | Primary ISO Standards | Keywords |
|---|---|---|---|
| Governance | CEO | 37000, 31000 | Corporate policy, strategy, executive oversight |
| Governance | Board/Governance | 37000, 19011 | Board of directors, oversight, governance |
| Governance | Internal Audit | 19011, 31000 | Internal audit, audit planning, corrective action |
| Risk | ERM | 31000, IEC 31010 | Risk management, risk assessment |
| Risk | Compliance | 37301, 37001 | Compliance, anti-bribery |
| Risk | Legal | 31022, 37301 | Legal affairs, legal risk, contracts |
| Risk | BCM | 22301, 22316 | Business continuity, BCP, resilience |
| Security | CISO/ISMS | 27001, 27002, 27005 | Information security, ISMS, vulnerabilities |
| Security | Privacy/DPO | 27701, 27018 | Privacy, personal data, DPIA |
| Security | ITSM | 20000-1, 27001 | IT service management, change management, SLA |
| Operations | COO | 9001, 9004 | Business planning, process improvement, KPI |
| Operations | PMO | 21503, 21504 | Portfolio management, program management |
| Operations | PM | 21502, 21505 | Project management, WBS, scheduling |
| Operations | QMS | 9001, 9004 | Quality management, quality policy, nonconformity |
| Operations | Procurement | 20400, 14001 | Procurement, supplier evaluation |
| Operations | Customer Support | 18295, 10002 | Customer service, complaint handling, CS |
| Operations | Asset Management | 55001 | Asset management, lifecycle |
| Human Capital | CHRO | 30414, 45001 | Human resources, occupational safety, recruitment |
| Human Capital | HR Analytics | 30414, 30415 | Human capital reporting, D&I, analytics |
| Sustainability | ESG | 26000, 14064 | ESG, SDGs, sustainability |
| Sustainability | Environment | 14001, 14064 | Environmental management, GHG, emissions |
| Sustainability | Energy | 50001 | Energy management, energy efficiency |
| Sustainability | Innovation | 56001 | Innovation, new business development |
