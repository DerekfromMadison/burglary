# burglary — multi-agent business analysis pipeline

Five LinkedIn-sourced business requests, each processed through a deep multi-agent Claude analysis pipeline. Phone-only input. Output per case: business deliverable + case study + LinkedIn post.

Started 2026-04-27 after a laptop theft made full Claude Max usage worth banking before the credits expired.

## Status

| # | Slug | Industry | Status | Deliverable |
|---|---|---|---|---|
| 1 | [thai-inhaler](cases/thai-inhaler/) | Wellness / aromatherapy | complete | [v4](cases/thai-inhaler/04_deliverable_v4.md) + [details/](cases/thai-inhaler/04_details/) |
| 2 | _open_ | | | |
| 3 | _open_ | | | |
| 4 | _open_ | | | |
| 5 | _open_ | | | |

See [`cases/INDEX.md`](cases/INDEX.md) for the live ledger.

## How it works

1. User pastes `new case <slug>: <text>` (one message, ~500 chars).
2. Pipeline runs Phases 0–6 + reviewer chain in this session via parallel sub-agents (~25–35 sub-agents per case, ~2.5M tokens, ~75 min wall).
3. Output: founder-readable executive-summary deliverable + detail sub-docs + case study + LinkedIn post.

The complete playbook is in [`WORKFLOW.md`](WORKFLOW.md). The viewpoint catalog (20 analytical lenses) is in [`prompts/viewpoints.md`](prompts/viewpoints.md). Automation roadmap for reducing user-input further is in [`_logs/automation_suggestions.md`](_logs/automation_suggestions.md).

## Key pattern

The red team is the analysis. The synthesis is a hypothesis.

For Case 1, the synthesis (Round B + E) produced a workable hypothesis. The adversarial passes (Round F + 10-viewpoint critique batch) caught four structural errors that would have killed the brand if shipped: wrong FDA classification (cosmetic vs. OTC drug), wrong supplier tier (brand-principal vs. OEM), impossible Thai timeline (60 days vs. 9–12 months realistic), and undesigned product entering Phase 0 validation.

## Repo layout

```
WORKFLOW.md                     master playbook
CLAUDE.md                       project context
prompts/viewpoints.md           20-viewpoint catalog
scripts/                        headless launcher (fallback)
cases/INDEX.md                  case ledger
cases/usage_log.md              compute tracking
cases/<slug>/                   per-case work
  00_intake.md                  raw request
  01_scope.md                   problem framing
  02_plan.md                    viewpoint selection
  03_analysis/                  Round A-F outputs
  04_deliverable_v4.md          founder-facing exec summary
  04_details/                   detail sub-docs
  05_case_study_v3.md           process retrospective
  06_linkedin_v4.md             promotion post
  _logs/                        decisions / interaction logs / per-agent stats / critique reports
```
