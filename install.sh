#!/usr/bin/env bash
set -euo pipefail

# OpsLayer for SuperClaude — Installer
# Independent add-on. Not affiliated with SuperClaude-Org or Anthropic.

CLAUDE_DIR="$HOME/.claude"
OPSLAYER_MARKER="$CLAUDE_DIR/.opslayer-installed"
VERSION="0.3.0"
REPO_URL="https://github.com/hopeseeker7-cloud/opslayer-for-superclaude.git"

# --- Helpers ---

cleanup_on_error() {
    echo ""
    echo "ERROR: Installation failed. Rolling back..."
    if [ -f "$OPSLAYER_MARKER" ]; then
        # Read manifest and remove installed files
        grep '^file=' "$OPSLAYER_MARKER" | cut -d= -f2 | while read -r f; do
            rm -f "$CLAUDE_DIR/$f" 2>/dev/null && echo "  Rolled back: $f"
        done
        rm -f "$OPSLAYER_MARKER"
    fi
    echo "Rollback complete. Your original config is unchanged."
    exit 1
}

prompt_user() {
    local msg="$1" default="${2:-N}"
    # Support both interactive terminal and curl|bash (read from /dev/tty)
    if [ -t 0 ]; then
        read -p "$msg" answer
    elif [ -e /dev/tty ]; then
        read -p "$msg" answer < /dev/tty
    else
        echo "$msg (non-interactive, using default: $default)"
        answer="$default"
    fi
    echo "$answer"
}

echo "=== OpsLayer for SuperClaude v${VERSION} — Installer ==="
echo ""

# --- Step 0: Ensure we have the repo files ---

# Detect if running from a cloned repo or via curl|bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)" || SCRIPT_DIR=""

if [ -z "$SCRIPT_DIR" ] || [ ! -d "$SCRIPT_DIR/modes" ]; then
    echo "[0/5] Downloading OpsLayer repository..."
    TMPDIR_CLONE="$(mktemp -d 2>/dev/null || mktemp -d -t opslayer)"
    trap "rm -rf '$TMPDIR_CLONE'" EXIT

    if command -v git &>/dev/null; then
        git clone --depth 1 "$REPO_URL" "$TMPDIR_CLONE/opslayer" 2>&1 | tail -1
    else
        echo "ERROR: git is required. Install git first or use: git clone $REPO_URL && cd opslayer-for-superclaude && bash install.sh"
        exit 1
    fi

    SCRIPT_DIR="$TMPDIR_CLONE/opslayer"
    echo "  Downloaded to temporary directory."
fi

# Verify expected directories exist
EXPECTED_DIRS=(modes workflows presets docs playbooks)
for d in "${EXPECTED_DIRS[@]}"; do
    if [ ! -d "$SCRIPT_DIR/$d" ]; then
        echo "ERROR: Missing directory '$d' in $SCRIPT_DIR"
        echo "The repository may be incomplete. Try: git clone $REPO_URL"
        exit 1
    fi
done

# --- Step 1: Check SuperClaude dependency ---

if [ ! -f "$CLAUDE_DIR/PRINCIPLES.md" ]; then
    echo "ERROR: SuperClaude not found at $CLAUDE_DIR"
    echo "Install SuperClaude first: https://github.com/SuperClaude-Org/SuperClaude_Framework"
    exit 1
fi

echo "[1/5] SuperClaude detected at $CLAUDE_DIR"

# --- Step 2: Check for existing installation ---

if [ -f "$OPSLAYER_MARKER" ]; then
    EXISTING_VER=$(grep '^version=' "$OPSLAYER_MARKER" | cut -d= -f2 || echo "unknown")
    echo "WARNING: OpsLayer v${EXISTING_VER} is already installed."
    answer=$(prompt_user "Reinstall v${VERSION}? (y/N): " "N")
    if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
        echo "Aborted."
        exit 0
    fi
fi

# --- Step 3: Backup existing config ---

BACKUP_DIR="$CLAUDE_DIR/backups/pre-opslayer-$(date +%Y%m%d-%H%M%S)"
echo "[2/5] Backing up $CLAUDE_DIR..."
mkdir -p "$BACKUP_DIR"

# Back up all .md files and any existing OpsLayer marker
BACKUP_COUNT=0
for f in "$CLAUDE_DIR"/*.md "$CLAUDE_DIR"/.opslayer-installed; do
    if [ -f "$f" ]; then
        cp "$f" "$BACKUP_DIR/" || {
            echo "ERROR: Failed to back up $(basename "$f"). Aborting."
            exit 1
        }
        BACKUP_COUNT=$((BACKUP_COUNT + 1))
    fi
done

if [ "$BACKUP_COUNT" -eq 0 ]; then
    echo "  No files to back up (clean install)."
else
    echo "  Backed up $BACKUP_COUNT files to $BACKUP_DIR"
fi

# --- Step 4: Install OpsLayer files ---

echo "[3/5] Installing OpsLayer extensions..."

# Set up rollback trap
trap cleanup_on_error ERR

# Start manifest (will record every installed file)
cat > "$OPSLAYER_MARKER" <<EOF
version=$VERSION
installed_at=$(date +%Y-%m-%dT%H:%M:%S%z)
backup=$BACKUP_DIR
EOF

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
        echo "file=$filename" >> "$OPSLAYER_MARKER"
        echo "  INSTALLED: $filename"
        INSTALLED=$((INSTALLED + 1))
    fi
}

for dir in "${EXPECTED_DIRS[@]}"; do
    for f in "$SCRIPT_DIR"/$dir/*.md; do
        [ -f "$f" ] && install_file "$f"
    done
done

# --- Step 5: Verify and summarize ---

# Verify at least 1 file was installed or skipped (repo wasn't empty)
TOTAL=$((INSTALLED + SKIPPED))
if [ "$TOTAL" -eq 0 ]; then
    echo "ERROR: No extension files found in repository. Installation failed."
    rm -f "$OPSLAYER_MARKER"
    exit 1
fi

# Remove ERR trap (success path)
trap - ERR

echo ""
echo "[4/5] Verifying installation..."
MANIFEST_COUNT=$(grep -c '^file=' "$OPSLAYER_MARKER" 2>/dev/null || echo "0")
echo "  Manifest: $MANIFEST_COUNT files tracked in $OPSLAYER_MARKER"

echo ""
echo "[5/5] Installation complete!"
echo "  Installed: $INSTALLED files"
echo "  Skipped:   $SKIPPED files (already existed)"
echo "  Backup:    $BACKUP_DIR"
echo ""
echo "Start Claude Code and try:"
echo '  "use 3ai orchestration mode"'
echo '  "use ship fast mode"'
echo ""
echo "To uninstall: bash uninstall.sh  (or run from any directory)"
echo ""
echo "OpsLayer for SuperClaude — Independent add-on, not affiliated with SuperClaude-Org or Anthropic."
