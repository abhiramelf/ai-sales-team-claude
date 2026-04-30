# Sales Status — System Diagnostic

You provide a quick status check of the AI Sales Team system. When the user runs `/sales status`, you report on configuration state, available commands, and recent activity.

---

## When Invoked (`/sales status`)

### Step 1: Check Configuration

Read `~/.claude/sales-config.md` and report:

- **Config exists?** Yes/No
- **Active preset:** The preset name from the config, or "Custom" or "None"
- **Completeness:** Percentage of fields filled (see scoring in sales-config skill)
- **Last updated:** Date from the config
- **Missing fields:** List any empty required fields

### Step 2: Check Generated Files

Scan the current working directory for generated sales files:

| File Pattern | Status |
|-------------|--------|
| `PROSPECT-ANALYSIS*.md` | Count found |
| `COMPANY-RESEARCH*.md` | Count found |
| `LEAD-QUALIFICATION*.md` | Count found |
| `DECISION-MAKERS*.md` | Count found |
| `OUTREACH-SEQUENCE*.md` | Count found |
| `FOLLOWUP-SEQUENCE*.md` | Count found |
| `MEETING-PREP*.md` | Count found |
| `CLIENT-PROPOSAL*.md` | Count found |
| `OBJECTION-PLAYBOOK*.md` | Count found |
| `IDEAL-CUSTOMER-PROFILE*.md` | Count found |
| `COMPETITIVE-INTEL*.md` | Count found |
| `SALES-REPORT*.md` | Count found |
| `SALES-REPORT*.pdf` | Count found |
| `SALES-PLAYBOOK*.md` | Count found |

### Step 3: Display Status

```
============================================
  AI SALES TEAM — STATUS
============================================

CONFIGURATION
  Status:        [Configured / Not configured]
  Preset:        [preset name or "None"]
  Completeness:  [X]% ([Y]/20 fields)
  Last Updated:  [date or "Never"]
  [Missing:      field1, field2, ...]

WORKSPACE ([current directory name])
  Prospect Analyses:  [X] files
  Research Reports:   [X] files
  Outreach Sequences: [X] files
  Proposals:          [X] files
  Other Reports:      [X] files
  Total:              [X] sales files

AVAILABLE COMMANDS
  Setup & Config:
    /sales setup          Configure for your business
    /sales config         View/edit configuration
    /sales preset         Load industry preset
    /sales status         This status check

  Research & Analysis:
    /sales prospect <url> Full prospect analysis (5 agents)
    /sales quick <url>    60-second snapshot
    /sales research <url> Company research
    /sales qualify <url>  Lead qualification
    /sales contacts <url> Decision maker identification
    /sales competitors <url> Competitive intelligence

  Outreach & Sales:
    /sales outreach <prospect>  Cold outreach sequence
    /sales followup <prospect>  Follow-up sequence
    /sales prep <url>           Meeting preparation
    /sales proposal <client>    Client proposal
    /sales objections <topic>   Objection playbook

  Strategy & Reporting:
    /sales icp <description>  Ideal Customer Profile
    /sales pipeline           Deal pipeline view
    /sales coach              Sales call coaching
    /sales playbook           Complete sales playbook
    /sales report             Pipeline report (Markdown)
    /sales report-pdf         Pipeline report (PDF)

[SUGGESTIONS based on state:]
============================================
```

### Step 4: Contextual Suggestions

Based on the current state, provide 1-3 actionable suggestions:

**If no config exists:**
- "Run `/sales setup` to configure the system for your business — all commands will produce better results."

**If config is incomplete (<60%):**
- "Your config is [X]% complete. Run `/sales config update <section>` to fill in: [missing fields]."

**If config exists but no prospect files:**
- "You're configured and ready! Try `/sales prospect <url>` to analyze your first prospect."

**If prospect files exist but no outreach:**
- "You have [X] prospect analyses. Run `/sales outreach <prospect>` to generate outreach for your top prospects."

**If multiple analyses exist but no pipeline:**
- "You have [X] prospect analyses. Run `/sales pipeline` to see your deal pipeline."

**If no playbook exists:**
- "Run `/sales playbook` to generate a complete sales playbook tailored to your business."
