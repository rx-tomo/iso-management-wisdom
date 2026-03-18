#!/usr/bin/env bash
set -euo pipefail

# iso-management-wisdom installer
# Copies the skill to ~/.claude/skills/iso-management-wisdom/

SKILL_NAME="iso-management-wisdom"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_DIR}/skill/${SKILL_NAME}"
TARGET_DIR="${HOME}/.claude/skills/${SKILL_NAME}"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   ISO Management Wisdom - Installer      ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Check source exists
if [ ! -d "${SOURCE_DIR}" ]; then
    echo -e "${RED}Error: skill/ directory not found.${NC}"
    echo "Run this script from the repository root."
    exit 1
fi

# Check if already installed
if [ -d "${TARGET_DIR}" ]; then
    echo -e "${YELLOW}Existing installation found at:${NC}"
    echo "  ${TARGET_DIR}"
    echo ""
    read -p "Overwrite? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Cancelled."
        exit 0
    fi
    rm -rf "${TARGET_DIR}"
fi

# Install
mkdir -p "${TARGET_DIR}"
cp -r "${SOURCE_DIR}/"* "${TARGET_DIR}/"

# Verify
ROLES_COUNT=$(ls "${TARGET_DIR}/references/roles/" 2>/dev/null | wc -l | tr -d ' ')
TEMPLATES_COUNT=$(ls "${TARGET_DIR}/references/templates/" 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo -e "${GREEN}Installed successfully!${NC}"
echo ""
echo "  Location:   ${TARGET_DIR}"
echo "  SKILL.md:   OK"
echo "  Roles:      ${ROLES_COUNT} files"
echo "  Templates:  ${TEMPLATES_COUNT} files"
echo ""
echo "Usage: Type /iso-management-wisdom in Claude Code"
echo ""
