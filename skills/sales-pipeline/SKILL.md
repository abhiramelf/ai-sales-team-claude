# Sales Pipeline — Deal Tracking & Pipeline View

You build a visual pipeline view from prospect analysis files in the current working directory. When the user runs `/sales pipeline`, you scan for generated sales files, categorize deals by stage, calculate pipeline value, and provide actionable next steps for each deal.

## Configuration Context

Before executing, check if `~/.claude/sales-config.md` exists. If it does, read it and:
- Use the config's `Company Name` in the pipeline header
- Apply the config's `Scoring Weights` when interpreting prospect scores
- Use the config's `Sales Stages` (if defined) for pipeline categorization; otherwise use defaults
- Use the config's `Typical Deal Size` for revenue projections when deal size isn't explicit
- Reference the config's `Sales Cycle Length` for expected time-in-stage calculations
- If no config exists, use defaults and suggest `/sales setup`

---

## When Invoked (`/sales pipeline`)

### Step 1: Scan Working Directory

Scan the current directory for all generated sales files:

| File Pattern | Stage Signal | Data to Extract |
|-------------|-------------|-----------------|
| `COMPANY-RESEARCH*.md` | Researched | Company name, industry, size |
| `PROSPECT-ANALYSIS*.md` | Qualified | Prospect score, grade, company name, key decision maker |
| `LEAD-QUALIFICATION*.md` | Qualified | BANT score, qualification status |
| `DECISION-MAKERS*.md` | Contacts Mapped | Number of contacts, primary contact |
| `OUTREACH-SEQUENCE*.md` | Outreach Ready | Target contact, sequence status |
| `FOLLOWUP-SEQUENCE*.md` | Following Up | Follow-up stage, last action |
| `MEETING-PREP*.md` | Meeting Scheduled | Meeting date (if mentioned), attendees |
| `CLIENT-PROPOSAL*.md` | Proposal Sent | Client name, proposed value |
| `COMPETITIVE-INTEL*.md` | Researched | Competitive landscape status |
| `IDEAL-CUSTOMER-PROFILE*.md` | N/A (Reference) | ICP context |

For each file found, extract:
- Company/prospect name (from file header)
- Date generated (from file header or file modification date)
- Key score or status
- Current stage (based on which files exist for this prospect)

### Step 2: Determine Deal Stage

For each unique prospect (identified by company name), determine their pipeline stage based on which files exist:

| Stage | Required Files | Description |
|-------|---------------|-------------|
| **1. Researched** | COMPANY-RESEARCH or COMPETITIVE-INTEL only | Initial research done, not yet qualified |
| **2. Qualified** | PROSPECT-ANALYSIS or LEAD-QUALIFICATION | Scored and qualified, ready for outreach |
| **3. Contacts Mapped** | DECISION-MAKERS | Key contacts identified |
| **4. Outreach Sent** | OUTREACH-SEQUENCE or FOLLOWUP-SEQUENCE | Active outreach in progress |
| **5. Meeting Scheduled** | MEETING-PREP | Meeting preparation completed |
| **6. Proposal Sent** | CLIENT-PROPOSAL | Formal proposal delivered |
| **7. Negotiating** | Multiple files + proposal | Active deal in negotiation |

A prospect's stage is the HIGHEST stage for which files exist. For example, if PROSPECT-ANALYSIS.md and OUTREACH-SEQUENCE.md both exist, the stage is "Outreach Sent".

### Step 3: Calculate Pipeline Value

For each deal:
- If `CLIENT-PROPOSAL*.md` exists and contains pricing, use the proposed value
- If prospect score is available, estimate deal value: `config.typical_deal_size * (prospect_score / 100)`
- If no data, use the config's `Typical Deal Size` as the estimate
- If no config, use "Unknown" for value

**Weighted Pipeline Value** = Sum of (Deal Value * Stage Probability)

| Stage | Probability Weight |
|-------|--------------------|
| Researched | 5% |
| Qualified | 15% |
| Contacts Mapped | 20% |
| Outreach Sent | 25% |
| Meeting Scheduled | 40% |
| Proposal Sent | 60% |
| Negotiating | 80% |

### Step 4: Display Pipeline

```
============================================================
  SALES PIPELINE
============================================================
  [Company Name] | [Date]

STAGE 1: RESEARCHED (5% probability)
─────────────────────────────────────
  [Company A]
    Score: --     Value: $[est]     Age: [X] days
    Next: Run /sales prospect [url] for full analysis

STAGE 2: QUALIFIED (15% probability)
─────────────────────────────────────
  [Company B] ★ Grade: A (85/100)
    Score: 85     Value: $[est]     Age: [X] days
    Contact: [Name], [Title]
    Next: Run /sales outreach [company] to start outreach

  [Company C] — Grade: B (67/100)
    Score: 67     Value: $[est]     Age: [X] days
    Contact: [Name], [Title]
    Next: Run /sales contacts [url] to map decision makers

STAGE 3: CONTACTS MAPPED (20% probability)
──────────────────────────────────────────
  [no deals in this stage]

STAGE 4: OUTREACH SENT (25% probability)
────────────────────────────────────────
  [Company D]
    Score: 78     Value: $[est]     Age: [X] days
    Contact: [Name], [Title]
    Next: Check for responses. Run /sales followup if needed

STAGE 5: MEETING SCHEDULED (40% probability)
────────────────────────────────────────────
  [Company E]
    Score: 91     Value: $[est]     Age: [X] days
    Contact: [Name], [Title]
    Next: Review /sales prep materials before the meeting

STAGE 6: PROPOSAL SENT (60% probability)
────────────────────────────────────────
  [no deals in this stage]

STAGE 7: NEGOTIATING (80% probability)
──────────────────────────────────────
  [no deals in this stage]

────────────────────────────────────────────────────────────

PIPELINE SUMMARY
  Total Deals:              [X]
  Total Pipeline Value:     $[sum]
  Weighted Pipeline Value:  $[weighted sum]

  By Grade:
    A+ (90-100): [X] deals  $[value]
    A  (75-89):  [X] deals  $[value]
    B  (60-74):  [X] deals  $[value]
    C  (40-59):  [X] deals  $[value]
    D  (0-39):   [X] deals  $[value]

PRIORITY ACTIONS
  1. [Highest-priority action based on pipeline state]
  2. [Second priority action]
  3. [Third priority action]
============================================================
```

### Step 5: Priority Actions

Generate 3-5 prioritized actions based on the pipeline state:

- **Stale deals:** If a prospect file is older than 14 days with no progression, flag it: "Follow up with [Company] — no activity in [X] days"
- **High-score idle:** If a prospect scored A/A+ but hasn't progressed past Qualified, flag: "Start outreach for [Company] — high-scoring prospect waiting"
- **Meeting prep needed:** If a meeting prep file exists but is older than 7 days, flag: "Update meeting prep for [Company] — materials may be stale"
- **Empty pipeline:** If fewer than 3 deals, suggest: "Pipeline is thin — run `/sales prospect` on new targets"
- **No proposals:** If deals exist at Outreach/Meeting stage but none at Proposal, suggest: "Consider sending proposals for advanced-stage deals"

---

## Empty Pipeline

If no sales files are found in the current directory:

```
============================================================
  SALES PIPELINE
============================================================

  No prospect files found in the current directory.

  Get started:
    /sales prospect <url>    Analyze a prospect
    /sales research <url>    Research a company
    /sales icp <description> Define your ideal customer

  Tip: All analysis files are saved in the current
  directory. Run /sales pipeline again after analyzing
  some prospects to see your pipeline view.
============================================================
```

---

## Important Rules

1. **Only use real data from files.** Never fabricate prospect names, scores, or values. If a file doesn't contain a score, show "--" not a made-up number.
2. **Match prospects across files.** Use company name matching to group files for the same prospect. Handle slight variations (e.g., "Acme Inc" vs "Acme").
3. **Age calculation.** Use file modification date to calculate deal age in days.
4. **Deal value estimation.** Be transparent about whether value is from a proposal (confirmed) or estimated from config (projected).
5. **Keep it scannable.** The pipeline view should be readable in under 30 seconds. No dense paragraphs — use tables and aligned text.
