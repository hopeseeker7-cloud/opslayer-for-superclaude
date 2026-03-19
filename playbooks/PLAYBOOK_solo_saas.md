# Solo SaaS Launch Playbook

> From idea validation to production launch — the complete solo founder workflow.

Built from launching SearchLens (GEO-SEO tool), InsureScan (insurance analysis), and other solo SaaS projects with Claude Code + SuperClaude.

---

## Overview

5 phases, each with approval gates and documented pitfalls.

```
VALIDATE → DESIGN → BUILD → LAUNCH → ITERATE
```

---

## Phase 1: VALIDATE (Before You Build)

### 1.1 Idea Stress Test (3-AI Method)

Use OpsLayer's 3-AI Orchestration mode to evaluate your idea from three angles:

| AI | Role | Question |
|----|------|----------|
| Claude | Technical feasibility | "Can this be built in 3 days with existing tools?" |
| GPT | Business model audit | "What's the JTBD? TAM? Pricing model?" |
| Gemini | Market/UX validation | "Who needs this? What's the competitive landscape?" |

**Convergence template:**
```
| AI      | Verdict | Key Insight                    |
|---------|---------|--------------------------------|
| Claude  | GO/WAIT | [technical assessment]          |
| GPT     | GO/WAIT | [business assessment]           |
| Gemini  | GO/WAIT | [market assessment]             |
| Result  | [2:1 or 3:0 consensus]                  |
```

- **GATE**: 2:1 minimum consensus required to proceed
- **PITFALL**: "Building before validating" — the #1 solo founder mistake
- **OUTPUT**: Decision document with risk items

### 1.2 Scope Lock

Use Ship Fast mode to define MVP:

1. List all features you want
2. Apply the cut rule: "If removing this loses zero users, cut it"
3. Lock to max 5 features
4. Everything else goes to backlog v0.2

- **GATE**: Scope signed off before any code
- **PITFALL**: "Just one more feature" — scope creep kills solo projects
- **OUTPUT**: Locked feature list with explicit out-of-scope items

---

## Phase 2: DESIGN (Structure Before Code)

### 2.1 New Project Protocol (9 Steps)

Run OpsLayer's New Project Protocol with SaaS-specific focus:

1. **Identity**: What problem, for whom
2. **Root Case**: The primary user action (e.g., AnalyzeRequest, CreateSubscription)
3. **Ontology Chain**: Evidence → Execution → Finding → Report → State
4. **Entities**: Core data objects with fields
5. **Hard Rules**: Non-negotiable constraints (billing, auth, data safety)
6. **Batch Classification**: What category of work (bootstrap, enhancement, etc.)
7. **Role Routing**: Who/what handles each concern
8. **Approval Gates**: What needs sign-off before proceeding
9. **GO**: Protocol complete, start implementation

- **GATE**: Protocol completed, entities defined
- **OUTPUT**: Project definition document

### 2.2 Tech Stack Decision

Solo-friendly stack principles:
- Don't self-host what you can SaaS (auth, payments, hosting)
- Choose boring technology over exciting technology
- Optimize for speed-to-market, not scale

- **PITFALL**: Over-engineering infrastructure for 0 users
- **OUTPUT**: Tech stack decision record

---

## Phase 3: BUILD (Ship Fast Execution)

### 3.1 Sprint Structure for Solo

3-day sprints (not 2-week):

| Day | Focus |
|-----|-------|
| Day 1 | Build core feature |
| Day 2 | Build + test |
| Day 3 | Polish + ship |

Daily rhythm: build → test → commit → reflect

- **PITFALL**: "I'll test at the end" — always breaks
- **OUTPUT**: First working feature

### 3.2 3-AI Review Cycles

When to invoke 3-AI review:
- After each sprint (not each commit)
- Before major architecture decisions
- Before launch

Review focus per AI:
| AI | Reviews |
|----|---------|
| Claude | Code quality, logic, integration |
| GPT | Architecture, patterns, security |
| Gemini | UX, readability, naming |

- **GATE**: No deploy without at least 1 review cycle
- **OUTPUT**: Review summary with action items

---

## Phase 4: LAUNCH (Get to Users)

### 4.1 Pre-Launch Checklist

```
[ ] Core feature works end-to-end
[ ] User can complete primary workflow
[ ] No data loss scenarios
[ ] Error messages are clear
[ ] Payment integration verified (if applicable)
[ ] Privacy policy and terms exist
[ ] 10 target users identified
```

- **GATE**: All checklist items green
- **PITFALL**: "Launching to nobody" — have 10 target users before you launch

### 4.2 Community Launch

Channel selection by product type:
| Product Type | Primary Channel | Secondary |
|-------------|----------------|-----------|
| Dev tools | Reddit, HN, GeekNews | X/Twitter |
| B2C SaaS | Product Hunt | X, Reddit |
| Korean market | GeekNews, Disquiet | Velog |

Message principles:
- Honest, no hype
- Show what it does, not what it promises
- Include install/try command

Follow-up schedule:
| Day | Action |
|-----|--------|
| Day 1 | Post + respond to all comments |
| Day 3 | Follow-up post with learnings |
| Day 7 | First metrics report |

- **OUTPUT**: Published launch posts

---

## Phase 5: ITERATE (Post-Launch)

### 5.1 User Signal Collection

Week 1 metrics (retention > acquisition):
- How many users returned on day 2?
- What feature did they use most?
- Where did they drop off?

### 5.2 v0.2 Scope Decision

1. Review backlog from Ship Fast mode
2. Cross-reference with actual user feedback
3. Prioritize by user signal, not founder intuition

- **GATE**: At least 5 real user data points before v0.2 scope

---

## Real Example: SearchLens

GEO-SEO analysis tool — idea to launch in 3 days.

| Phase | What Happened |
|-------|--------------|
| Validate | 3-AI consensus: 2:1 GO |
| Design | 9-step protocol, 7 analysis modules (cut from 12) |
| Build | 81/81 tests passing, 3-AI review x2 |
| Launch | Vercel deployment, community posts |
| Result | Live at searchlens-one.vercel.app |
