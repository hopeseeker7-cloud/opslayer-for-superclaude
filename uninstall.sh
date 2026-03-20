#!/usr/bin/env bash
set -euo pipefail

# OpsLayer for SuperClaude — Uninstaller

CLAUDE_DIR="$HOME/.claude"
OPSLAYER_MARKER="$CLAUDE_DIR/.opslayer-installed"

# --- Parse flags ---
AUTO_YES=false
for arg in "$@"; do
    case "$arg" in
        -y|--yes) AUTO_YES=true ;;
    esac
done

# --- Helpers ---

prompt_user() {
    local msg="$1"
    if [ "$AUTO_YES" = true ]; then
        echo "y"
        return
    fi
    if [ -t 0 ]; then
        read -p "$msg" answer
    elif [ -e /dev/tty ]; then
        read -p "$msg" answer < /dev/tty
    else
        echo "N"  # non-interactive without -y: safe default is abort
    fi
    echo "$answer"
}

echo "=== OpsLayer for SuperClaude — Uninstaller ==="
echo ""

# --- Check marker ---

if [ ! -f "$OPSLAYER_MARKER" ]; then
    echo "OpsLayer is not installed (marker not found at $OPSLAYER_MARKER)."
    echo ""
    echo "If you believe OpsLayer files remain, check for these files in $CLAUDE_DIR:"
    echo "  MODE_3AI_Orchestration.md, MODE_Ship_Fast.md, WORKFLOW_new_project.md,"
    echo "  PRESET_korean_dev.md, TUTORIAL_first_project.md, PLAYBOOK_*.md"
    exit 0
fi

# --- Read manifest ---

VERSION=$(grep '^version=' "$OPSLAYER_MARKER" | cut -d= -f2 || echo "unknown")
BACKUP=$(grep '^backup=' "$OPSLAYER_MARKER" | cut -d= -f2 || echo "")

# Collect files from manifest
MANIFEST_FILES=()
while IFS= read -r line; do
    case "$line" in
        file=*) MANIFEST_FILES+=("${line#file=}") ;;
    esac
done < "$OPSLAYER_MARKER"

echo "OpsLayer v${VERSION} found."
echo ""

if [ ${#MANIFEST_FILES[@]} -eq 0 ]; then
    echo "WARNING: Manifest is empty (no files tracked)."
    echo "Removing marker only."
    rm -f "$OPSLAYER_MARKER"
    echo "Done."
    exit 0
fi

# --- Show files to remove ---

echo "The following OpsLayer files will be removed:"
REMOVABLE=0
for f in "${MANIFEST_FILES[@]}"; do
    if [ -f "$CLAUDE_DIR/$f" ]; then
        echo "  - $f"
        REMOVABLE=$((REMOVABLE + 1))
    else
        echo "  - $f (already missing)"
    fi
done
echo ""
echo "Total: $REMOVABLE files to remove."
echo ""

# --- Confirm ---

answer=$(prompt_user "Proceed with uninstall? (y/N): ")
if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
    echo "Aborted."
    exit 0
fi

# --- Remove files ---

REMOVED=0
for f in "${MANIFEST_FILES[@]}"; do
    if [ -f "$CLAUDE_DIR/$f" ]; then
        rm "$CLAUDE_DIR/$f"
        echo "  Removed: $f"
        REMOVED=$((REMOVED + 1))
    fi
done

# Remove marker
rm -f "$OPSLAYER_MARKER"

echo ""
echo "Uninstall complete. Removed $REMOVED files."
echo ""

# --- Backup info ---

if [ -n "$BACKUP" ] && [ -d "$BACKUP" ]; then
    echo "Your pre-install backup is at:"
    echo "  $BACKUP"
    echo ""
    echo "To restore your original config:"
    echo "  cp \"$BACKUP\"/*.md \"$CLAUDE_DIR/\""
else
    echo "No backup directory found."
fi
