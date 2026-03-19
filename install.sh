#!/usr/bin/env bash
set -euo pipefail

# OpsLayer for SuperClaude — Installer
# Independent add-on. Not affiliated with SuperClaude-Org or Anthropic.

CLAUDE_DIR="$HOME/.claude"
BACKUP_DIR="$CLAUDE_DIR/backups/pre-opslayer-$(date +%Y%m%d-%H%M%S)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPSLAYER_MARKER=".opslayer-installed"

echo "=== OpsLayer for SuperClaude — Installer ==="
echo ""

# Step 1: Check SuperClaude dependency
if [ ! -f "$CLAUDE_DIR/PRINCIPLES.md" ]; then
    echo "ERROR: SuperClaude not found at $CLAUDE_DIR"
    echo "Install SuperClaude first: https://github.com/SuperClaude-Org/SuperClaude_Framework"
    exit 1
fi

echo "[1/4] SuperClaude detected at $CLAUDE_DIR"

# Step 2: Check for existing OpsLayer installation
if [ -f "$CLAUDE_DIR/$OPSLAYER_MARKER" ]; then
    echo "WARNING: OpsLayer is already installed."
    read -p "Reinstall? (y/N): " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "Aborted."
        exit 0
    fi
fi

# Step 3: Backup existing config
echo "[2/4] Backing up $CLAUDE_DIR to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
cp -r "$CLAUDE_DIR"/*.md "$BACKUP_DIR/" 2>/dev/null || true
echo "  Backup complete."

# Step 4: Install OpsLayer files (NEVER overwrite existing files)
echo "[3/4] Installing OpsLayer extensions..."

INSTALLED=0
SKIPPED=0

install_file() {
    local src="$1"
    local filename="$(basename "$src")"
    local dest="$CLAUDE_DIR/$filename"

    if [ -f "$dest" ]; then
        echo "  SKIP: $filename (already exists — not overwriting)"
        SKIPPED=$((SKIPPED + 1))
    else
        cp "$src" "$dest"
        echo "  INSTALLED: $filename"
        INSTALLED=$((INSTALLED + 1))
    fi
}

# Install extensions
for dir in modes workflows presets tutorials playbooks; do
    for f in "$SCRIPT_DIR"/$dir/*.md; do
        [ -f "$f" ] && install_file "$f"
    done
done

# Write install marker
echo "version=0.2.0" > "$CLAUDE_DIR/$OPSLAYER_MARKER"
echo "installed_at=$(date -Iseconds)" >> "$CLAUDE_DIR/$OPSLAYER_MARKER"

# Step 5: Summary
echo ""
echo "[4/4] Installation complete!"
echo "  Installed: $INSTALLED files"
echo "  Skipped:   $SKIPPED files (already existed)"
echo "  Backup:    $BACKUP_DIR"
echo ""
echo "Start Claude Code and try:"
echo '  "use 3ai orchestration mode"'
echo '  "use ship fast mode"'
echo ""
echo "To uninstall: bash uninstall.sh"
echo ""
echo "OpsLayer for SuperClaude — Independent add-on, not affiliated with SuperClaude-Org or Anthropic."
