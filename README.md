# OpsLayer for SuperClaude

> Battle-tested modes, workflows, and playbooks for SuperClaude — fully open-source.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Requires: SuperClaude 4.0+](https://img.shields.io/badge/Requires-SuperClaude%204.0%2B-purple.svg)](https://github.com/SuperClaude-Org/SuperClaude_Framework)

> **Independent add-on. Not affiliated with or endorsed by SuperClaude-Org or Anthropic.**
> Requires [SuperClaude](https://github.com/SuperClaude-Org/SuperClaude_Framework) v4.0+.

---

## What is OpsLayer?

**OpsLayer** adds production-grade extensions to your SuperClaude installation: operational modes, project workflows, environment presets, and complete project playbooks — all built from running 10+ real AI projects.

SuperClaude gives you the foundation. OpsLayer gives you the field-tested playbook.

Everything is open-source. No paywalls, no gated features.

---

## Quick Start (30 seconds)

### Option A: One-line install (recommended)

```bash
# Downloads the repo automatically, installs extensions, cleans up
curl -sL https://raw.githubusercontent.com/hopeseeker7-cloud/opslayer-for-superclaude/master/install.sh | bash
```

### Option B: Clone and install

```bash
git clone https://github.com/hopeseeker7-cloud/opslayer-for-superclaude.git
cd opslayer-for-superclaude
bash install.sh
```

### After install:

```bash
claude
# Type: "use 3-AI orchestration mode" or "use ship fast mode"
```

### What install.sh does:
1. Downloads the repository if run via `curl | bash` (requires `git`)
2. Checks SuperClaude v4.0+ is installed
3. Backs up `~/.claude/*.md` to `~/.claude/backups/pre-opslayer-{date}/`
4. Copies OpsLayer files (**no existing files are overwritten**)
5. Writes a manifest of installed files for safe uninstall
6. Rolls back automatically if any step fails

### Uninstall:

```bash
# Interactive
git clone https://github.com/hopeseeker7-cloud/opslayer-for-superclaude.git
cd opslayer-for-superclaude
bash uninstall.sh

# Non-interactive
bash uninstall.sh -y
```

Uninstall removes **only files tracked in the install manifest** — your original config is never touched.

---

## Extensions

### Modes

| Extension | Description |
|-----------|-------------|
| **3AI Orchestration** | Run Claude + GPT + Gemini in parallel with assigned roles. Fan out research, converge on decisions. |
| **Ship Fast** | MVP-focused mode. Scope discipline enforced. Build only what ships. No feature creep. |

### Workflows

| Extension | Description |
|-----------|-------------|
| **New Project Protocol** | 9-step ontology-first project start: define root case, entities, hard rules, and agent routing before writing any code. |

### Presets

| Extension | Description |
|-----------|-------------|
| **Korean Dev** | Korean language prompts, Korean public API references, Korean community launch templates. |

### Playbooks

Complete project recipes — end-to-end workflows tested on real production projects.

| Playbook | Description |
|----------|-------------|
| **Solo SaaS Launch** | Full workflow from idea validation to production launch for solo founders. Ontology design, MVP scoping, 3-AI review, deployment checklist. |
| **Trading System Build** | Complete guide for automated trading systems: backtesting setup, paper trading validation, live deploy safety gates, risk monitoring. |
| **3-AI Cross-Review** | Production-grade 3-AI collaboration: Claude implements, GPT audits structure, Gemini reviews UX. Includes prompt templates and review checklists. |

### Tutorials & Examples

| Resource | Description |
|----------|-------------|
| **First Project Tutorial** | Step-by-step guide: your first project with SuperClaude + OpsLayer. |
| **3-AI Session Example** | Real example: picking the fastest product from 41 ideas using 3-AI consensus. |
| **New Project Example** | Real example: GEO-SEO tool (SearchLens) built using the protocol. |

---

## How It Works

OpsLayer files install alongside SuperClaude. Nothing is overwritten.

```
~/.claude/
├── PRINCIPLES.md              <- SuperClaude (untouched)
├── RULES.md                   <- SuperClaude (untouched)
├── MODE_Brainstorming.md      <- SuperClaude (untouched)
├── ...
├── MODE_3AI_Orchestration.md  <- OpsLayer (NEW)
├── MODE_Ship_Fast.md          <- OpsLayer (NEW)
├── WORKFLOW_new_project.md    <- OpsLayer (NEW)
├── PRESET_korean_dev.md       <- OpsLayer (NEW)
└── TUTORIAL_first_project.md  <- OpsLayer (NEW)
```

---

## Requirements

- [SuperClaude](https://github.com/SuperClaude-Org/SuperClaude_Framework) v4.0+
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (Anthropic CLI)
- bash shell (macOS / Linux / WSL / Git Bash on Windows)

---

## Future Directions

OpsLayer is open-source and will stay that way. Potential future additions:

- **Industry Packs** — domain-specific playbooks (fintech, e-commerce, healthcare)
- **Hosted Tooling** — web-based orchestration dashboard for multi-AI workflows
- **Advanced Orchestration** — automated 3-AI pipelines with CI/CD integration
- **Setup Support & Consulting** — hands-on help for teams adopting multi-AI workflows

Have ideas? [Open an issue](https://github.com/hopeseeker7-cloud/opslayer-for-superclaude/issues) or star the repo.

---

## FAQ

**Is this the official SuperClaude?**
No. OpsLayer is an independent add-on by a SuperClaude power user.

**Will this break my SuperClaude setup?**
No. OpsLayer only adds new files. Your existing config is backed up and never modified. If installation fails partway, it rolls back automatically.

**Do I need GPT/Gemini API keys for 3-AI mode?**
The 3-AI Orchestration mode works with Codex CLI (GPT) and Gemini CLI. You need those CLIs installed separately if you want multi-AI coordination.

**What if I uninstall?**
Run `bash uninstall.sh`. It reads the install manifest and removes **only** the files OpsLayer installed. Your backup directory is preserved at `~/.claude/backups/pre-opslayer-*/`.

---

## Contributing

Contributions welcome. If you've built modes, workflows, or playbooks on top of SuperClaude, consider submitting a PR.

---

## License

[MIT License](LICENSE) — everything in this repo.

See [NOTICE](NOTICE) for upstream attribution.

---

## Author

Built by [hopeseeker7](https://github.com/hopeseeker7-cloud) from 10+ production AI projects — trading systems, insurance analysis, GEO-SEO platforms, and multi-AI orchestration frameworks.
