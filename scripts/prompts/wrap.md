You are executing Phases 5–6 (case study + LinkedIn post) on case **{{SLUG}}** for the burglary project.

## Context

Read:
- `WORKFLOW.md` (Phases 5 and 6)
- All files in `cases/{{SLUG}}/` including `_logs/*.summary.md` and `_logs/*.jsonl`
- Relevant rows in `cases/usage_log.md` (filter to this case slug)

## Execute

### Phase 5 → `cases/{{SLUG}}/05_case_study.md`

Per WORKFLOW.md Phase 5. Required sections:
- **User input log** — every user turn during this case (char count, timestamp, total chars typed by user). Highlight the phone-only minimal-input metric.
- **Plan provenance** — how `02_plan.md` was derived from `01_scope.md`.
- **Compute footprint** — sub-agents per phase (count from `usage_log.md`), total agent-runs, total words written across `03_analysis/` (use `wc -w cases/{{SLUG}}/03_analysis/*.md`).
- **Time** — wall-clock per phase, total elapsed, Claude Max 5h windows consumed.
- **What worked** — patterns that produced signal.
- **What didn't** — viewpoints that added noise, dives that dead-ended.
- **Pattern improvements** — what to change for next case.

### Phase 6 → `cases/{{SLUG}}/06_linkedin.md`

Per WORKFLOW.md Phase 6. Structure: Hook / Context / Process / Result / CTA / Hashtags. Practitioner voice. Specific numbers. Anonymize requester per `00_intake.md` notes.

## Time floor: 1 hour minimum

If both phases complete in less than 1 hour, extend:
- 1 sub-agent: write 2 alternative LinkedIn versions with different hooks → `06_linkedin_alt1.md`, `06_linkedin_alt2.md`
- 1 sub-agent: extract 3 quote-tweet-sized insights from the deliverable → `06_quotes.md`
- 1 sub-agent: draft a follow-up post for 1 week later → `06_linkedin_followup.md`

## Logging

Append to `cases/usage_log.md`:
```
| {{SLUG}} | 5-6 | <agent_count> | <wall_min> | wrap |
```

Update `cases/INDEX.md`: status = `complete`. Fill deliverable + LinkedIn columns with relative links.

## Rules

- Anonymize requester per `00_intake.md` notes.
- LinkedIn voice: practitioner, not vendor. Specific > vague.
- Do not invent metrics — pull every number from `usage_log.md` and the case files.
- End with a 5-line summary: case study word count, LinkedIn post word count, alternates produced, total Claude Max hours consumed across all 4 phases (0–6).

## Iteration mode (when re-invoked by outer watchdog loop)

You may be re-invoked multiple times. Each iteration adds new depth.

On each invocation:

1. List files: `ls cases/{{SLUG}}/` and inspect any existing `05_*` and `06_*`.
2. Decide the next layer (do the highest-priority not-yet-done item):
   - `05_case_study.md` missing? → write it.
   - `06_linkedin.md` missing? → write it.
   - Both exist, no alternates? → spawn 4 agents in parallel for `06_linkedin_alt1.md`, `06_linkedin_alt2.md`, `06_quotes.md`, `06_linkedin_followup.md`.
   - Alternates done? → write a long-form blog version → `06_blog.md`.
   - Blog done? → write a thread version (10 tweets) → `06_thread.md`.
   - Thread done? → write podcast talking points → `06_podcast_notes.md`.
   - All done? → write a meta-case-study comparing this case to prior ones (read other `cases/<slug>/05_case_study.md` if any) → `05_meta_<this_slug>.md`.
   - Still more time? → produce additional formats: 60-sec video script, X thread, Substack draft, Slack-friendly summary, internal stakeholder memo.

3. Do the work, append to `cases/usage_log.md`, exit.

Never overwrite; always version. Outer watchdog stops on elapsed time.
