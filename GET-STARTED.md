# Get Started — Zero to Selling in 5 Minutes

> **Who is this for?** Anyone who wants to use the AI Sales Team. No coding experience needed. Just follow the steps below.

---

## Choose Your Path

### Path A: Claude Web/Desktop (Easiest — No Installation)

1. Open **[claude.ai](https://claude.ai)** and log in (or open Claude Desktop app)
2. Click **"Projects"** in the left sidebar
3. Click **"Create Project"**
4. Name it: **"My Sales Team"**
5. Click **"Set custom instructions"**
6. Open the file `CLAUDE-PROJECT-PROMPT.md` from this repo (or [view it on GitHub](https://github.com/abhiramelf/ai-sales-team-claude/blob/main/CLAUDE-PROJECT-PROMPT.md))
7. Copy everything **below the first horizontal line** (`---`)
8. Paste it into the custom instructions box
9. Click **"Save"**
10. Start a new conversation in the project and say: **"Let's set up my sales team"**

That's it. Claude will walk you through configuring it for your business.

---

### Path B: Claude Code (Power User — Full Features)

Copy the prompt below and paste it into a new Claude Code session. Claude will handle everything from there.

#### Step 1: Open Claude Code

- **If you have Claude Code installed:** Open your terminal and type `claude`
- **If you don't have it yet:** Visit [claude.ai/download](https://claude.ai/download) to install the Claude Code CLI, then open your terminal and type `claude`

#### Step 2: Paste This Prompt

Copy everything in the box below and paste it as your first message:

---

```
I want to set up the AI Sales Team for Claude Code. I'm not technical — please guide me through every step. Here's what I need you to do:

1. FIRST, clone the repository:
   Run: git clone https://github.com/abhiramelf/ai-sales-team-claude.git ~/ai-sales-team
   Then: cd ~/ai-sales-team

2. THEN, run the installer:
   Run: ./install.sh

3. AFTER the installer finishes, tell me what happened and run: /sales setup

4. Walk me through the setup questions one at a time. Be conversational — explain what each question means and why it matters if I seem unsure.

5. After setup is complete, show me the 3 most useful commands for my specific business and explain what each one does in plain English.

IMPORTANT RULES FOR THIS SESSION:
- After EVERY action you take, tell me what just happened in plain English (no jargon)
- Always end your response with "NEXT STEP:" followed by what I should do or say next
- If something goes wrong, explain what happened and give me the exact fix — don't assume I know how to troubleshoot
- If you need me to make a choice, give me numbered options and tell me which one you recommend
- Use simple language — if you must use a technical term, explain it in parentheses
- Never show me raw error output without explaining what it means

Let's start!
```

---

#### What Happens Next

After pasting, Claude Code will:

1. **Download the AI Sales Team** → You'll see it clone the files (takes ~5 seconds)
2. **Install the skills** → You'll see a list of 21 skills being installed with checkmarks
3. **Start the setup wizard** → Claude will ask you 10 questions about your business, one at a time:
   - What you sell
   - Your industry
   - Your pricing and deal size
   - What makes you different
   - Who your ideal customer is
   - Who you sell to (job titles)
   - What problems you solve
   - Your sales process
   - Your name and company
   - Any other context (competitors, case studies)

4. **Show you your top 3 commands** → Based on your answers, Claude recommends where to start

#### Your First Commands

After setup, try these (just type them in Claude Code):

| What you want to do | What to type |
|---------------------|-------------|
| Research a prospect | `/sales prospect https://company-website.com` |
| Get a quick snapshot | `/sales quick https://company-website.com` |
| Write outreach emails | `/sales outreach "Company Name"` |
| Prepare for a meeting | `/sales prep https://company-website.com` |
| Generate a proposal | `/sales proposal "Client Name"` |
| Handle objections | `/sales objections "topic"` |
| Build your sales playbook | `/sales playbook` |
| See your deal pipeline | `/sales pipeline` |
| Get coaching on a call | `/sales coach` |
| Check system status | `/sales status` |

#### Tips

- **You can talk naturally.** Instead of memorizing commands, just tell Claude what you need: "Research this company for me" or "Write a cold email to the CEO of Acme."
- **Everything saves to files.** After each analysis, Claude saves a detailed report (like `PROSPECT-ANALYSIS.md`) that you can reference later.
- **Your config persists.** Once you set up, every command knows about your business. You don't need to repeat yourself.
- **Update anytime.** Type `/sales config` to see or change your configuration.
- **Switch industries.** Type `/sales preset healthcare` (or any industry) to reconfigure for a different vertical.

---

## Troubleshooting

**"claude: command not found"**
→ Claude Code isn't installed. Visit [claude.ai/download](https://claude.ai/download) and follow the install instructions for your computer (Mac, Windows, or Linux).

**"git: command not found"**
→ Git isn't installed. On Mac, open Terminal and type `xcode-select --install`, then click "Install" when prompted. On Windows, download from [git-scm.com](https://git-scm.com).

**"Permission denied" when running install.sh**
→ Tell Claude: "I got a permission denied error on install.sh" — it will fix it by running `chmod +x install.sh`.

**Setup questions are confusing**
→ Tell Claude: "I'm not sure about this question, can you explain it differently?" — it will rephrase and give you examples.

**Want to start over**
→ Type `/sales setup` again to redo the setup from scratch.

**Something broke**
→ Tell Claude exactly what you see. Copy-paste any error message. Claude will diagnose and fix it.

---

## Need Help?

- **In Claude Code:** Just describe your problem in plain English
- **On GitHub:** [Open an issue](https://github.com/abhiramelf/ai-sales-team-claude/issues)
