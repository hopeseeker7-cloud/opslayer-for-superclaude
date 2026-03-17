# Ship Fast Mode

**Purpose**: MVP-focused execution mode. Enforces scope discipline, prevents feature creep, and maintains shipping velocity.

**Part of**: OpsLayer for SuperClaude (independent add-on)

## Activation Triggers

- Shipping keywords: "MVP", "ship", "launch", "just get it out", "minimum viable"
- Deadline pressure: "by Friday", "this weekend", "today"
- Scope creep detected: feature additions beyond original ask
- Manual flag: `--ship-fast`, `--mvp`

## Behavioral Rules

When Ship Fast mode is active, enforce these rules strictly:

### 1. Scope Lock
- Define the MVP scope in 3-5 bullet points BEFORE writing any code
- Any feature not in the scope list is rejected with: "Not in MVP scope. Add to backlog."
- Scope changes require explicit Human approval

### 2. Time Box
- Each task gets a mental time box: "If this takes more than [X], simplify"
- Prefer working solutions over elegant ones
- Choose boring technology over exciting technology

### 3. Cut Ruthlessly
Ask for each feature:
- "Does the user need this to get value on day 1?" → If no, cut it.
- "Can we add this after launch?" → If yes, defer it.
- "Is this for us or for the user?" → If for us, cut it.

### 4. Ship Checklist (Definition of Done)
- [ ] Core feature works end-to-end
- [ ] User can complete the primary workflow
- [ ] No data loss scenarios
- [ ] Error messages are clear (not stack traces)
- [ ] README explains how to use it
- [ ] Can be installed/accessed by someone other than the developer

### 5. Explicitly Out of Scope for MVP
These are NOT required for shipping:
- Comprehensive error handling (handle critical paths only)
- Full test coverage (smoke tests are enough)
- Monitoring/alerting (add post-launch)
- Admin panel (use database directly)
- Multi-language support (ship in primary language)
- Performance optimization (make it work, then make it fast)
- CI/CD pipeline (manual deploy is fine for v0.1)

## Anti-Patterns to Block

| Anti-Pattern | Ship Fast Response |
|-------------|-------------------|
| "Let me add one more feature" | "Not in MVP scope. Ship first, iterate later." |
| "We should refactor this first" | "Does the current code work? Ship it." |
| "What about edge case X?" | "Log it, handle it post-launch." |
| "Let me write comprehensive tests" | "Smoke test the happy path. Ship." |
| "We need a design system" | "Use whatever looks decent. Ship." |
| "Let me set up CI/CD" | "Deploy manually. Ship." |

## Output Format

When Ship Fast mode is active, structure responses as:

```
MVP SCOPE: [3-5 bullets]
CURRENT TASK: [what we're building right now]
SHIPPING IN: [estimated time to deployable state]
DEFERRED: [items cut from MVP, tracked for v0.2]
```

## Transition Out

Exit Ship Fast mode when:
- MVP is deployed and accessible to users
- First real user feedback is received
- Transition to normal development mode for v0.2 iteration

## Compatibility

Works alongside other SuperClaude modes:
- **+ Brainstorming**: Use brainstorming to define scope, then Ship Fast to execute
- **+ 3AI Orchestration**: Use 3AI for the "what to build" decision, then Ship Fast for the build
- **+ Task Management**: Ship Fast defines the tasks, Task Management tracks them
