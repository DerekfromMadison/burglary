# Case study v3 — thai-inhaler

**The headline**: The red team — not the synthesis — produced the load-bearing recommendation. Across 35 sub-agents and ~2.54M tokens, the synthesis (Round B + E) was a workable hypothesis; the adversarial pass (Round F + 10-viewpoint critique) found four structural errors that would have killed the brand if shipped: wrong FDA classification (cosmetic vs. OTC drug), wrong supplier tier (brand-principal vs. OEM), impossible Thai timeline (60 days vs. 9–12 months realistic), and undesigned product entering Phase 0 validation.

## What the founder asked for vs. what they got

**Asked**: a deep market research document on US aromatherapy, focused on differentiating marketing.

**Delivered**: a validated launch plan with reformulation gate (drop camphor for cosmetic path, OR commit to OTC monograph at $25–50k), $1k Phase -1 landing-page test BEFORE inventory, OEM blank-label supplier strategy, Week-1 brand-identity sprint, and explicit indie-cash-flow vs. venture-fundable bifurcation.

The reframe is the deliverable.

## Compute footprint (precise from agent_runs.md + per-agent return metadata)

| Round | Sub-agents | Tokens | Tool uses | Wall (parallel max) |
|---|---|---|---|---|
| A (10 viewpoints) | 10 | 712,303 | 287 | 10 min |
| B (synthesis, main thread) | 0 | — | — | 3 min |
| C (red-team) | 1 | 72,291 | 10 | 5.4 min |
| D (5 deep dives) | 5 | 631,554 | 295 | 15 min |
| E (final, main thread) | 0 | — | — | 5 min |
| F (red-team-v2 + steelman) | 2 | 142,457 | 31 | 5.7 min |
| F-review (steelman reviewer) | 1 | 65,036 | 12 | 5.7 min |
| Phase 4 + 5/6 drafts | 1 | 112,734 | 16 | 7.7 min |
| Phase 4 reviewer (v2 fixes) | 1 | 111,436 | 24 | 11 min |
| Credits audit | 1 | 32,771 | 13 | 2.2 min |
| Meta (interaction log + automation) | 1 | 56,454 | 13 | 4.1 min |
| Rewrite (v3 exec-summary + 7 sub-docs) | 1 | 173,074 | 87 | 19.3 min |
| 10 critique agents | 10 | 391,920 | ~95 | 5 min |
| Progress review | 1 | 40,892 | 7 | 2.3 min |
| Phase 4 v4 integration (main thread) | 0 | — | — | 8 min |
| **Total** | **35** | **2,542,922** | **~890** | **~75 min wall** |

Numbers are precise sub-agent metadata. Main-thread tokens (this assistant's own) not included; estimated 200–400k additional.

## User input

The founder side: 9 distinct messages totaling ~5,400 chars across a phone-only session. The case content itself was 430 chars (one paste). The remaining ~5,000 chars were one-time architecture / bootstrap dialogue.

For Case 2 onward, the auto-trigger pipeline (Move 1 of `_logs/automation_suggestions.md`, now wired into WORKFLOW.md) reduces this to ~500 chars / 1–2 messages per case. The bootstrap dialogue is a one-time cost.

## Phase-by-phase patterns that produced signal

- **10 parallel viewpoints in Round A** — surfaced the founder-identity bifurcation that 7 of 10 lenses independently flagged. Single-agent analysis would have buried this.
- **C-narrowed-B pattern** — Round C (red-team) demoted Round B's "high confidence" wedge to a 4-link conjunctive bet (~24% joint probability). This was the first inflection.
- **F second-pass red team** — caught factual error (Apothékary "1700+ Whole Foods + Ulta" was arithmetically impossible — Whole Foods has only ~570 US stores) and threshold under-calibration (1.5% conversion was indie-wellness median, not above-median). Without F, v2 would have shipped with both errors.
- **10-viewpoint critique batch (the latest round)** — found the structural OTC-drug-classification error that none of the prior rounds caught. The Logistics + Asia-startup viewpoints converged on this independently.

## Patterns that added noise

- Round A's Data analyst lens overlapped substantially with the CFO's quantitative concerns; could have been merged.
- The Futurist's GLP-1 / polyvagal-decay forecast was thoughtful but did not action-force any Phase 0 decision.
- Round A's Customer (target persona) viewpoint and the later Consumer critique covered similar ground; the Consumer critique was sharper because it had the deliverable to attack rather than the abstract case.

## Pattern improvements for next cases

1. **Run the critique-batch round (10 viewpoints attacking the deliverable) instead of just Round A** — the Round-A "build the analysis" pattern produces more redundancy than the "attack the deliverable" pattern. Consider running fewer Round-A viewpoints and more critique-attack viewpoints.
2. **Pre-canned industry config** — for "consumer brand launch" (the thai-inhaler shape), the right viewpoint set is: CMO + Customer + Competitor + Domain + Skeptic + Risk + CFO + Futurist (drop Data + PR for indie-CPG cases). Codify in `prompts/configs/consumer-brand-launch.md` for Case 2+.
3. **Earlier classification-check** — the OTC-drug-vs-cosmetic error would have been caught at Phase 1 (Scope) if a "regulatory classification quick-check" was a mandatory step. Add to Phase 1.
4. **Factual auto-verify** — every numerical claim about a real company (Apothékary's footprint, etc.) should be web-verified by an automated fact-check agent before it lands in the deliverable. Add as a Phase 4 reviewer pattern.

## Total elapsed wall-clock

~75 minutes of active processing across 35 sub-agents. Well under one Claude Max 5-hour window. Project budget remaining: ~3.5 windows of 4 = ~14 hours per case across remaining 4 cases (vs. original ~20-hour-per-case target).

## What's done

- v4 deliverable + 4 sub-docs (2 revised, 2 new) reflect all critical findings
- LinkedIn v4 reflects accurate compute footprint
- Case study v3 (this file) reflects accurate numbers + missing rounds
- INDEX points to v4

## What's NOT done (deliberately deferred)

- 7 of the 10 critique agents flagged additional issues (e.g. Marketing's "creative angle" gap, Brand-design's "no name yet") that v4 acknowledges but doesn't fully resolve — those are FOUNDER-execution work, not analysis work. The deliverable points the founder at the right next steps.
- Path B (OTC drug compliance) cost model was estimated; a real OTC-monograph counsel intake is the founder's first $500 spend.
