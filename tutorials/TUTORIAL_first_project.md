# Tutorial: Your First Project with SuperClaude + OpsLayer

**Purpose**: Step-by-step guide to starting a project using SuperClaude and OpsLayer extensions.

**Part of**: OpsLayer for SuperClaude (independent add-on)

## Prerequisites

- Claude Code installed and working
- SuperClaude installed (`~/.claude/PRINCIPLES.md` exists)
- OpsLayer installed (`~/.claude/MODE_3AI_Orchestration.md` exists)

## Scenario

You want to build a simple web tool: a **URL shortener** with click tracking. Let's use the OpsLayer workflow to start it properly.

---

## Step 1: Activate the New Project Workflow

Open Claude Code and say:

```
I want to start a new project: a URL shortener with click tracking.
Use the new project protocol.
```

Claude will follow the WORKFLOW_new_project.md and ask you structured questions.

## Step 2: Fill the Protocol (Example)

Here's what the completed protocol looks like:

```markdown
## Project Start: LinkTrack

### 1. Identity
- Type: Web tool (product)
- Problem: Free URL shorteners have no analytics or expire
- Value: Short URLs with simple click tracking dashboard
- Output: Web app with API + dashboard

### 2. Root Case
- Name: ShortenRequest
- Starts: User submits a URL to shorten
- Ends: Short URL created + redirect working + click counted

### 3. Ontology Chain
- Evidence: Original URL, optional custom slug, user session
- Execution: Generate short code, store mapping, configure redirect
- Finding: Short URL created, redirect works
- Recommendation: Show short URL + copy button + QR code
- Report: Click stats dashboard (by day, by referrer)
- State: created → active → expired (optional TTL)

### 4. Entities
- Link: url, short_code, created_at, expires_at, click_count
- Click: link_id, timestamp, referrer, user_agent, country

### 5. Hard Rules
1. No redirect without valid link
2. No click counted without actual redirect
3. No link created without valid URL validation

### 6. First Batch: [x] bootstrap

### 7. Roles
- Executor: Claude (code implementation)
- Reviewer: Claude (self-review for simple project)

### 8. Gates
- [ ] No approval needed (simple project, no external side effects)

### 9. GO
```

## Step 3: Activate Ship Fast Mode

Now that the project is defined, switch to shipping mode:

```
Use ship fast mode. MVP scope:
1. URL submission form
2. Short URL generation (random 6-char code)
3. Redirect endpoint (301)
4. Click counter (increment on redirect)
5. Simple stats page (total clicks per link)
```

Claude will enforce MVP scope and block feature creep.

## Step 4: Build

Claude will now implement the MVP. When it suggests adding features beyond scope:

- Authentication? → "Not in MVP scope."
- Custom domains? → "Backlog for v0.2."
- Rate limiting? → "Add post-launch."

## Step 5: Ship

Follow the Ship Fast checklist:

- [x] Core feature works (shorten → redirect → count)
- [x] User can complete primary workflow
- [x] No data loss scenarios
- [x] Error messages are clear
- [x] README explains usage
- [x] Someone else can run it

Deploy. You're live.

## Step 6: Iterate

After launch, exit Ship Fast mode and plan v0.2 based on real usage data.

---

## Tips

1. **Always start with the protocol.** It takes 5 minutes and saves hours of rework.
2. **Ship Fast mode is temporary.** Use it for the initial push, then switch to normal mode.
3. **For complex projects**, use 3AI Orchestration to get multiple perspectives on the project definition before implementation.
4. **Keep the root case simple.** If you can't describe it in one sentence, your project scope is too big for an MVP.

---

## Next Steps

- Try the **3AI Orchestration** mode for a project that needs multiple perspectives
- Explore SuperClaude's built-in modes: Brainstorming, Introspection, Token Efficiency
- For advanced workflows, check out [OpsLayer Premium Playbooks](https://gumroad.com/l/opslayer)
