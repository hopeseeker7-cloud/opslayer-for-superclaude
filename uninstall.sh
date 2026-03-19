#!/usr/bin/env bash
set -euo pipefail

# OpsLayer for SuperClaude — Uninstaller

CLAUDE_DIR="$HOME/.claude"
OPSLAYER_MARKER=".opslayer-installed"

echo "=== OpsLayer for SuperClaude — Uninstaller ==="
echo ""

# Check if OpsLayer is installed
if [ ! -f "$CLAUDE_DIR/$OPSLAYER_MARKER" ]; then
    echo "OpsLayer is not installed (marker not found)."
    exit 0
fi

# List of OpsLayer files (only files WE installed)
OPSLAYER_FILES=(
    "MODE_3AI_Orchestration.md"
    "MODE_Ship_Fast.md"
    "WORKFLOW_new_project.md"
    "PRESET_korean_dev.md"
    "TUTORIAL_first_project.md"
    "PLAYBOOK_solo_saas.md"
    "PLAYBOOK_trading_system.md"
    "PLAYBOOK_3ai_cross_review.md"
)

echo "The following OpsLayer files will be removed:"
for f in "${OPSLAYER_FILES[@]}"; do
    if [ -f "$CLAUDE_DIR/$f" ]; then
        echo "  - $f"
    fi
done
echo ""

read -p "Proceed with uninstall? (y/N): " confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "Aborted."
    exit 0
fi

REMOVED=0
for f in "${OPSLAYER_FILES[@]}"; do
    if [ -f "$CLAUDE_DIR/$f" ]; then
        rm "$CLAUDE_DIR/$f"
        echo "  Removed: $f"
        REMOVED=$((REMOVED + 1))
    fi
done

# Remove marker
rm -f "$CLAUDE_DIR/$OPSLAYER_MARKER"

echo ""
echo "Uninstall complete. Removed $REMOVED files."
echo ""

# Check for backups
LATEST_BACKUP=$(ls -dt "$CLAUDE_DIR/backups/pre-opslayer-"* 2>/dev/null | head -1)
if [ -n "$LATEST_BACKUP" ]; then
    echo "Your pre-install backup is at: $LATEST_BACKUP"
    echo "To restore: cp $LATEST_BACKUP/*.md $CLAUDE_DIR/"
fi
