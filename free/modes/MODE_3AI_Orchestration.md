# 3AI Orchestration Mode

**Purpose**: Parallel multi-AI coordination — fan out tasks to Claude, GPT, and Gemini with assigned roles, then converge on decisions.

**Part of**: OpsLayer for SuperClaude (independent add-on)

## Activation Triggers

- Multi-AI keywords: "3-AI", "three AI", "cross-review", "parallel research"
- Explicit routing: "ask GPT to audit", "have Gemini review UX"
- Complex decisions requiring multiple perspectives
- Manual flag: `--3ai`

## Role Assignment Protocol

Each AI has a default role. Override per task as needed.

| AI | Default Role | Strengths |
|----|-------------|-----------|
| **Claude** | Implementer | Code, integration, bug fixes, testing, build |
| **GPT** (Codex CLI) | Auditor | Structure, contracts, scoring, state transitions, impact analysis, readiness |
| **Gemini** (Gemini CLI) | UX Reviewer | Information architecture, mobile UX, copy, hierarchy, visual flow |

## Routing Rules

| Task Type | Primary | Secondary | Escalation |
|-----------|---------|-----------|------------|
| Bug fix | Claude | — | Claude + GPT if recurring |
| Architecture/Structure | GPT first | Claude integrates | All 3 for critical decisions |
| UX/Copy change | Gemini first | Claude implements | All 3 for user-facing launches |
| Complex/Mixed | GPT + Gemini parallel | Claude synthesizes | Human approval gate |
| New project start | All 3 parallel | Claude consolidates | Human final decision |

## Fan-Out Pattern

When activating 3AI mode, follow this sequence:

### Step 1: Define the Question
State the question or decision clearly in one sentence.

### Step 2: Assign Roles
```
Claude: [specific task — e.g., "implement the solution"]
GPT:    [specific task — e.g., "audit the architecture and contracts"]
Gemini: [specific task — e.g., "review the UX flow and copy"]
```

### Step 3: Dispatch
Run GPT and Gemini in parallel. Do NOT wait for one before starting the other.

```bash
# GPT (Codex CLI)
codex.cmd exec --full-auto -C <project_dir> "<prompt>" -o <output_file>

# Gemini CLI
gemini -y -p "<prompt>"
```

### Step 4: Converge
After all results are in:
1. Identify agreements (consensus points)
2. Identify disagreements (productive tensions)
3. Claude synthesizes a final recommendation
4. Present to Human for approval if needed

## Convergence Template

```markdown
## 3-AI Consensus Report

### Question: [original question]

| AI | Recommendation | Confidence |
|----|---------------|------------|
| Claude | [position] | [high/medium/low] |
| GPT | [position] | [high/medium/low] |
| Gemini | [position] | [high/medium/low] |

### Agreements
- [point where 2+ AIs agree]

### Tensions
- [point of disagreement + both arguments]

### Synthesis
[Claude's integrated recommendation]

### Decision Required
[yes/no — if yes, what Human needs to decide]
```

## When NOT to Use 3AI

- Simple bug fixes (Claude alone)
- Formatting/style changes (Claude alone)
- Quick questions with clear answers (whichever AI is fastest)
- Token budget is tight (pick the one most relevant AI)

## Cost Awareness

Each AI call costs tokens/credits. Use 3AI for decisions that justify the cost:
- Architectural decisions
- Launch readiness reviews
- Security/compliance reviews
- Product direction decisions
- Pricing/business model decisions

For routine work, use single-AI mode.
