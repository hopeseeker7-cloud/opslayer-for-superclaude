# Changelog

## [0.3.0] - 2026-03-20

### Fixed (Codex Audit — P0)
- **install.sh**: `curl | bash` now works — auto-clones repo before copying files
- **install.sh**: Writes manifest of installed files to `.opslayer-installed` for safe uninstall
- **install.sh**: Added `trap ERR` rollback — partial failures clean up automatically
- **install.sh**: Replaced `date -Iseconds` with portable `date +%Y-%m-%dT%H:%M:%S%z` (macOS compat)
- **install.sh**: `read -p` now reads from `/dev/tty` for curl pipe compatibility
- **install.sh**: Verifies all expected directories exist before copying
- **install.sh**: Backup failure now aborts install (removed silent `|| true`)
- **uninstall.sh**: Reads manifest instead of hardcoded file list — only removes what was installed
- **uninstall.sh**: Added `-y`/`--yes` flag for non-interactive uninstall
- **uninstall.sh**: `read -p` reads from `/dev/tty` for curl pipe compatibility
- **uninstall.sh**: Provides guidance when marker is missing
- **PLAYBOOK_3ai_cross_review.md**: Fixed Gemini CLI package name (`@anthropic-ai/gemini-cli` → `@google/gemini-cli`)
- **README.md**: Install/uninstall docs now match actual script behavior
- **README.md**: FAQ corrected (manifest-based uninstall, rollback mention)

### Changed (P2 — Cleanup & Consistency)
- Unified naming: all `3AI`/`3ai` → `3-AI` (filenames, headings, prose)
- Renamed `MODE_3AI_Orchestration.md` → `MODE_3-AI_Orchestration.md`
- Renamed `PLAYBOOK_3ai_cross_review.md` → `PLAYBOOK_3-AI_cross_review.md`
- Renamed `example_3ai_session.md` → `example_3-AI_session.md`
- Merged `tutorials/` + `examples/` → `docs/` (single directory for non-installable content)
- Updated `install.sh` directory list (`tutorials` → `docs`)
- Removed per-file "Part of OpsLayer" boilerplate from tutorial
- Updated README file tree and section names

### Removed
- `assets/scripts/record_*.sh` — unreferenced demo scripts with syntax errors
- `tutorials/` and `examples/` directories (merged into `docs/`)

## [0.2.0] - 2026-03-19

### Changed
- **Full open-source release** — removed free/premium boundary, everything is MIT
- Restructured repo: `free/` → `modes/`, `workflows/`, `presets/`, `tutorials/`
- README rewritten for open-source positioning
- LICENSE simplified (removed commercial license note)
- install.sh updated for new directory structure

### Added
- PLAYBOOK_solo_saas.md — complete solo SaaS launch workflow
- PLAYBOOK_trading_system.md — automated trading system build guide with safety gates
- PLAYBOOK_3ai_cross_review.md — structured multi-AI collaboration patterns
- Contributing section in README
- Future Directions section in README

### Removed
- Premium/paid tier references
- Gumroad integration
- Commercial license language

## [0.1.0] - 2026-03-17

### Added
- MODE_3AI_Orchestration.md — parallel multi-AI coordination mode
- MODE_Ship_Fast.md — MVP-focused execution mode
- WORKFLOW_new_project.md — 9-step ontology-first project start protocol
- PRESET_korean_dev.md — Korean language development environment presets
- TUTORIAL_first_project.md — getting started tutorial
- install.sh — installer with dependency check and backup
- uninstall.sh — clean removal with backup restoration
