#!/usr/bin/env bash
set -euo pipefail

# iso-management-wisdom installer
# Copies the skill to ~/.claude/skills/iso-management-wisdom/

SKILL_NAME="iso-management-wisdom"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# --- Language selection ---
SKILL_LANG=""

# Parse --lang argument
while [[ $# -gt 0 ]]; do
    case "$1" in
        --lang)
            if [[ -n "${2:-}" ]]; then
                SKILL_LANG="$2"
                shift 2
            else
                echo -e "${RED}Error: --lang requires a value (ja or en).${NC}"
                exit 1
            fi
            ;;
        *)
            echo -e "${RED}Error: Unknown argument '$1'.${NC}"
            echo "Usage: $0 [--lang ja|en]"
            exit 1
            ;;
    esac
done

# Interactive prompt if --lang was not provided
if [[ -z "${SKILL_LANG}" ]]; then
    read -p "Select language / 言語を選択 (ja/en) [ja]: " SKILL_LANG_INPUT
    SKILL_LANG="${SKILL_LANG_INPUT:-ja}"
fi

# Validate language value
if [[ "${SKILL_LANG}" != "ja" && "${SKILL_LANG}" != "en" ]]; then
    echo -e "${RED}Error: Invalid language '${SKILL_LANG}'. Must be 'ja' or 'en'.${NC}"
    exit 1
fi

SOURCE_DIR="${SCRIPT_DIR}/skill/${SKILL_NAME}/${SKILL_LANG}"
TARGET_DIR="${HOME}/.claude/skills/${SKILL_NAME}"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   ISO Management Wisdom - Installer      ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Check source exists
if [ ! -d "${SOURCE_DIR}" ]; then
    echo -e "${RED}Error: Language directory not found: ${SOURCE_DIR}${NC}"
    echo "Available languages:"
    ls "${SCRIPT_DIR}/skill/${SKILL_NAME}/" 2>/dev/null || echo "  (none)"
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
echo "  Language:    ${SKILL_LANG}"
echo "  Location:   ${TARGET_DIR}"
echo "  SKILL.md:   OK"
echo "  Roles:      ${ROLES_COUNT} files"
echo "  Templates:  ${TEMPLATES_COUNT} files"
echo ""
echo "Usage: Type /iso-management-wisdom in Claude Code"
echo ""
