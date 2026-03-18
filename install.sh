#!/usr/bin/env bash
set -euo pipefail

# iso-management-wisdom installer
# Supports both Claude Code and Codex CLI

SKILL_NAME="iso-management-wisdom"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_DIR}/skill/${SKILL_NAME}"

CLAUDE_DIR="${HOME}/.claude/skills/${SKILL_NAME}"
CODEX_DIR="${HOME}/.codex/skills/${SKILL_NAME}"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   ISO Management Wisdom - Installer          ║"
echo "║   Supports: Claude Code / Codex CLI           ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# Check source exists
if [ ! -d "${SOURCE_DIR}" ]; then
    echo -e "${YELLOW}Error: skill/ directory not found.${NC}"
    echo "Run this script from the repository root."
    exit 1
fi

# Platform selection
echo "Select installation target:"
echo ""
echo "  1) Claude Code  (~/.claude/skills/)"
echo "  2) Codex CLI    (~/.codex/skills/)"
echo "  3) Both"
echo ""
read -p "Choice [1/2/3] (default: 3): " choice
choice=${choice:-3}

install_to() {
    local target_dir="$1"
    local platform="$2"

    if [ -d "${target_dir}" ]; then
        echo -e "${YELLOW}Existing ${platform} installation found.${NC}"
        read -p "Overwrite? (y/N): " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Skipped ${platform}."
            return
        fi
        rm -rf "${target_dir}"
    fi

    mkdir -p "${target_dir}"
    cp -r "${SOURCE_DIR}/"* "${target_dir}/"

    local roles_count
    roles_count=$(ls "${target_dir}/references/roles/" 2>/dev/null | wc -l | tr -d ' ')
    local templates_count
    templates_count=$(ls "${target_dir}/references/templates/" 2>/dev/null | wc -l | tr -d ' ')

    echo -e "${GREEN}  ${platform}: Installed${NC}"
    echo "    Location:   ${target_dir}"
    echo "    Roles:      ${roles_count} files"
    echo "    Templates:  ${templates_count} files"
    echo ""
}

case "${choice}" in
    1)
        install_to "${CLAUDE_DIR}" "Claude Code"
        ;;
    2)
        install_to "${CODEX_DIR}" "Codex CLI"
        ;;
    3)
        install_to "${CLAUDE_DIR}" "Claude Code"
        install_to "${CODEX_DIR}" "Codex CLI"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo -e "${CYAN}Usage:${NC}"
echo "  Claude Code:  /iso-management-wisdom"
echo "  Codex CLI:    \$iso-management-wisdom"
echo ""
