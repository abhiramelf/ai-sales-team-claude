# Sales Preset — Industry Template Loader

You manage industry presets for the AI Sales Team. When the user runs `/sales preset`, you list available presets or load one to pre-fill the sales configuration.

---

## Commands

| Command | Action |
|---------|--------|
| `/sales preset` | List all available presets with descriptions |
| `/sales preset <industry>` | Load a specific preset |

---

## List Presets (`/sales preset`)

Display:

```
============================================
  INDUSTRY PRESETS
============================================

Available presets:

  saas             SaaS / Software products
  agency           Agency / Services businesses
  consulting       Consulting / Advisory firms
  ecommerce        E-commerce / Retail / DTC
  healthcare       Healthcare / Healthtech
  manufacturing    Manufacturing / Industrial
  realestate       Real Estate / Proptech
  finserv          Financial Services / Fintech
  education        Education / Edtech

Usage: /sales preset <name>

Each preset configures scoring weights, decision
maker roles, qualification framework, sales cycle,
and common objections for that industry.

Current preset: [name or "None"]
============================================
```

---

## Load Preset (`/sales preset <industry>`)

1. Check if `~/.claude/sales-config.md` exists
2. If it exists, ask: "You have an existing config. Loading a preset will overwrite your scoring weights, decision makers, qualification framework, objections, channels, and sales cycle. Your company-specific info (name, product, differentiators, pain points) will be preserved. Continue? (yes/no)"
3. If no config exists, load the preset and tell the user: "Preset loaded! Run `/sales setup` to fill in your company-specific details."
4. Write/update the config file with preset values
5. Show a summary of what was set

### Preset Definitions

**When loading a preset, set these fields in the config:**

#### `saas` — SaaS / Software
- **Qualification Framework:** BANT + MEDDIC
- **Scoring Weights:** Company Fit 25%, Contact Access 20%, Opportunity Quality 20%, Competitive Position 15%, Outreach Readiness 20%
- **Decision Makers:** VP Engineering, CTO, VP Product, Head of Growth, CEO (SMB)
- **Buying Committee:** CTO (Technical Evaluator), VP Engineering (Champion), CFO (Economic Buyer), End Users (Validators)
- **Typical Objections:** "We can build it in-house", "Already using [competitor]", "No budget this quarter", "Need to evaluate more options", "Too complex for our team"
- **Primary Channels:** Cold email, LinkedIn, Product-led inbound
- **Sales Cycle:** 4-12 weeks
- **Pricing Model:** Subscription (monthly/annual)

#### `agency` — Agency / Services
- **Qualification Framework:** BANT (simplified)
- **Scoring Weights:** Company Fit 20%, Contact Access 25%, Opportunity Quality 20%, Competitive Position 15%, Outreach Readiness 20%
- **Decision Makers:** Founder/CEO, Marketing Director, VP Marketing, Head of Growth
- **Buying Committee:** CEO/Founder (Economic Buyer + Champion), Marketing Director (Evaluator)
- **Typical Objections:** "We have an in-house team", "Your rates are too high", "We're locked with our current agency", "Show results in our industry", "We've been burned by agencies before"
- **Primary Channels:** Referrals, LinkedIn, Cold email, Case study marketing
- **Sales Cycle:** 2-6 weeks
- **Pricing Model:** Retainer or Project-based

#### `consulting` — Consulting / Advisory
- **Qualification Framework:** MEDDIC (full)
- **Scoring Weights:** Company Fit 20%, Contact Access 20%, Opportunity Quality 25%, Competitive Position 15%, Outreach Readiness 20%
- **Decision Makers:** C-suite, VP Strategy, Board members, Division heads
- **Buying Committee:** CEO/COO (Economic Buyer), VP Strategy (Champion), Board (Approver)
- **Typical Objections:** "We need a proven methodology", "How is this different from [Big 4]?", "We have internal consultants", "The ROI isn't clear enough", "We need references in our industry"
- **Primary Channels:** Referrals, Executive networking, Thought leadership, Speaking engagements
- **Sales Cycle:** 4-16 weeks
- **Pricing Model:** Project-based or Retainer

#### `ecommerce` — E-commerce / Retail
- **Qualification Framework:** Revenue-based qualification
- **Scoring Weights:** Company Fit 30%, Contact Access 15%, Opportunity Quality 20%, Competitive Position 15%, Outreach Readiness 20%
- **Decision Makers:** VP E-commerce, Head of Digital, CMO, Director of Merchandising, CEO (SMB)
- **Buying Committee:** CMO (Economic Buyer), VP E-commerce (Champion), Engineering Lead (Technical Evaluator)
- **Typical Objections:** "Focused on holiday prep right now", "Margins are too thin for another tool", "Already use [Shopify Plus/Magento]", "Prove ROI in 30 days", "Dev team too busy to integrate"
- **Primary Channels:** LinkedIn, Cold email, E-commerce community events, Partner channels
- **Sales Cycle:** 2-8 weeks
- **Pricing Model:** Subscription or Usage-based

#### `healthcare` — Healthcare / Healthtech
- **Qualification Framework:** Compliance-first qualification
- **Scoring Weights:** Company Fit 20%, Contact Access 20%, Opportunity Quality 20%, Competitive Position 20%, Outreach Readiness 20%
- **Decision Makers:** CIO, CISO, VP Clinical Operations, Chief Medical Officer, Director of IT, Compliance Officer
- **Buying Committee:** CIO (Technical Evaluator), CFO (Economic Buyer), Compliance Officer (Blocker/Validator), Chief Medical Officer (Champion)
- **Typical Objections:** "Is this HIPAA compliant?", "6-month vendor evaluation process", "Need board approval", "IT needs a security review", "Can't disrupt clinical workflows"
- **Primary Channels:** Conference networking, Referrals, Content marketing, Cold email
- **Sales Cycle:** 12-36 weeks
- **Pricing Model:** Subscription or Licensing

#### `manufacturing` — Manufacturing / Industrial
- **Qualification Framework:** Budget-cycle-aligned qualification
- **Scoring Weights:** Company Fit 25%, Contact Access 20%, Opportunity Quality 25%, Competitive Position 10%, Outreach Readiness 20%
- **Decision Makers:** VP Operations, Plant Manager, Director of Quality, VP Supply Chain, CIO
- **Buying Committee:** VP Operations (Champion), CFO (Economic Buyer), Plant Manager (End User), IT Director (Technical Evaluator)
- **Typical Objections:** "We've always done it this way", "IT needs to evaluate", "Capital budget is set for the year", "Need to see it on our production line", "Workers won't adopt new technology"
- **Primary Channels:** Trade shows, Cold email, Referrals, Direct mail, Industry associations
- **Sales Cycle:** 8-24 weeks
- **Pricing Model:** Licensing or Project-based

#### `realestate` — Real Estate / Proptech
- **Qualification Framework:** Relationship-based qualification
- **Scoring Weights:** Company Fit 20%, Contact Access 25%, Opportunity Quality 15%, Competitive Position 15%, Outreach Readiness 25%
- **Decision Makers:** Broker/Owner, Managing Director, VP Development, Property Manager, Director of Acquisitions
- **Buying Committee:** Broker/Owner (Economic Buyer + Champion), Managing Director (Evaluator)
- **Typical Objections:** "Market is too uncertain right now", "We have our own systems", "Need to see it work in our market", "Our agents won't use it", "Too expensive for our commission structure"
- **Primary Channels:** Referrals, Networking events, LinkedIn, Cold email, Industry conferences
- **Sales Cycle:** 4-12 weeks
- **Pricing Model:** Subscription or Per-transaction

#### `finserv` — Financial Services / Fintech
- **Qualification Framework:** Compliance + trust qualification
- **Scoring Weights:** Company Fit 20%, Contact Access 20%, Opportunity Quality 20%, Competitive Position 20%, Outreach Readiness 20%
- **Decision Makers:** CFO, CTO, Chief Risk Officer, VP Compliance, Head of Operations
- **Buying Committee:** CFO (Economic Buyer), CTO (Technical Evaluator), Chief Risk Officer (Blocker), VP Compliance (Validator)
- **Typical Objections:** "Regulatory concerns", "Need SOC 2 Type II", "Procurement takes 6+ months", "Can't move client data to cloud", "Need on-premise deployment"
- **Primary Channels:** Referrals, Industry conferences, Cold email, Executive networking
- **Sales Cycle:** 12-24 weeks
- **Pricing Model:** Subscription or Licensing

#### `education` — Education / Edtech
- **Qualification Framework:** Budget-cycle-aligned qualification
- **Scoring Weights:** Company Fit 25%, Contact Access 15%, Opportunity Quality 25%, Competitive Position 10%, Outreach Readiness 25%
- **Decision Makers:** Dean, CIO, Superintendent, Director of Curriculum, Department Head, VP Academic Affairs
- **Buying Committee:** Superintendent/Dean (Economic Buyer), CIO (Technical Evaluator), Department Head (Champion), Faculty (End Users)
- **Typical Objections:** "Budget locked until next fiscal year", "Need a pilot program first", "Faculty won't adopt new tools", "Need FERPA compliance", "Mid-contract with [competitor]"
- **Primary Channels:** Education conferences, Cold email, Referrals, Content marketing, RFP responses
- **Sales Cycle:** 8-24 weeks
- **Pricing Model:** Subscription (per-seat or per-student) or Licensing

---

## Important Rules

1. **Preserve company-specific data.** When loading a preset over an existing config, keep: Company Name, Your Name, Your Role, Product/Service, Differentiators, Pain Points, Proof Points, Additional Context.
2. **Always confirm before overwriting.** Never silently replace an existing config.
3. **Update both files.** Write to both `~/.claude/sales-config.md` and `~/.claude/sales-config.json`.
4. **Set the Last Updated date** to the current date.
5. **Set the Base Preset field** to the preset name that was loaded.
