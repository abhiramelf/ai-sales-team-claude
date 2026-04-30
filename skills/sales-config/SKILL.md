# Sales Config — View & Edit Configuration

You manage the AI Sales Team configuration. When the user runs `/sales config`, you display, validate, and update the config stored at `~/.claude/sales-config.md`.

---

## Commands

| Command | Action |
|---------|--------|
| `/sales config` | Display current config with completeness score |
| `/sales config update` | Interactive — ask which section to update |
| `/sales config update <section>` | Update a specific section directly |
| `/sales config reset` | Delete current config and start fresh (confirm first) |
| `/sales config export` | Display config in a copyable format |

### Valid Section Names for Update

- `business` — Company name, product, industry, pricing, differentiators
- `customer` — Target company profile, geography, stage, disqualifiers
- `decision-makers` — Decision maker roles and buying committee
- `pain-points` — Pain points and cost of inaction
- `sales-process` — Channels, stages, framework, objections, proof points
- `scoring` — Scoring weight percentages
- `competitors` — Competitor list and positioning
- `context` — Additional context and notes

---

## Display Config (`/sales config`)

1. Read `~/.claude/sales-config.md`
2. If it doesn't exist, display:
   ```
   No sales configuration found.
   Run /sales setup to configure the system for your business.
   ```
3. If it exists, display a formatted summary:

```
============================================
  SALES CONFIGURATION
============================================

BUSINESS
  Company:       [name]
  Product:       [product/service, truncated to 60 chars]
  Industry:      [industry]
  Pricing:       [model] — [deal size range]
  Sales Cycle:   [length]
  Differentiators:
    1. [diff 1]
    2. [diff 2]
    3. [diff 3]

CUSTOMER
  Target Size:   [size range]
  Industries:    [target industries]
  Geography:     [regions]
  Stage:         [company stage]

DECISION MAKERS
  Primary:       [comma-separated titles]
  Buying Committee:
    Economic Buyer:      [role]
    Champion:            [role]
    Technical Evaluator: [role]
    End User:            [role]

PAIN POINTS
  1. [pain point 1]
  2. [pain point 2]
  3. [pain point 3]

SALES PROCESS
  Channels:      [comma-separated channels]
  Framework:     [BANT/MEDDIC/etc.]
  Top Objections:
    1. [objection 1]
    2. [objection 2]
    3. [objection 3]

SCORING WEIGHTS
  Company Fit:         [X]%  ████████░░
  Contact Access:      [X]%  ██████░░░░
  Opportunity Quality: [X]%  ██████░░░░
  Competitive Position:[X]%  ████░░░░░░
  Outreach Readiness:  [X]%  ██████░░░░
                       ---
                       100%

COMPETITORS
  [Competitor 1]: [positioning summary]
  [Competitor 2]: [positioning summary]

Preset: [preset name]
Last Updated: [date]
Completeness: [X]% ([Y] of [Z] fields)
============================================

To update: /sales config update <section>
Sections: business, customer, decision-makers, pain-points,
          sales-process, scoring, competitors, context
```

### Completeness Scoring

Count filled fields out of these 20 core fields:

| # | Field | Required? |
|---|-------|-----------|
| 1 | Company Name | Yes |
| 2 | Your Name | Yes |
| 3 | Product/Service | Yes |
| 4 | Industry | Yes |
| 5 | Pricing Model | Yes |
| 6 | Typical Deal Size | No |
| 7 | Sales Cycle Length | No |
| 8 | Differentiators | Yes |
| 9 | Target Company Size | Yes |
| 10 | Target Industries | No |
| 11 | Target Geography | No |
| 12 | Decision Makers | Yes |
| 13 | Buying Committee | Yes |
| 14 | Pain Points (at least 1) | Yes |
| 15 | Primary Channels | Yes |
| 16 | Qualification Framework | No |
| 17 | Typical Objections | No |
| 18 | Proof Points | No |
| 19 | Scoring Weights | Yes |
| 20 | Competitors | No |

**Scoring:** `(filled_count / 20) * 100`

If completeness is below 60%, suggest: "Your config is incomplete. Run `/sales config update <section>` to fill in the gaps, or `/sales setup` to redo the full setup."

### Bar Chart Rendering

For scoring weight visualization:
- Each bar is 10 characters wide
- 10% = 1 filled block, 20% = 2 filled blocks, etc.
- Filled = `█`, Empty = `░`

---

## Update Config (`/sales config update <section>`)

1. Read current `~/.claude/sales-config.md`
2. Show the user the current values for that section
3. Ask what they want to change
4. Update only the specified fields — preserve everything else
5. Write the updated config back to `~/.claude/sales-config.md`
6. Also update `~/.claude/sales-config.json` to keep it in sync
7. Update the `Last Updated` date
8. Show confirmation with old vs. new values

### Section-Specific Update Flows

**`/sales config update scoring`**
- Show current weights with bars
- Ask for new weights
- Validate they sum to 100%
- If they don't sum to 100%, show the discrepancy and ask the user to adjust

**`/sales config update competitors`**
- Show current competitor list
- Options: Add a competitor, Remove a competitor, Update positioning for an existing competitor
- For each new competitor, ask for the positioning angle

**`/sales config update decision-makers`**
- Show current roles and buying committee
- Allow adding/removing roles
- Re-map buying committee roles if changed

---

## Reset Config (`/sales config reset`)

1. Ask for confirmation: "This will delete your current configuration. Are you sure? (yes/no)"
2. If yes, delete `~/.claude/sales-config.md` and `~/.claude/sales-config.json`
3. Suggest: "Config cleared. Run `/sales setup` to create a new configuration."

---

## Export Config (`/sales config export`)

Display the raw markdown content of `~/.claude/sales-config.md` in a code block so the user can copy it.

---

## Important Rules

1. **Never modify config without user intent.** Only change fields the user explicitly asks to change.
2. **Keep JSON in sync.** Every write to the markdown config must also update the JSON mirror.
3. **Validate scoring weights.** Always ensure they sum to 100%.
4. **Show diffs on update.** When changing a value, show "Old: X" and "New: Y" for clarity.
5. **Preserve formatting.** The markdown config has a specific structure — maintain it exactly.
