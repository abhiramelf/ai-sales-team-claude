# Sales Playbook — Complete Playbook Generator

You generate a comprehensive, ready-to-use sales playbook tailored to the user's business. When the user runs `/sales playbook`, you produce a complete SALES-PLAYBOOK.md document that serves as the definitive reference for their sales team.

## Configuration Context

Before executing, check if `~/.claude/sales-config.md` exists. **This skill requires a config to produce useful output.** If no config exists, tell the user:
"A sales playbook needs to know about your business. Run `/sales setup` first, then come back to `/sales playbook`."

If config exists, read it and use ALL fields to generate a fully personalized playbook.

---

## When Invoked (`/sales playbook`)

### Step 1: Read Config and Existing Files

1. Read `~/.claude/sales-config.md` for all business context
2. Check for existing files in the working directory that can enrich the playbook:
   - `IDEAL-CUSTOMER-PROFILE.md` — Use for ICP section
   - `COMPETITIVE-INTEL*.md` — Use for competitive positioning section
   - `OBJECTION-PLAYBOOK*.md` — Use for objection handling section
   - `OUTREACH-SEQUENCE*.md` — Use for email template section
3. Incorporate existing file content where available; generate from config where not

### Step 2: Generate SALES-PLAYBOOK.md

Write a comprehensive playbook with these sections:

```markdown
# Sales Playbook: [Company Name]

**Generated:** [Date]
**Industry:** [Industry from config]
**Preset:** [Base preset from config]

---

## Table of Contents

1. Company Overview & Value Proposition
2. Ideal Customer Profile
3. Buyer Personas & Buying Committee
4. Sales Process & Stages
5. Qualification Framework
6. Discovery Questions
7. Messaging Framework
8. Email Templates & Sequences
9. Objection Handling Playbook
10. Competitive Battle Cards
11. Closing Techniques
12. Key Metrics & KPIs

---

## 1. Company Overview & Value Proposition

### What We Sell
[From config: Product/Service description]

### Our Differentiators
[From config: Differentiators, expanded with supporting detail]

### Elevator Pitch (30 seconds)
[Generate a concise pitch from config data: problem → solution → proof → CTA]

### Value Proposition Statement
For [target customer] who [pain point], [Company Name] provides [product/service] that [key benefit]. Unlike [competitors], we [key differentiator].

---

## 2. Ideal Customer Profile

### Company Characteristics
| Attribute | Ideal Range |
|-----------|-------------|
| Company Size | [From config: Target Company Size] |
| Industry | [From config: Target Industries] |
| Geography | [From config: Target Geography] |
| Company Stage | [From config: Target Company Stage] |
| Deal Size | [From config: Typical Deal Size] |

### Qualification Signals (Green Flags)
[Generate 5-7 positive signals based on config's industry and target customer]

### Disqualification Signals (Red Flags)
[From config: Disqualifiers, plus generated signals based on industry]

### Best-Fit Indicators
[Generate specific indicators that identify the best prospects in their industry]

---

## 3. Buyer Personas & Buying Committee

[For each role in config's Buying Committee, generate a persona:]

### [Role]: [Title]
- **What they care about:** [role-specific priorities]
- **How they evaluate:** [what criteria matter to this role]
- **Language that resonates:** [phrases and concepts that work]
- **Language to avoid:** [what turns them off]
- **Best outreach channel:** [how to reach them]
- **Typical objections:** [role-specific objections]

---

## 4. Sales Process & Stages

### Our Sales Cycle
**Length:** [From config: Sales Cycle Length]
**Primary Channels:** [From config: Primary Channels]

### Stage Definitions

[Generate stages based on the config's Sales Stages if defined, otherwise use industry-appropriate defaults:]

| Stage | Definition | Exit Criteria | Typical Duration |
|-------|-----------|---------------|-----------------|
| Prospecting | Identifying and researching targets | Prospect qualified via [framework] | [X] days |
| Discovery | First conversation, needs assessment | Pain confirmed, stakeholders identified | [X] days |
| Solution | Presenting solution, demo/proposal | Solution accepted, moving to evaluation | [X] days |
| Evaluation | Technical/business evaluation | All stakeholders aligned | [X] days |
| Negotiation | Terms, pricing, contracts | Agreement on terms | [X] days |
| Closed Won | Deal signed | Contract executed | -- |

---

## 5. Qualification Framework

### [Framework from config] Criteria

[Generate a filled-in qualification framework based on the config's Qualification Framework:]

**If BANT:**
- **Budget:** What budget signals to look for given our [deal size]
- **Authority:** How to identify and access decision makers in [industry]
- **Need:** How to confirm need based on our [pain points]
- **Timeline:** Industry-typical buying timelines and triggers

**If MEDDIC:**
- **Metrics:** Key metrics our customers improve
- **Economic Buyer:** How to find and engage the EB in [industry]
- **Decision Criteria:** Typical evaluation criteria in [industry]
- **Decision Process:** How companies in [industry] buy
- **Identify Pain:** Discovery questions that surface our specific pain points
- **Champion:** How to identify and develop champions

### Scoring Rubric

| Criterion | Strong (8-10) | Moderate (5-7) | Weak (1-4) |
|-----------|--------------|----------------|------------|
| [criterion 1] | [description] | [description] | [description] |
| [criterion 2] | [description] | [description] | [description] |

---

## 6. Discovery Questions

### First Call Questions
[Generate 10-12 discovery questions tailored to the config's pain points, industry, and product:]

1. [Question that uncovers pain point 1]
2. [Question that uncovers pain point 2]
3. [Question about current solution / process]
4. [Question about impact of the problem]
5. [Question about decision-making process]
6. [Question about timeline and urgency]
7. [Question about budget / investment]
8. [Question about past attempts to solve this]
9. [Question about success metrics]
10. [Question about stakeholders involved]

### Follow-Up Questions (Go Deeper)
[Generate 5 probing questions for each major pain point]

### Questions to AVOID
[Generate 3-5 questions that are too generic, too aggressive, or inappropriate for the industry]

---

## 7. Messaging Framework

### Core Messaging

| Element | Message |
|---------|---------|
| **Problem Statement** | [From config's pain points, written as a compelling problem statement] |
| **Solution Statement** | [How the product/service solves it] |
| **Proof Statement** | [From config's proof points] |
| **Differentiation** | [From config's differentiators] |

### Messaging by Persona

[For each buyer persona, provide a tailored message:]

| Persona | Lead With | Proof Point | CTA |
|---------|----------|-------------|-----|
| [Economic Buyer] | [ROI/business impact] | [relevant proof] | [appropriate ask] |
| [Technical Evaluator] | [capabilities/integration] | [relevant proof] | [appropriate ask] |
| [Champion] | [team impact/ease of use] | [relevant proof] | [appropriate ask] |

---

## 8. Email Templates & Sequences

### Cold Outreach Sequence (5 Emails)

[Generate a full 5-email sequence personalized to the config's industry, product, and channels:]

**Email 1 (Day 1): The Hook**
Subject: [subject]
[body — reference a pain point from config]

**Email 2 (Day 3): The Value Add**
Subject: Re: [subject]
[body — share a proof point or insight]

**Email 3 (Day 7): The Social Proof**
Subject: [subject]
[body — reference similar company results]

**Email 4 (Day 14): The New Angle**
Subject: [subject]
[body — approach from a different pain point]

**Email 5 (Day 21): The Breakup**
Subject: [subject]
[body — last touch, leave the door open]

### Follow-Up Templates
[Generate 3-4 follow-up templates for common scenarios: post-meeting, post-demo, post-proposal, gone-dark]

---

## 9. Objection Handling Playbook

[For each objection from config's Typical Objections, plus 5 universal objections:]

### "[Objection text]"
- **What they really mean:** [underlying concern]
- **Response:** "[word-for-word response using config's differentiators and proof points]"
- **Follow-up question:** "[question that moves the conversation forward]"
- **If they persist:** "[fallback response]"

---

## 10. Competitive Battle Cards

[For each competitor in config's Competitive Landscape:]

### vs. [Competitor Name]

| Dimension | Us | Them |
|-----------|----|----|
| [key comparison 1] | [our strength] | [their weakness] |
| [key comparison 2] | [our strength] | [their weakness] |
| [key comparison 3] | [our strength] | [their weakness] |

**Positioning:** [From config's Positioning for this competitor]
**Landmine Questions:** [Questions that expose this competitor's weaknesses]
**When They Come Up:** "[What to say when the prospect mentions this competitor]"

---

## 11. Closing Techniques

[Generate industry-appropriate closing techniques:]

### Recommended Closing Approaches for [Industry]

1. **[Technique Name]**
   - When to use: [situation]
   - Script: "[exact words]"
   - Follow-up if hesitation: "[response]"

2. **[Technique Name]**
   - When to use: [situation]
   - Script: "[exact words]"

3. **[Technique Name]**
   - When to use: [situation]
   - Script: "[exact words]"

### Closing Questions
[5-7 trial close and commitment questions appropriate for the industry]

---

## 12. Key Metrics & KPIs

### Activity Metrics
| Metric | Target | Measurement |
|--------|--------|-------------|
| Prospects researched per week | [suggest based on cycle] | /sales pipeline |
| Outreach emails sent per week | [suggest] | Track manually |
| Discovery calls per week | [suggest] | Track manually |
| Proposals sent per month | [suggest] | /sales pipeline |

### Pipeline Metrics
| Metric | Target | How to Calculate |
|--------|--------|-----------------|
| Pipeline coverage ratio | 3-4x quota | Total pipeline / quota |
| Stage conversion rates | [industry benchmarks] | Deals advancing / deals entering |
| Average deal cycle | [from config] | Close date - first contact |
| Win rate | [industry benchmark] | Deals won / deals in pipeline |

---

*Generated by AI Sales Team — `/sales playbook`*
*Based on: [config's Preset] preset, customized for [Company Name]*
```

### Step 3: Display Summary

After writing the file:

```
============================================
  SALES PLAYBOOK GENERATED
============================================

File:     SALES-PLAYBOOK.md
Sections: 12
Pages:    ~[X] (estimated)

Sections included:
  ✓ Company Overview & Value Proposition
  ✓ Ideal Customer Profile
  ✓ Buyer Personas & Buying Committee
  ✓ Sales Process & Stages
  ✓ Qualification Framework ([framework name])
  ✓ Discovery Questions ([X] questions)
  ✓ Messaging Framework
  ✓ Email Templates (5-email sequence + follow-ups)
  ✓ Objection Handling ([X] objections covered)
  ✓ Competitive Battle Cards ([X] competitors)
  ✓ Closing Techniques
  ✓ Key Metrics & KPIs

Enriched from existing files:
  [✓/✗] IDEAL-CUSTOMER-PROFILE.md
  [✓/✗] COMPETITIVE-INTEL*.md
  [✓/✗] OBJECTION-PLAYBOOK*.md
  [✓/✗] OUTREACH-SEQUENCE*.md

To update: Edit ~/.claude/sales-config.md and
           run /sales playbook again
============================================
```

---

## Important Rules

1. **Every section must be specific.** No placeholders, no "[insert here]", no generic advice. Everything must be tailored to the config.
2. **Scripts must be ready to use.** Email templates, objection responses, and closing scripts should be copy-paste ready.
3. **Incorporate existing files.** If the user already has IDEAL-CUSTOMER-PROFILE.md or COMPETITIVE-INTEL.md, use that data — don't regenerate from scratch.
4. **Industry-appropriate tone.** Healthcare playbooks should be consultative. SaaS can be more direct. Financial services should be trust-building.
5. **Practical over theoretical.** This is a working document for salespeople, not a textbook. Every page should help close deals.
6. **The playbook must be self-contained.** A new sales hire should be able to read this and start selling. Don't reference external documents.
