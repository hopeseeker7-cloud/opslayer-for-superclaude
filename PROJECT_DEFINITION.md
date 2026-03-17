# SuperClaude Framework - Ontology-First Project Definition

> Protocol: MyOntology/templates/new_project_start_protocol.md
> Date: 2026-03-17
> Status: DRAFT - Pending GPT Audit

---

## Step 1. Project Identity

- **Project Name**: SuperClaude
- **Project Type**: Developer tool product (packaging existing operational assets)
- **Problem**: Claude Code users lack structured behavioral frameworks. Default Claude Code has no persistent modes, role routing, MCP orchestration guides, or business analysis capabilities.
- **User-Facing Value**: Install one package, get structured AI workflows — modes, rules, principles, slash commands, MCP integration guides, and business analysis panel.
- **Final Output Shape**: GitHub public repository + npm-installable package + install/uninstall scripts + README + demo materials
- **What This Is NOT**: Not a new product build. This is packaging existing `~/.claude/` operational assets into a distributable product.

---

## Step 2. Root Case

- **Root Case Name**: `PackageRelease`
- **What Starts It**: Decision to publish a versioned release of the framework
- **What Ends It**: Published package available on GitHub/npm, README complete, install script tested, free/paid boundary enforced

---

## Step 3. Ontology 6-Step Chain

| Step | Name | Definition |
|------|------|------------|
| 1 | Evidence | Asset inventory — list of all `~/.claude/` files with public/private classification |
| 2 | Execution | File sanitization, structure creation, install script, README authoring |
| 3 | Finding | Identified gaps — missing license, incomplete docs, secrets leakage risks |
| 4 | Recommendation | Product tier structure (free/paid boundary), pricing model, distribution channel |
| 5 | Report | Published MVP package with version tag, tested on clean environment |
| 6 | State | `draft` → `inventory_complete` → `sanitized` → `structured` → `tested` → `published` |

---

## Step 4. Minimum Entity Set

### Entity: `Asset`
- **Role**: Individual file or directory from ~/.claude/ being evaluated for inclusion
- **Required Fields**: `path`, `type` (core|mode|mcp|command|agent|config), `lines`, `classification` (public|private|redact), `tier` (free|premium)
- **Key Relation**: belongs_to `PackageRelease`

### Entity: `ProductTier`
- **Role**: Defines free vs premium boundary
- **Required Fields**: `tier_name`, `included_assets[]`, `price`, `distribution_channel`
- **Key Relation**: contains `Asset[]`

### Entity: `InstallTarget`
- **Role**: User's Claude Code environment where the package gets installed
- **Required Fields**: `os`, `claude_code_version`, `existing_config_backup`
- **Key Relation**: receives `PackageRelease`

### Entity: `PackageRelease`
- **Role**: A versioned, distributable bundle of assets
- **Required Fields**: `version`, `tier`, `assets[]`, `install_script`, `readme`, `license`, `changelog`
- **Key Relation**: root case, contains `Asset[]`, targets `InstallTarget`

---

## Step 5. Non-Negotiable Rules (Hard Rules)

1. **NO_SECRETS**: No personal API keys, credentials, MCP config with tokens, or project-specific memory files may be included in any release.
2. **NO_RELEASE_WITHOUT_INVENTORY**: No packaging or publishing without completed asset inventory and public/private classification.
3. **NO_INSTALL_WITHOUT_BACKUP**: Install script MUST create backup of user's existing `~/.claude/` before overwriting anything.
4. **NO_PREMIUM_WITHOUT_FREE**: Free tier must be functional standalone. Premium adds value but free is not crippled.
5. **NO_PUBLISH_WITHOUT_TEST**: Every release must be tested on a clean environment (fresh `~/.claude/`) before publishing.
6. **IP_VERIFICATION**: Every included file must have clear ownership. Third-party plugin files (oh-my-claudecode, GSD, context-mode, geo-seo) must NOT be bundled — only reference/recommend.

---

## Step 6. First Work Batch Classification

- **Classification**: `new project bootstrap`
- **Specifics**: Packaging existing operational assets into a distributable product. No new feature development. The work is inventory, sanitization, structuring, and documentation.

---

## Step 7. Role Routing

### Required Roles

| Role | Assignment | Why |
|------|-----------|-----|
| `role:project_manager` | Human (user) | Final approval on free/paid boundary, pricing, release |
| `role:system_architect` | GPT (Codex) | Ontology audit, product structure validation, IP/legal review |
| `role:backend_executor` | Claude | File sanitization, install script, repo structure, README |
| `role:ux_reviewer` | Gemini | README copy, store page UX, demo flow, launch messaging |
| `role:code_reviewer` | GPT (Codex) | Secrets leak check, install script safety, rollback completeness |
| `role:release_auditor` | GPT (Codex) | Pre-publish checklist, license compliance, clean-env test |

### External Agent Mapping

| Shared Role | External Agent | Source | Why |
|---|---|---|---|
| `role:system_architect` | Codex CLI | GPT | Ontology/contract audit per 3-AI protocol |
| `role:backend_executor` | Claude Code | Claude | Primary implementer per 3-AI protocol |
| `role:ux_reviewer` | Gemini CLI | Gemini | UX/copy review per 3-AI protocol |
| `role:code_reviewer` | Codex CLI | GPT | Security + correctness review |
| `role:release_auditor` | Codex CLI | GPT | Final publish gate |

---

## Step 8. Approval Gates

| Gate | Required | Approver | Trigger |
|------|----------|----------|---------|
| `gate:asset_classification` | YES | Human | Before any file is marked public |
| `gate:secrets_check` | YES | GPT + Human | Before packaging (NO_SECRETS rule) |
| `gate:free_paid_boundary` | YES | Human | Pricing/tier decision |
| `gate:license_choice` | YES | Human | MIT vs commercial vs dual |
| `gate:publish` | YES | Human | Final release to GitHub/npm |
| `gate:ip_verification` | YES | GPT | Third-party content check |

---

## Step 9. Recommended Next Steps

1. **Immediate**: Complete asset inventory with public/private/redact classification
2. **Then**: GPT audit of ontology + asset classification + free/paid boundary
3. **Then**: Gemini review of README structure + launch copy
4. **Then**: Claude executes — repo structure, install script, sanitized files
5. **Final**: Clean-env test → human approval → publish

---

## Asset Inventory (Draft)

### PUBLIC (Product Candidates)

| File | Lines | Type | Proposed Tier |
|------|-------|------|---------------|
| CLAUDE.md | 36 | entry_point | Free |
| PRINCIPLES.md | 60 | core | Free |
| RULES.md | 257 | core | Free |
| FLAGS.md | 120 | core | Free |
| MODE_Brainstorming.md | 43 | mode | Free |
| MODE_Introspection.md | 38 | mode | Free |
| MODE_Orchestration.md | 49 | mode | Free |
| MODE_Token_Efficiency.md | 74 | mode | Free |
| MODE_Task_Management.md | 102 | mode | Premium |
| MODE_Business_Panel.md | 334 | mode | Premium |
| MCP_Context7.md | 29 | mcp_guide | Free |
| MCP_Magic.md | 30 | mcp_guide | Free |
| MCP_Morphllm.md | 30 | mcp_guide | Free |
| MCP_Playwright.md | 31 | mcp_guide | Free |
| MCP_Serena.md | 31 | mcp_guide | Free |
| BUSINESS_PANEL_EXAMPLES.md | 278 | business | Premium |
| BUSINESS_SYMBOLS.md | 211 | business | Premium |
| commands/sc/* (22 files) | ~1500 | slash_commands | Free (basic) / Premium (advanced) |

### EXCLUDE (Private / Third-Party)

| File/Dir | Reason |
|----------|--------|
| .credentials.json | API keys — NO_SECRETS |
| .mcp.json | Personal MCP config with tokens |
| config.json | Personal settings |
| history.jsonl | Conversation history |
| .superclaude-metadata.json | Internal metadata |
| backups/ | Personal backups |
| cache/ | Cache data |
| debug/ | Debug logs |
| downloads/ | Personal downloads |
| file-history/ | File change history |
| ide/ | IDE-specific settings |
| hooks/ | Personal hooks |
| projects/ | Project memory (contains secrets/personal data) |
| context-mode/ | Third-party plugin (context-mode) |
| get-shit-done/ | Third-party plugin (GSD) |
| commands/gsd/ | Third-party plugin (GSD) |
| commands/geo-seo/ | Third-party plugin (geo-seo) |
| agents/gsd-*.md | Third-party plugin (GSD) |
| mcp-needs-auth-cache.json | Auth cache |
| gsd-file-manifest.json | GSD manifest |

### DECISION NEEDED (IP Verification Required)

| File/Dir | Question |
|----------|----------|
| agents/ (non-gsd) | Are these from oh-my-claudecode or user-created? If third-party, cannot bundle. |
| commands/sc/ | Origin: SuperClaude framework install or user-authored? |
| BUSINESS_*.md | Origin verification needed |

---

## Product Definition (1-page)

### What is SuperClaude?

A **behavioral framework for Claude Code** that transforms the default AI assistant into a structured, mode-aware, MCP-integrated development partner.

### What it is NOT
- Not an MCP server
- Not a VS Code extension
- Not a separate AI product
- Not a replacement for Claude Code itself

### Category
**Prompt Framework / Configuration Pack** — installs into `~/.claude/` and enhances Claude Code behavior through structured markdown files.

### Core Value Proposition
| Without SuperClaude | With SuperClaude |
|---|---|
| Claude forgets rules between sessions | Persistent behavioral rules loaded every session |
| No structured analysis modes | 6 specialized modes (brainstorm, introspect, orchestrate, etc.) |
| MCP servers used ad-hoc | MCP selection matrix with trigger-based routing |
| No business analysis capability | 9-expert business panel with frameworks |
| Verbose, inconsistent output | Token-efficient symbol system |
| No task management memory | Hierarchical task tracking with session persistence |

### Distribution
- **GitHub**: Public repo with install script
- **npm**: `npx superclaude install` (stretch goal)
- **Gumroad**: Premium tier download (if applicable)
