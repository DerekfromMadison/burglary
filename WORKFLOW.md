# Workflow — Business Request Analysis Pipeline

5 cases × ~20h Claude Max each. Phone-only input. Per-case output: business deliverable + case study + LinkedIn post.

## Trigger phrases (user → assistant)

| User says | I do (in this session, via Agent tool) |
|---|---|
| `new case <slug>: <paste>` | **Full pipeline (default)**. Phases 0–6 + reviewer chain. End-to-end. No further triggers needed. See "Full pipeline orchestration" below. |
| `override <topic>: <value>` | Override a committed assumption in `_logs/decisions.md`. Re-run from the affected phase forward. |
| `status` | Read `INDEX.md` + `usage_log.md` + recent `_logs/`, summarize. |
| `resume <slug>` | Read latest numbered file in `cases/<slug>/`, continue from there. |
| `analyze` / `more depth` / `deliverable` / `wrap` | **Manual overrides** for partial runs. Use only if the full pipeline misbehaved or the user wants to re-run a specific phase. Default flow does not require these. |

Default execution mode: **in this session**. I spawn sub-agents via my `Agent` tool — no shell-out, no script. Sub-agents write to disk. The user is never asked to run a command and is never asked clarifying questions; assumptions are committed automatically and logged.

Resumability: every phase writes to disk. Any new session can pick up by reading the latest file in `cases/<slug>/`.

## Full pipeline orchestration (default for `new case`)

When the user pastes `new case <slug>: <paste>`, run all 6 phases without further user input. Sequence:

1. **Phase 0 — Intake**. Write `00_intake.md`.
2. **Phase 1 — Scope**. Write `01_scope.md`. Commit all inferred assumptions to `_logs/decisions.md`. NO open questions surfaced to user.
3. **Phase 2 — Plan**. Write `02_plan.md`. Pick 8–10 viewpoints + 5 likely Round D topics from `prompts/viewpoints.md`.
4. **Phase 3 Round A**. Spawn 8–10 parallel viewpoint sub-agents (one message, multiple Agent calls). Each writes `03_analysis/A_<viewpoint>.md`.
5. **Phase 3 Round B**. Main thread synthesis → `03_analysis/B_synthesis.md`.
6. **Phase 3 Round C+D**. Spawn 1 red-team agent + 5 deep-dive agents in parallel. Each writes its file.
7. **Phase 3 Round E**. Main thread final synthesis → `03_analysis/E_final.md`.
8. **Phase 3 Round F**. Spawn red-team-v2 + steelman in parallel → `F_red_team_v2.md`, `F_steelman.md`.
9. **Phase 3 Round F-review**. Spawn steelman reviewer (sequential after F) → `F_steelman_review.md` + `F_steelman_v2.md`.
10. **Phase 4 + Phase 5/6 drafts**. One agent writes `04_deliverable.md` + `05_case_study.md` + `06_linkedin.md` (drafts).
11. **Phase 4/5/6 reviewer**. Sequential after step 10. Reads F_red_team_v2 findings + the drafts, fact-checks, writes `04_review.md` + `04_deliverable_v2.md` (mandatory) + `05_case_study_v2.md` (if needed) + `06_linkedin_v2.md` (if needed).
12. **Audit + meta**. Spawn credits-audit agent + interaction-log/automation-suggestions agent in parallel (can run concurrent with step 10–11). Write to `_logs/`.
13. **Update INDEX + usage_log**. Mark case `complete`. Link v2 deliverable + LinkedIn.
14. **Final report to user**. One message with: file inventory, top finding, top correction the reviewer made, compute totals.

Steps 4, 6, 8 are parallel-agent batches. Steps 9, 11, 14 are sequential dependencies. Steps 12 can overlap with 10–11. Total expected: 25–30 sub-agents, ~2M tokens, ~30 min wall time per case.

## Per-case directory layout

```
cases/<slug>/
  00_intake.md
  01_scope.md
  02_plan.md
  03_analysis/
    A_<viewpoint>.md     (one per viewpoint, parallel)
    B_synthesis.md
    C_red_team.md
    D_<topic>.md         (deep dives, parallel)
    E_final.md
  04_deliverable.md
  05_case_study.md
  06_linkedin.md
```

---

## Phase 0 — Intake

User pastes raw request. Source/industry/constraints optional.

Write `00_intake.md`:
- Timestamp received (ISO 8601)
- Source (anonymize on user request)
- Industry / domain tag
- Raw request text (verbatim, blockquoted)
- User-provided constraints / out-of-scope notes

## Phase 1 — Scope

Extended thinking. Read intake. Write `01_scope.md`:
- **Problem statement** — 1 paragraph, the actual question
- **Stakeholders** — who is affected, who decides, who pays
- **Success criteria** — measurable; what does "answered well" look like
- **Knowledge domains** — expertise the analysis requires
- **Risk / sensitivity** — confidentiality, regulatory, reputational
- **Out of scope** — explicit exclusions
- **Committed assumptions** — for every value not in the intake (founder identity, budget, timeline, team, channel, risk tolerance, etc.), commit to the most defensible inference and write it to `_logs/decisions.md` with a 1-line rationale + confidence tag. Do NOT list "open questions for requester." Do NOT block the pipeline. The user can override any committed assumption by sending `override <topic>: <new value>`; otherwise the assumption stands.

Hard blockers (illegal request, data not inferable or web-researchable) are still surfaced to the user — these are rare. Default: commit, log, continue.

## Phase 2 — Analysis Plan

Pick viewpoints, define rounds. Write `02_plan.md`:
- **Selected viewpoints** (5–8 from `prompts/viewpoints.md`) + 1-line justification each
- **Round structure** — A/B/C/D/E (see Phase 3)
- **Likely deep-dive topics** — Round D candidates
- **Data sources** — what to web-research, what to assume
- **Deliverable outline** — sections of `04_deliverable.md`
- **Methodology risks** — bias, data gaps, scoping issues to monitor

## Phase 3 — Multi-Round Analysis  (the credit furnace)

### Round A — Parallel viewpoint analysis

For each selected viewpoint, spawn a sub-agent **in parallel** (single message, multiple `Agent` tool calls).

Per-agent prompt skeleton:
```
You are analyzing this business request from the <VIEWPOINT> perspective.
Persona: <copy from prompts/viewpoints.md#<viewpoint>>
Inputs (read these): cases/<slug>/00_intake.md + cases/<slug>/01_scope.md
Task: produce a 1500–3000 word analysis specific to your viewpoint.
Required sections:
  1. What this viewpoint sees (key concerns / opportunities)
  2. Specific findings (numbered, evidence-cited)
  3. Recommendations from this lens
  4. What you cannot tell from this viewpoint (epistemic humility)
Web research allowed; cite sources.
Output: write file cases/<slug>/03_analysis/A_<viewpoint>.md
```

Subagent type: `general-purpose` (research + write) or `Explore` (research-heavy, no writes).

### Round B — Cross-viewpoint synthesis  (main thread)

Read all `A_*.md`. Write `B_synthesis.md`:
- **Convergences** — where viewpoints agree
- **Contradictions** — where they conflict + why
- **Gaps** — what no viewpoint covered well
- **Highest-stakes findings** — top 3–5, ranked
- **Unresolved questions** — feed Round D

### Round C — Adversarial red-team

Spawn 1 sub-agent (`pragmatist` or `general-purpose`):
```
Read cases/<slug>/03_analysis/B_synthesis.md.
Stress-test every recommendation:
  - Strongest counter-argument?
  - Most likely failure mode?
  - What's wishful or missing?
  - Cheaper / simpler alternative we're overlooking?
Output: cases/<slug>/03_analysis/C_red_team.md
```

### Round D — Deep dives

For each of top 2–5 unresolved questions / highest-stakes findings, spawn 1 sub-agent in parallel:
```
Deep-dive on: <question>
Web research encouraged.
Output: cases/<slug>/03_analysis/D_<short_slug>.md
Sections: question, evidence, reasoning, conclusion + confidence, sources.
```

### Round E — Final synthesis  (main thread)

Read everything in `03_analysis/`. Write `E_final.md`:
- Reconciled findings with confidence levels
- Reconciled recommendations
- Key tradeoffs
- Open questions remaining

`E_final.md` is the source for Phase 4.

### Time-extension hook (Ralph-loop compatible)

If running inside a Ralph loop with min duration unmet after Round E:
- Spawn additional Round D dives on second-tier questions
- Run a Round F second adversarial pass on `E_final.md`
- Spawn deep verification agents for any high-stakes numerical claim
- Continue until min duration reached, then `<promise>CASE_COMPLETE</promise>`

## Reviewer pairing (mandatory for Phase 4 + Phase 6)

Every "build something" agent in Phases 4 and 6 is paired with a reviewer sub-agent that runs sequentially after the draft is written. The reviewer:
1. Reads `F_red_team_v2.md` (factual / calibration corrections from Round F).
2. Reads the just-written draft.
3. Web-verifies any specific factual claims surfaced by F_red_team_v2.
4. Writes a review report (`<phase>_review.md`).
5. Writes a v2 of the draft applying corrections (mandatory if F_red_team_v2 surfaced ANY error that propagated into the draft).

The user never asks for review — it happens automatically.

## Phase 4 — Deliverable

Audience: the business owner. Plain language. Action-oriented.

Write `04_deliverable.md`:

```
# <Title>

## Executive Summary  (≤300 words)
Three sentences on problem, finding, recommendation.

## Problem
What you asked, why it matters, what we scoped.

## Findings
Numbered. Each: claim → evidence → confidence.

## Options
2–4 paths forward. Cost / time / risk / upside per option.

## Recommendation
Pick one. Justify in 1 paragraph.

## 90-Day Roadmap
Week-by-week or milestone-by-milestone.

## Risks & Mitigations
Top 5. What kills this; what to do about it.

## Open Questions
What we couldn't resolve and what would resolve it.

## Appendix
- Methodology
- Viewpoint summaries (link to A_*.md)
- Sources
```

## Phase 5 — Case Study

Write `05_case_study.md`:
- **User input log** — every user turn, char count, timestamp. Highlight: how minimal was the input?
- **Plan provenance** — how `02_plan.md` was derived from `01_scope.md`
- **Compute footprint** — sub-agents per phase (count, type, wall-time), total agent-runs, approximate words written (`wc -w cases/<slug>/03_analysis/*.md`)
- **Time** — wall-clock per phase, total elapsed, Claude Max windows consumed
- **What worked** — patterns that produced signal
- **What didn't** — viewpoints that added noise, dives that dead-ended
- **Pattern improvements** — what to change for next case

## Phase 6 — LinkedIn Post

Write `06_linkedin.md`:
- **Hook** (1 line) — surprise / counterintuitive insight from case
- **Context** (2–3 lines) — anonymized problem, who asked, why interesting
- **Process** (3–4 lines) — how Claude analyzed (X viewpoints, Y agents, Z hours)
- **Result** (2–3 lines) — top finding + recommendation, anonymized
- **CTA** — slot N of 5; how to submit a request for remaining slots
- **Hashtags**

Voice: practitioner, not vendor. Specific numbers > vague claims.

## Cross-case files

- `cases/INDEX.md` — one row per case (slug, received, industry, current phase, status, link)
- `cases/usage_log.md` — append per phase (case, phase, sub-agents, wall-min, notes)
- `prompts/viewpoints.md` — viewpoint catalog + selection guidance

## Detached headless mode (optional fallback)

For unattended overnight runs only — when the user wants to disconnect phone entirely and come back hours later. Not the default.

```bash
bash scripts/run_case.sh <slug> analyze --hours 5         # watchdog: re-invoke until 5h elapsed
bash scripts/run_case.sh <slug> deliverable --hours 2
bash scripts/run_case.sh <slug> wrap --hours 1
# add --yolo to bypass permission prompts entirely
```

What it does: shells out to `claude -p --permission-mode auto --effort max --output-format stream-json` with the matching `scripts/prompts/<phase>.md`. The `--hours N` flag wraps the invocation in a watchdog loop that re-invokes until elapsed time is met — this IS a Ralph loop, just under a different name. Continuity between iterations is held by disk state (the iteration-mode section in each prompt tells the next invocation what artifacts already exist and what to add).

Logs land in `cases/<slug>/_logs/<ts>_<phase>_iter<N>.jsonl` plus a `_done.summary.md`.

Use this only when:
- The user wants to detach completely (close phone, sleep, return).
- The in-session flow has misbehaved.
- The user specifically wants to max out wall-clock time rather than burst-burn allocation.
