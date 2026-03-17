# Example: New Project Protocol in Action

This example shows the 9-step protocol applied to a real project: a GEO-SEO analysis web tool.

## Completed Protocol

### 1. Identity
- **Type**: Web tool (SaaS product)
- **Problem**: Websites are not optimized for AI-powered search engines (ChatGPT, Perplexity, Gemini)
- **Value**: Analyze any URL and get a GEO score + actionable optimization plan
- **Output**: Web app with URL input → analysis report → score + recommendations

### 2. Root Case
- **Name**: AuditCase
- **Starts**: User submits a URL for analysis
- **Ends**: Analysis report delivered with GEO score and action items

### 3. Ontology Chain
- **Evidence**: URL content, meta tags, schema markup, robots.txt, page structure
- **Execution**: 7 analysis modules (technical, content, schema, citability, crawlers, brand, platform)
- **Finding**: Scores per module, identified gaps, optimization opportunities
- **Recommendation**: Prioritized action items with expected impact
- **Report**: Composite GEO score (0-100) + module breakdown + action plan
- **State**: submitted → crawling → analyzing → scored → reported

### 4. Entities
- **AuditCase**: url, submitted_at, status, geo_score, modules[]
- **Module**: name, score, findings[], recommendations[]
- **Finding**: severity, description, affected_element
- **Recommendation**: priority, action, expected_impact

### 5. Hard Rules
1. No score without at least 3 modules completed
2. No recommendation without supporting finding
3. No finding without evidence (actual page data)
4. No publish without all 7 modules passing validation

### 6. First Batch
[x] New project bootstrap

### 7. Roles
- **Executor**: Claude (implementation)
- **Architecture reviewer**: GPT (scoring model, module contracts)
- **UX reviewer**: Gemini (report layout, information hierarchy)

### 8. Gates
- [x] Scoring model approval (GPT reviewed)
- [x] UX review (Gemini reviewed)
- [ ] Deploy approval (Human)

### 9. Result
Project shipped as SearchLens. 81/81 tests passing. 7 analysis modules. 3-AI cross-review completed twice.

## Lessons

1. The protocol prevented scope creep: original plan had 12 modules, protocol forced cut to 7 for MVP
2. Root case definition clarified that "analysis report" was the product, not "SEO monitoring"
3. Hard rule #2 (no recommendation without finding) caught 4 cases where the system was generating generic advice
