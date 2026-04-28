# Case Study — thai-inhaler

**Headline.** 23 sub-agents, ~2M tokens, ~75 min wall, ~5,400 → 500 chars typed by founder → one founder-readable deliverable.

---

## The Numbers

| Metric | Value |
|---|---|
| Total user characters typed (project + case) | ~5,400 |
| Bulk content (case framing, message 7) | 430 chars |
| Trigger word ("Analyze") | 7 chars |
| Bulk-to-trigger ratio | 61× |
| Sub-agents executed | 23 (Phase 3: 16 incl. red-team C; Phase 3F: 1 second red team; Phase 4 rewrite: 6 sub-doc rewrites in serial) |
| Compute tokens | ~2.0M |
| Wall-clock total | ~75 min |
| Output words across `03_analysis/` | ~50,000 |
| v3 deliverable | 983 words (down from v2's 5,682 = 83% compression) |
| Sub-docs produced | 7 (3,175 words total) |

## What Worked

**Parallel 10-viewpoint fan-out.** Orthogonal coverage at the cost of one agent's wall time. With 5 viewpoints, cultural-authenticity collapsed into PR + domain. With 15+, synthesis hit context strain. 10 was the right cardinality for a multi-domain CPG question.

**The C-narrowed-B pattern.** Round C (red team) was the highest-leverage agent in the entire pipeline. Round B rated four findings "high confidence" that C correctly demoted. The single most important downstream artifact — the Phase 0 cheap-validation gate — was C's invention, not B's. Without C, the deliverable would have recommended ordering custom inventory at $25–100k against an unvalidated wedge. The gap between those two recommendations is roughly the value of the entire pipeline.

**Phase 0 reframe as document spine.** The founder asked for "deep market research + marketing approaches"; the honest answer was "validated launch plan with explicit kill-switches and a cheap-validation gate." That reframe came out of C §5b and got escalated to lead recommendation in Round E.

**Round F second-pass red team.** Caught what survived B → C → E. Three new cracks: median-calibrated Phase 0 thresholds dressed as go-signals; Apothékary cited as "1700+ Whole Foods + Ulta" (arithmetically impossible, $570 WF stores total); 60-day supplier-equity window contradicting Diaspora's 7-month precedent. F's recalibration is the basis for v2 → v3 corrections.

**Committed-decisions log.** `_logs/decisions.md` captured every "open question" with a committed answer the moment the user said "answer all questions yourself." Eliminated re-litigation downstream.

## What Didn't

**Round B was too generous on confidence.** Pulling positive claims forward from each viewpoint produces a stack that looks more confident than its joint probability supports. Future iteration: explicit joint-probability calculation when conjoining claims (the four-link 70% bet = 24% joint).

**Some Round-A overlap.** CMO and competitor produced overlapping content on premium roll-on positioning. CFO and risk overlapped on FDA classification. Convergence signal, not waste — but tightening the role-boundary briefs is a future delta.

**Two Round-D topics could have been deeper.** `D_diff_map` on bundle-format adjacency, `D_creator_fit` on FTC-affiliate-channel enforcement. Compressed by fixed word budgets. Future iteration: "Round D-prime" reserve commissioned by synthesis agent on the deepest sub-question.

**v2 deliverable was 5,682 words.** Written for completeness, not the founder's reading time. v3's 1,000-word cap with 7 sub-docs is the structural fix: lead with conclusions, push detail to skippable sub-docs.

## Pattern Improvements for Case 2

1. **Per-industry viewpoint pre-configs.** The 10 used here work for consumer-products + cultural-authenticity. B2B SaaS, industrial, services need different rosters.
2. **Auto-trigger Phase 2 → Phase 3.** Saves 7 chars per case.
3. **Load-bearing-variables intake.** Founder identity should be Phase 0 question, not inferred at Phase 1.
4. **Joint-probability discipline** at Round B prompt.
5. **Round D-prime budget** — 10% reserve for depth.
6. **Compute-cost-per-finding accounting.** ~100k tokens/finding here.
7. **Phase 5 auto-template** from log files.
8. **Exec-summary structure by default.** v3's lead-with-conclusion + sub-docs should be Phase 4 default, not a rewrite cycle.

## Phone-Friendliness

Every user message could be voice-dictated. The 7-char "Analyze" trigger is the right friction unit for a phone-only operator. Once the pipeline is set up, a 75-min analysis launches with one word. The v3 deliverable is readable in 4 minutes on a phone — the v2 5,682-word version was not.

---

*Next case starts with load-bearing-variables intake + C-narrowed-B by default + exec-summary + sub-docs structure.*
