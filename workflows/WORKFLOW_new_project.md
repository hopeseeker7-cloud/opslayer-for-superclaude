# New Project Protocol — Ontology-First Workflow

**Purpose**: 9-step structured project start that prevents jumping into implementation before the project type, structure, and agent routing are confirmed.

**Part of**: OpsLayer for SuperClaude (independent add-on)

## When to Use

Use this workflow when starting any new project. Triggers:
- "start a new project"
- "let's build something new"
- "new product / new tool / new service"
- "bootstrap this project"

## The Rule

**No implementation work begins until all 9 steps are completed.**

---

## Step 1. Confirm What the Project Is

Answer these questions:
- What kind of project is this? (product / internal tool / workflow / research / service)
- What problem does it solve?
- What does the user see as the end result?

**Output required:**
- Project type
- User-facing value (one sentence)
- Final output shape (what gets delivered)

## Step 2. Define the Root Case

Identify the single most important "one unit of work" in the project.

Examples:
- E-commerce app → `OrderCase`
- Insurance analyzer → `AnalysisCase`
- Trading system → `TradeDecision`
- SEO tool → `AuditCase`
- Research system → `ResearchTask`

**Output required:**
- Root case name
- What starts it
- What ends it

## Step 3. Fill the Ontology Chain

Define the 6-step processing chain:

| # | Step | Question |
|---|------|----------|
| 1 | **Evidence** | What data/inputs does the system collect? |
| 2 | **Execution** | What processing/transformation happens? |
| 3 | **Finding** | What does the system discover or calculate? |
| 4 | **Recommendation** | What decision or action does it suggest? |
| 5 | **Report** | What output does the user receive? |
| 6 | **State** | What lifecycle states does the root case go through? |

## Step 4. Define Minimum Entities

List the minimum entities (data objects) needed. For each:
- Role: what it represents
- Required fields: minimum viable fields
- Key relation: how it connects to other entities

Keep it minimal. You can always add fields later.

## Step 5. Define Hard Rules

Propose 3-5 non-negotiable rules. Examples:
- "No recommendation without finding"
- "No deploy without test"
- "No state transition without prior stage completion"
- "No external API call without error handling"
- "No user data stored beyond session"

## Step 6. Classify the First Work Batch

Before doing any work, classify it as:
- [ ] Implementation bug fix
- [ ] Presentation or UX change
- [ ] Ontology structural change
- [ ] New project bootstrap
- [ ] Research / exploration

## Step 7. Route Required Roles

Assign roles based on project needs:

| Role | Assignment | Why |
|------|-----------|-----|
| Primary executor | [Claude / GPT / Gemini] | [reason] |
| Architecture reviewer | [Claude / GPT / Gemini] | [reason] |
| UX reviewer | [Claude / GPT / Gemini] | [reason] |
| Failure hunter | [if needed] | [reason] |
| Release auditor | [if needed] | [reason] |

For multi-AI projects, use the 3AI Orchestration Mode routing table.

## Step 8. Check Approval Gates

Declare whether Human approval is needed for:
- [ ] Ontology structural changes
- [ ] API or DB contract changes
- [ ] Pricing or plan changes
- [ ] Deploy actions
- [ ] External side effects (emails, payments, API calls)

## Step 9. Start Work

Only after steps 1-8 are completed, proceed to:
1. Planning
2. Implementation
3. Review
4. Testing

---

## Quick Template (Copy-Paste)

```markdown
## Project Start: [Name]

### 1. Identity
- Type:
- Problem:
- Value:
- Output:

### 2. Root Case
- Name:
- Starts:
- Ends:

### 3. Ontology Chain
- Evidence:
- Execution:
- Finding:
- Recommendation:
- Report:
- State:

### 4. Entities
- [Entity 1]: role, fields, relation
- [Entity 2]: role, fields, relation

### 5. Hard Rules
1.
2.
3.

### 6. First Batch: [ ] bug fix [ ] UX [ ] ontology [ ] bootstrap [ ] research

### 7. Roles
- Executor:
- Reviewer:

### 8. Gates
- [ ] Ontology change approval
- [ ] API contract approval
- [ ] Deploy approval

### 9. GO
```
