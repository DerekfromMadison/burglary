# Case study v4 — thai-inhaler

**The headline**: 54 sub-agents and ~4M tokens produced a polished, internally contradictory plan. The user's pushback is what corrected it. The most useful agent in the loop was the human.

## What the founder asked for vs. what they got

**Asked**: a deep market research document on US aromatherapy + marketing approaches that differentiate.

**Delivered (v6)**: a marketing-first 90-day Phase-0 measurement instrument with single canonical $12 SKU, 40-customer target (not 100), honest CAC math ($140 cash / $240–$400 loaded), USPTO IP Accelerator path, day-75 kill-switch on Sean Ellis <30%, and 10 lifecycle retention flows.

The 5 versions in between (v1–v5) progressively over-indexed on regulatory work, IP filings, and bundle economics — until the user explicitly said: "This is trying to identify product market fit. What the f*** are you talking about getting all these patents and identities and trademarks?"

That single pushback eliminated 4 sub-doc sections and reframed the entire 90-day plan.

## Compute footprint (precise)

| Round | Sub-agents | Tokens | Wall (parallel max) | Output |
|---|---|---|---|---|
| Phase 3 (A + C + D) | 16 | 1,416,148 | 25 min | 17 analysis files |
| F (red-team v2 + steelman + reviewer) | 3 | 207,493 | 6 min | 3 files |
| Phase 4 + audit + meta + reviewer | 4 | 313,395 | 11 min | 7 files |
| Rewrite (v3 exec-summary) | 1 | 173,074 | 19 min | 8 files |
| 10-viewpoint critique batch | 10 | 391,920 | 5 min | 10 critique files |
| Progress review | 1 | 40,892 | 2 min | 1 file |
| Wave 1 marketing strategy | 13 | ~910,000 | 8 min | 14 sub-docs |
| Wave 3 gap-finders | 5 | ~344,000 | 3 min | 5 gap reports |
| Wave 4 gap-filler integrator | 1 | 134,906 | 11 min | 6 files (v6 + 5 sub-doc revisions) |
| Main-thread integrations | 0 | est. ~700k | ~25 min total | v3, v4, v5, v6 main-thread synthesis |
| **Total** | **54** | **~4,030,000** | **~115 min wall** | **~150k words across 80+ files** |

Sub-agent token counts are precise per Agent tool return metadata; main-thread tokens are estimated.

## What corrected the AI's mistakes

The AI's structural errors were caught at three different layers:

1. **Multi-agent red team caught factual + scope errors** (v2 → v3 → v4): Apothékary "1700+ Whole Foods + Ulta" was arithmetically impossible; menthol+camphor inhaler is OTC drug not cosmetic; supplier-equity 60-day timeline impossible against Thai business norms; brand identity not specified.

2. **User pushback caught the framing error** (v5): The whole regulatory-and-IP-first orientation was wrong. The founder asked for marketing strategy. AI was leading with the constraints, not the strategy.

3. **Gap-finder agents caught economics + execution + journey gaps** (v6): Price ladder contradicted itself across 4 docs ($12 vs $14/$24/$36 vs $24 vs $36 starter). Solo founder workload was 71–90 hr/wk. Habit cue was missing entirely. Cash-only CAC was $140 not <$50. Amazon impossible in 90 days without IP Accelerator. P&L was −$18,800 not breakeven.

The pattern: AI converges; humans diverge. AI agents in parallel produce sophisticated-sounding, mutually-reinforcing recommendations even when those recommendations are uniformly wrong about the framing question.

## What worked

- **Round-A 10 viewpoints** surfaced the founder-identity bifurcation that 7 of 10 lenses independently flagged.
- **Round-F red-team v2** caught the Apothékary footprint error (cited by 3 prior viewpoints with no fact-check).
- **Wave 3 gap-finders** ran independently per lens — the strategy / execution / channels / journey / economics split was cleanly disjoint, no redundancy.
- **Single Wave-4 integrator** produced internally consistent v6 — an integrator agent rather than parallel writes prevented re-introducing contradictions.
- **User pushback** was 3 sentences and saved the project from shipping a bad recommendation.

## What didn't

- **Recommendation persistence**: AI kept proposing IP filings + trademark work as Y1 priorities through v5 even after multiple critique rounds had flagged the Y1 budget. Required user pushback to cut.
- **Number reconciliation**: across 14 marketing sub-docs, the price showed up as $12 / $14 / $24 / $36 / $36 starter — agents wrote without cross-referencing other agents' assumptions. Single integrator was needed.
- **Founder workload silence**: not one sub-doc tallied the founder hours implied by all 14 playbooks combined. Required gap-finder agent to surface 71–90 hr/wk.
- **Optimistic CAC math**: the "<$50 blended CAC" figure repeated through v5 without a unit-economics audit. Required gap_economics agent to surface honest $140.

## Pattern improvements for cases 2–5

1. **Run gap-finders BEFORE the rewrite, not after.** Wave-3 patterns should be the second pass, not the fifth.
2. **Reconcile numbers in a dedicated "consistency check" agent** before any deliverable ships. Cheap insurance.
3. **Tally founder workload in a "feasibility check" agent** as a standard sub-doc.
4. **The user's framing pushback is the most-important input** — solicit it explicitly after Phase 0–2 rather than waiting for it after Phase 4.
5. **The single-integrator pattern** (Wave 4) is dramatically better than parallel-writers for consistency. Use it for ALL deliverable rewrites.
6. **Pre-canned industry config** (still pending implementation) — Move 2 from `_logs/automation_suggestions.md` would have caught the marketing-vs-regulatory framing question at Phase 1 by asking "is this a regulated-product launch or a brand-launch?" up front.

## Total project budget remaining

~115 minutes wall-clock for Case 1, ~4M tokens. Well under the original 4× 5h-window-per-case target. Current burn: ~25% of one 5h window for one full case. Project budget: ~3 windows + change remaining for cases 2–5.

## Versioning

Canonical (current): `04_deliverable_v6.md`, `06_linkedin_v5.md`, this case study (`05_case_study_v4.md`).

Audit trail (all retained): v1–v5 of the deliverable, v1–v4 of the LinkedIn post, v1–v3 of the case study. The version history IS part of the case study — it shows where AI converged on wrong answers and how human pushback redirected.

## The one sentence the founder needs

**File the USPTO IP Accelerator petition on Day 1 ($100 fee), pick West LA + post-Pilates as your beachhead, ship one $12 single-SKU with the 3pm-sticker habit cue, and treat the 90-day plan as a measurement instrument with a Day-75 kill-switch — not as a launch.**
