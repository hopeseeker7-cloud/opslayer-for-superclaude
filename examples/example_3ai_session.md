# Example: 3AI Orchestration Session

This example shows a real 3-AI session for deciding the fastest product to build from a list of ideas.

## Context

A solo founder has 41 business ideas and needs to pick the single fastest one to build as an MVP.

## Step 1: Define the Question

"Which of these 41 ideas can be shipped fastest with our current assets (Claude Code Max, GCP server, Korean APIs)?"

## Step 2: Assign Roles

```
Claude: Evaluate build complexity and technical readiness for each candidate
GPT:    Audit business viability, scoring criteria consistency, and risk factors
Gemini: Assess market validation angle — who buys and why
```

## Step 3: Dispatch (Parallel)

All three AIs received the same candidate list and evaluation criteria:
- Build Speed (50% weight)
- Time-to-Revenue (20%)
- Technical Readiness (15%)
- Original Rating (15%)

## Step 4: Results

| AI | Pick | MVP Timeline | Key Argument |
|----|------|-------------|-------------|
| Claude | #36 (Claude Code plugin) | 2-3 days | "Not building — packaging existing assets" |
| GPT | #36 (Claude Code plugin) | 1-2 weeks | "Lowest build complexity, highest asset reuse" |
| Gemini | #31 (MCP server market) | 3 days | "80 analyzed APIs = ready inventory" |

## Step 5: Convergence

**Consensus (2:1):** Item #36 — Claude Code plugin/framework
- Claude + GPT agreed: packaging > building
- Gemini's #31 pick was noted as the strong #2 candidate

**Decision:** Start with #36, then #31 as the second project.

## Lessons

1. The 3-AI approach revealed that Claude and GPT agreed on "speed of packaging vs speed of building" while Gemini focused on "market readiness"
2. Both perspectives were valid — they just optimized for different things
3. The final decision used majority vote + synthesis of the minority opinion
