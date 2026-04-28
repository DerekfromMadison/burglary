You are executing Phase 4 (deliverable construction) on case **{{SLUG}}** for the burglary project.

## Context

Read first:
- `WORKFLOW.md` (Phase 4 section)
- `cases/{{SLUG}}/01_scope.md`
- `cases/{{SLUG}}/03_analysis/E_final.md`
- Any `cases/{{SLUG}}/03_analysis/D_*.md` referenced in `E_final.md`

## Execute

Write `cases/{{SLUG}}/04_deliverable.md` per the structure in WORKFLOW.md Phase 4:
- Executive Summary (≤300 words)
- Problem
- Findings (numbered: claim → evidence → confidence)
- Options (2–4 paths, with cost / time / risk / upside)
- Recommendation
- 90-Day Roadmap
- Risks & Mitigations (top 5)
- Open Questions
- Appendix (methodology, viewpoint summaries, sources)

Audience is the business owner who submitted the request. Plain language. Action-oriented. No jargon padding. Specific numbers where the analysis supports them.

## Time floor: 2 hours minimum

If first draft completes in less than 2 hours, run verification passes:
- 1 sub-agent: fact-check every numerical claim against the analysis files
- 1 sub-agent: stress-test the recommendation as a hostile reader
- 1 sub-agent: rewrite the executive summary 3 ways and pick the strongest
- 1 sub-agent: check that every finding traces back to a viewpoint or deep-dive citation

Apply the improvements. Then stop.

## Logging

Append to `cases/usage_log.md`:
```
| {{SLUG}} | 4 | <agent_count> | <wall_min> | deliverable + verification |
```

Update `cases/INDEX.md`: status column for this case = `delivered`.

## Rules

- Cite sources from the analysis files for every claim.
- Do not invent data; if a number isn't in the analysis files, label it as estimate.
- End with a 5-line summary: section count, word count, sub-agents used, top recommendation, confidence.

## Iteration mode (when re-invoked by outer watchdog loop)

You may be re-invoked multiple times. Each iteration adds new depth.

On each invocation:

1. List files: `ls cases/{{SLUG}}/` and inspect any existing `04_*` files.
2. Decide the next layer (do the highest-priority not-yet-done item):
   - `04_deliverable.md` missing? → write the v1 draft.
   - v1 exists, no verification passes? → spawn 4 verification sub-agents in parallel (fact-check / hostile-reader / exec-summary-rewrite / citation-trace) → `04_verify_<role>.md`.
   - Verification done, no v2? → integrate findings into `04_deliverable_v2.md`.
   - v2 done? → spawn 1 sub-agent per major finding to write a 1-page sidebar → `04_appendix_<finding>.md`.
   - Sidebars done? → spawn a "for the skeptical reader" alternate version → `04_deliverable_skeptic.md`.
   - All done? → spawn translators of the exec summary to: 30-second pitch, 3-minute pitch, 1-page handout. Save under `04_pitches/`.
   - Still more time? → run a second-round red-team on `04_deliverable_v2.md` and integrate into `04_deliverable_v3.md`.

3. Do the work, append to `cases/usage_log.md`, exit.

Never overwrite; always version. Outer watchdog stops on elapsed time.
