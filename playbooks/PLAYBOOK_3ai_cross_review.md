# 3-AI Cross-Review Playbook

> Production-grade multi-AI collaboration — not just asking three chatbots.

Built from using Claude + GPT + Gemini together across 10+ projects, including OpsLayer itself.

---

## Overview

Structured patterns for getting real value from multiple AI tools working together.

```
SETUP → REVIEW PATTERNS → PROMPT ENGINEERING → WORKFLOW INTEGRATION → EXAMPLES
```

---

## Phase 1: SETUP

### 1.1 CLI Installation

| Tool | Install | Verify |
|------|---------|--------|
| Claude Code | `npm i -g @anthropic-ai/claude-code` | `claude --version` |
| Codex CLI (GPT) | `npm i -g @openai/codex` | `codex --version` |
| Gemini CLI | `npm i -g @google/gemini-cli` | `gemini --version` |

**Windows note**: Codex CLI requires `.cmd` extension in bash:
```bash
# Won't work:
codex exec "prompt"

# Works:
/c/Users/$USER/AppData/Roaming/npm/codex.cmd exec --full-auto -C . "prompt"
```

- **PITFALL**: "I'll just copy-paste between tabs" — loses context and structure
- **OUTPUT**: All 3 CLIs verified working

### 1.2 Role Assignment Principles

Default role assignment:

| AI | Strengths | Default Role |
|----|-----------|-------------|
| Claude | Implementation, code, integration, testing | Implementer |
| GPT (Codex) | Structure, ontology, scoring, risk, audit | Auditor |
| Gemini | UX, visual, market, tone, information architecture | UX Reviewer |

When to override defaults:
- GPT for code review when you need security-focused analysis
- Claude for architecture when deep codebase context matters
- Gemini for content/copy review

- **OUTPUT**: Role assignment cheatsheet

---

## Phase 2: REVIEW PATTERNS

### 2.1 Architecture Review

**Dispatch order**: GPT first → Gemini → Claude

| Step | AI | Prompt Focus |
|------|----|-------------|
| 1 | GPT | "Audit the architecture of [project]. Check: entity relationships, state transitions, hard rule enforcement, missing abstractions." |
| 2 | Gemini | "Review the UX architecture of [project]. Check: information hierarchy, user flow, cognitive load, mobile considerations." |
| 3 | Claude | "Given GPT's structural findings and Gemini's UX findings, integrate both and propose implementation plan." |

**Convergence checklist**:
```
[ ] All 3 AIs responded
[ ] Conflicts identified
[ ] Conflicts resolved or documented as trade-offs
[ ] Action items extracted
[ ] Synthesis document created
```

- **GATE**: All 3 AIs responded, synthesis completed
- **OUTPUT**: Architecture review document

### 2.2 Code Review

**Dispatch order**: Claude first → GPT → Gemini

| AI | Review Focus |
|----|-------------|
| Claude | Logic correctness, bugs, edge cases, integration |
| GPT | Design patterns, security, SOLID compliance, tech debt |
| Gemini | Readability, naming, documentation, developer experience |

How to share code context:
- Claude: reads files directly (in-project)
- GPT: pass via `-C` flag (Codex) or paste specific files
- Gemini: pass via `-p` flag with file contents

- **PITFALL**: Sending entire codebase — scope each review to specific files/modules
- **OUTPUT**: Code review with severity ratings

### 2.3 Launch Readiness Review

**Dispatch**: All 3 in parallel (fastest pattern)

Scoring rubric:
| Rating | Meaning | Threshold |
|--------|---------|-----------|
| GO | Ready to launch | No blockers |
| CONDITIONAL GO | Launch with noted risks | Risks are acceptable |
| NO-GO | Cannot launch | Blockers must be resolved |

Consensus rules:
- 3:0 → proceed with confidence
- 2:1 → proceed, document minority concern
- 1:2 → do not proceed, address concerns
- 0:3 → stop, major rethink needed

Minority opinion is always documented, never discarded.

- **GATE**: 2:1 consensus required
- **OUTPUT**: Launch readiness assessment

---

## Phase 3: PROMPT ENGINEERING

### 3.1 Effective Dispatch Prompts

Structure every dispatch prompt:

```
CONTEXT: [What the project is, current state]
ROLE: [What you want this AI to focus on]
QUESTION: [Specific question, not vague "review this"]
OUTPUT FORMAT: [How you want the response structured]
```

Good vs bad examples:

| Bad | Good |
|-----|------|
| "Review my code" | "Audit src/auth.py for security vulnerabilities. Focus on: input validation, session handling, SQL injection. Output: table with severity, location, fix." |
| "Is this a good idea?" | "Evaluate this product idea using JTBD framework. Who hires this? What alternatives exist? Output: GO/NO-GO with 3 supporting reasons." |

### 3.2 Convergence Prompts

After receiving 3 responses, synthesize:

```
CONVERGENCE TEMPLATE:

## Agreements (all 3 AIs align)
- [finding]

## Productive Tensions (disagreements that reveal trade-offs)
- [AI A] says X because [reason]
- [AI B] says Y because [reason]
- Resolution: [chosen approach + why]

## Blind Spots (what no AI caught)
- [gap identified during synthesis]

## Action Items
1. [action] — from [AI]'s finding
2. [action] — from convergence insight
```

---

## Phase 4: WORKFLOW INTEGRATION

### 4.1 When to Use 3-AI (Decision Matrix)

| Situation | Use 3-AI? | Why |
|-----------|-----------|-----|
| Architecture decisions | Always | Expensive to fix later |
| Launch readiness | Always | Public reputation at stake |
| Pivot decisions | Always | High-impact, irreversible |
| Complex debugging | Sometimes | When root cause is unclear |
| Pricing strategy | Sometimes | Multiple perspectives help |
| Simple bug fixes | Never | Overkill, wastes tokens |
| Formatting/style | Never | One AI is enough |
| Routine tasks | Never | Cost/benefit doesn't justify |

Cost awareness: ~$0.50-2.00 per full 3-AI session

- **PITFALL**: Using 3-AI for everything — expensive and slow

### 4.2 Cadence

| Frequency | Use Case |
|-----------|----------|
| Weekly | Project health check |
| Per sprint | Architecture review |
| Pre-launch | Full readiness review |
| Ad-hoc | Critical decisions only |

---

## Phase 5: REAL SESSION EXAMPLES

### Example 1: Product Selection (41 Ideas → 1 Pick)

**Context**: 41 product ideas needed down to 1 "fastest to build"

**Dispatch**:
- Claude: "Score each idea on build complexity (1-5). Consider existing assets."
- GPT: "Score each idea on business viability. Use TAM, defensibility, time-to-revenue."
- Gemini: "Score each idea on market fit. Consider competition, timing, user need."

**Result**: 2:1 consensus on #36 (Claude Code plugin). Gemini picked #31 (MCP server). Minority documented.

**Cost**: ~$1.50 total

### Example 2: IP/License Audit (OpsLayer Itself)

**Context**: Discovered ~/.claude/ files might be third-party

**Dispatch**:
- GPT (audit 1): "Audit project definition for IP, licensing, and commercial risks"
  - Found 6 issues: npm stretch goal, asset type enum, IP control weak
- GPT (audit 2): "Re-audit after fixes. Focus on brand, license, value proposition"
  - Found 4 issues: brand implies affiliation, single MIT over-licenses premium

**Result**: Entire strategy pivoted from "sell existing files" to "independent add-on". Brand renamed from "Pro Pack" to "OpsLayer".

**Cost**: ~$1.20 for both sessions

### Example 3: Launch Readiness (Day 3 Review)

**Dispatch**: GPT + Gemini in parallel
- GPT: brand safety, free/premium boundary, factual accuracy
- Gemini: GIF value clarity, visual flow, tone check

**Result**: Both rated READY. GPT found 3 operational blockers (repo visibility, playbook files, URL placeholder). All resolved before launch.

**Cost**: ~$0.80

---

## Quick Reference

### Role Assignment Cheatsheet
```
Bug fix         → Claude only
Code review     → Claude + GPT
UX review       → Gemini + Claude
Architecture    → GPT first, then all 3
Launch decision → All 3 in parallel
Strategy pivot  → All 3, GPT leads
```

### Cost per Session
```
Single AI query:     ~$0.10-0.30
2-AI review:         ~$0.30-0.80
Full 3-AI session:   ~$0.50-2.00
Deep 3-AI audit:     ~$1.50-3.00
```
