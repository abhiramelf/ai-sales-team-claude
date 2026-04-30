#!/bin/bash
# ============================================================================
# AI Sales Team — Claude Code Skills Uninstaller
# Removes all sales skills, agents, scripts, and templates
# ============================================================================
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo ""
echo -e "${YELLOW}Uninstalling AI Sales Team for Claude Code...${NC}"
echo ""

SKILLS_DIR="$HOME/.claude/skills"
AGENTS_DIR="$HOME/.claude/agents"

# Remove skills
SKILLS=(
    sales
    sales-prospect
    sales-research
    sales-qualify
    sales-contacts
    sales-outreach
    sales-followup
    sales-prep
    sales-proposal
    sales-objections
    sales-icp
    sales-competitors
    sales-report
    sales-report-pdf
    sales-setup
    sales-config
    sales-preset
    sales-status
    sales-pipeline
    sales-coach
    sales-playbook
)

echo -e "${BLUE}Removing skills...${NC}"
for skill in "${SKILLS[@]}"; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        rm -rf "$SKILLS_DIR/$skill"
        echo -e "  ${GREEN}✓${NC} Removed $skill"
    fi
done

# Remove agents
AGENTS=(
    sales-company
    sales-contacts
    sales-opportunity
    sales-competitive
    sales-strategy
)

echo -e "${BLUE}Removing agents...${NC}"
for agent in "${AGENTS[@]}"; do
    if [ -f "$AGENTS_DIR/$agent.md" ]; then
        rm -f "$AGENTS_DIR/$agent.md"
        echo -e "  ${GREEN}✓${NC} Removed $agent"
    fi
done

# Handle sales configuration
if [ -f "$HOME/.claude/sales-config.md" ] || [ -f "$HOME/.claude/sales-config.json" ]; then
    echo ""
    echo -e "${YELLOW}Sales configuration files found:${NC}"
    [ -f "$HOME/.claude/sales-config.md" ] && echo -e "  ~/.claude/sales-config.md"
    [ -f "$HOME/.claude/sales-config.json" ] && echo -e "  ~/.claude/sales-config.json"
    echo -ne "${YELLOW}Remove configuration? (y/N): ${NC}"
    read -r REMOVE_CONFIG
    if [[ "$REMOVE_CONFIG" =~ ^[Yy]$ ]]; then
        rm -f "$HOME/.claude/sales-config.md" "$HOME/.claude/sales-config.json"
        echo -e "  ${GREEN}✓${NC} Configuration removed"
    else
        echo -e "  ${BLUE}→${NC} Configuration preserved"
    fi
fi

echo ""
echo -e "${GREEN}AI Sales Team has been uninstalled.${NC}"
echo -e "Python packages (reportlab, beautifulsoup4) were not removed."
echo -e "To remove them: ${YELLOW}pip3 uninstall reportlab beautifulsoup4${NC}"
echo ""
