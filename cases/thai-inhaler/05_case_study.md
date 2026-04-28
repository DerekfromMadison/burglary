# Case Study — thai-inhaler

Internal record of how this case was processed. Compiled from `_logs/raw_interactions.md`, `_logs/agent_runs.md`, `cases/usage_log.md`. Numbers are from the actual logs.

---

## 1. User input log summary

The founder-facing case (case 1, thai-inhaler) was preceded by six pre-case messages that bootstrapped the project itself (workflow design, headless-mode questions, Ralph-loop discussion). For the case proper, total user input was minimal.

| Metric | Value |
|---|---|
| Total distinct user messages (project + case) | 9 |
| Approximate total characters typed by user | ~5,400 |
| Bulk content (the case itself, message 7) | 430 characters |
| Trigger-only message (message 8, "Analyze") | 7 characters |
| Architecture / process-design dialogue (messages 1–6) | ~5,000 characters |
| Longest single message | ~2,400 characters (project-architecture description, message 2) |
| Shortest meaningful message | 7 characters ("Analyze") |
| Final directive (message 9, agent fan-out) | ~860 characters |

**Bulk content vs. trigger-only ratio.** For the actual case, the ratio was 430 to 7 — bulk content dominated by 61×. The case was framed once, then a single trigger word kicked off the 33-minute analysis pipeline.

**Phone-friendliness verdict.** Every message could plausibly be voice-dictated. The longest message (~2,400 characters) is borderline for phone typing but reasonable for voice-to-text. The 7-character "Analyze" trigger is the right unit of friction for a phone-only workflow — once the pipeline is set up, the founder can launch a 33-minute analysis with one word. This is the right user-experience target for a phone-only operator with a stolen laptop.

---

## 2. Plan provenance

How `02_plan.md` was derived from `01_scope.md`:

**Scope identified six knowledge domains** (from `01_scope.md`):

- US wellness / aromatherapy market structure & competitive set
- Niche brand differentiation theory + consumer psychology
- Cultural authenticity in CPG (the "borrowed cultural product" pattern)
- FDA labeling rules for inhalable / aromatic / herbal products
- DTC + retail distribution economics for indie wellness brands
- Creator economy / TikTok / Instagram dynamics for sensory consumer products

**Ten-viewpoint selection logic.** The 20-viewpoint library in `prompts/viewpoints.md` was filtered against these knowledge domains. The 10 selected (CMO, customer, competitor, PR, domain, risk, skeptic, CFO, futurist, data) were chosen because each maps cleanly to at least one knowledge domain, and because the conjunction covers the success-criteria checklist (market map, differentiation hypothesis, GTM plan, regulatory red-line, failure modes).

Specifically:

- **CMO + customer + competitor** → market structure and differentiation hypothesis.
- **PR + domain** → cultural authenticity and the credible-carrier pattern.
- **Risk** → FDA labeling and supply-chain risk.
- **CFO** → distribution economics.
- **Futurist** → creator-economy dynamics + secular trend bets.
- **Skeptic + data** → failure-mode honesty + cheapest-test design.

Viewpoints excluded: legal-counsel (covered by risk + a planned Round-D dive), behavioral-econ (overlap with customer + CMO), retail-buyer (covered by competitor + CFO), brand-architecture (covered by CMO), supply-chain (covered by risk + CFO). The 10-of-20 selection rate is the right cardinality for this question — fewer would have missed the cultural-authenticity dimension; more would have produced redundant convergence rather than orthogonal lenses.

**Five likely Round-D topics identified at planning time** (from `02_plan.md`):

1. FDA labeling deep dive
2. Credible-carrier cultural-authenticity playbook
3. Channel break-even economics + first-$50k allocation
4. Differentiation map across the category
5. Creator-economy fit

All five were executed. The match between planning-time predictions and execution-time reality was 5/5 — no Round D topic was added or dropped. This is unusual; the planning rigor at Phase 2 paid off in not having to re-plan during Phase 3.

---

## 3. Compute footprint

From `_logs/agent_runs.md`:

| Round | Sub-agents | Tokens | Tool uses | Output words | Wall-clock (parallel max) |
|---|---|---|---|---|---|
| A (10 viewpoints, parallel) | 10 | 712,303 | 287 | 28,651 | ~10 min |
| B (synthesis, main thread) | 0 | not separately tracked | — | 1,301 | ~3 min |
| C (red team) | 1 | 72,291 | 10 | 2,720 | ~5 min |
| D (5 deep dives, parallel) | 5 | 631,554 | 295 | 12,881 | ~15 min |
| E (final synthesis, main thread) | 0 | not separately tracked | — | 2,035 | ~5 min |
| **Phase 3 total** | **16** | **1,416,148** | **592** | **47,588** | **~33 min** |

**Per-agent token range.** Round A: 40,966 (data) to 91,661 (CMO). Round D: 98,765 (credible_carrier) to 169,828 (diff_map). The variance correlates with research breadth — diff_map plotted 30 brands across 4 axes; credible_carrier worked from a smaller curated set of comparable brands.

**Per-agent tool-use range.** Round A: 11 (data) to 47 (CMO). Round D: 40 (credible_carrier) to 77 (diff_map). Tool uses are dominated by web fetches; the Round-D agents that needed live brand pricing and PDP language ran higher tool-use counts.

**Words written.** 47,588 across 17 files in `03_analysis/`. Average ~2,800 words per agent file. This is the right density for a synthesis input — long enough to carry argument, short enough that an LLM-driven Round B can read all 10 in a single context window.

---

## 4. Time

Wall-clock per phase:

| Phase | Wall-clock |
|---|---|
| Phase 0 (intake) | <2 min (single Read + Write) |
| Phase 1 (scope) | <5 min |
| Phase 2 (planning) | <5 min |
| Phase 3 Round A | ~10 min (parallel max of 10 agents) |
| Phase 3 Round B | ~3 min (main-thread synthesis) |
| Phase 3 Round C+D | ~15 min (1 + 5 agents in parallel) |
| Phase 3 Round E | ~5 min (main-thread synthesis) |
| **Phase 3 subtotal** | **~33 min** |
| Phases 4–6 (deliverable + case study + LinkedIn) | TBD on this run |

**Total elapsed Phase 0 through Phase 3:** approximately 45 minutes wall-clock. The 5-hour Claude Max window was 15% consumed at end-of-Phase-3.

**Fraction of a 5-hour window used:** ~0.15 for Phase 3, projected ~0.25 for the full Phase 0–6 pipeline. The case used roughly one-quarter of one window. The original project budget assumed ~20 hours per case across four windows; actual consumption is on track for a single window per case, suggesting either (a) the project plan over-budgeted, or (b) deeper iteration would be possible within budget.

The parallel architecture is doing the heavy lifting on wall-clock. Sequential execution of the same 16 sub-agents would have taken approximately 90–120 minutes (sum of individual durations). Running them in parallel batches compressed that to 33 minutes — roughly a 3× speedup. The parallelism ceiling is set by Anthropic's rate limits and by the dependency graph (Round B must wait for Round A; Round D can run alongside Round C; Round E waits for Round D).

---

## 5. What worked

### 5.1 The 10-viewpoint parallel fan-out

Running 10 viewpoint agents in parallel produced orthogonal coverage at the cost of one agent's wall time. The parallel pattern is structurally superior to sequential interrogation: each viewpoint develops its argument without contamination from the others, and the synthesis at Round B sees ten independent reads instead of one model with growing context.

The cardinality matters. With 5 viewpoints, coverage felt thin (the cultural-authenticity dimension would have collapsed into PR + domain). With 15+, the synthesis at Round B starts hitting context-window strain and viewpoint redundancy. 10 is the right number for a multi-domain CPG question.

### 5.2 The C-narrowed-B pattern

Round C (red team) was the highest-leverage agent in the entire pipeline. Round B's synthesis rated four findings at "high confidence" that the red team correctly demoted to "medium" or "design hypothesis." The single most important downstream artifact — the Phase 0 cheap-validation gate — was the red team's invention, not the synthesis's.

The pattern: B builds the case, C tries to break it, the difference is the truth. Without C, the deliverable would have recommended ordering custom inventory at $25–100k against an unvalidated wedge. With C, the deliverable recommends $5k of off-the-shelf inventory + custom packaging as a cheap test before commitment. The gap between those two recommendations is roughly the value of this entire pipeline.

The C-narrowed-B pattern should be standard for any case where the synthesis has ≥3 high-confidence claims and the deliverable triggers material capital commitment.

### 5.3 The Phase-0-cheap-validation reframe

The single most valuable framing decision was leading the deliverable with Phase 0, not with the marketing playbook. The founder asked for "deep market research + marketing approaches"; the honest answer is "validated launch plan with explicit kill-switches and a cheap-validation gate." That is the reframe.

The reframe came out of the red-team review (Round C §5b) — specifically the "private-label reseller of Poy-Sian with custom packaging only" alternative that the synthesis acknowledged but did not escalate. Round E escalated it to the lead recommendation. Phase 4 made it the document spine.

### 5.4 The committed-decisions log

`_logs/decisions.md` captured every "open question" with a committed answer the moment the user issued the "answer all questions yourself" directive. This eliminated re-litigation downstream — the bifurcation table assumes a non-Thai or unsupplied-Thai-American founder, the budget assumes bootstrap, the timeline assumes 6–12 month launch horizon. None of these were re-debated in Phase 4. The discipline of writing the commitments down is what made the rest of the pipeline executable.

---

## 6. What didn't

### 6.1 Some Round-A viewpoint overlap

CMO and competitor produced overlapping content on premium roll-on positioning (both flagged Saje's Peppermint Halo as the dominant comparable). CFO and risk produced overlapping content on FDA classification consequences (both touched on the Vicks monograph path before Round D's FDA dive). The overlap is not waste — it is convergence signal — but it suggests the 10-viewpoint roster could be tightened with role-boundary briefs. A future iteration might separate "competitive positioning" (CMO + competitor) from "category dynamics" (futurist + data) more crisply, with explicit non-overlap instructions.

### 6.2 Round B synthesis was too generous on confidence ratings

Round B rated four findings "high confidence" that should have been "medium" or "design hypothesis." This is a known synthesis-agent failure mode: pulling positive claims forward from each viewpoint produces a stack that looks more confident than its joint probability supports. The remedy was Round C; the cost was that Round B's intermediate document was misleading on its own.

A future iteration should ask the synthesis agent to compute joint probability explicitly when conjoining claims (the "four-link 70% bet = 24% joint" calculation that Round C did manually).

### 6.3 The "Analyze" trigger was a friction point

Looking at `_logs/raw_interactions.md`, the user typed 7 characters between Phase 2 (planning complete) and Phase 3 (analysis kickoff). That gap exists because the workflow currently requires explicit user authorization to spawn 16 sub-agents. The friction is small in this case but it is ceremony — the planning output is what triggers the analysis, the user trigger is essentially a confirmation. A future iteration could auto-trigger Round A on plan-completion, with the user retaining the option to halt.

### 6.4 No Round-D topic was wrong, but two could have been deeper

`D_diff_map` (differentiation map) and `D_creator_fit` (creator-economy fit) both produced excellent content, but each could have run another 1,500 words on a single sub-question — `D_diff_map` on the bundle-format adjacency, `D_creator_fit` on the FTC-enforcement-in-the-affiliate-channel pattern. These got compressed because each agent had a fixed word budget. A future iteration might allow the synthesis agent to commission a "Round D-prime" on the single deepest sub-question after Round D lands, rather than allocating depth at planning time.

---

## 7. Pattern improvements for next case

Concrete deltas for case 2 onward:

1. **Per-industry viewpoint pre-configs.** The 10 viewpoints used here (CMO, customer, competitor, PR, domain, risk, skeptic, CFO, futurist, data) work for consumer-products + cultural-authenticity cases. They will likely shift for, say, B2B SaaS (replace PR + domain with sales + product), industrial (replace creator-economy with regulatory + supply-chain), or services (replace channel-economics with delivery-model). Build a 5–7 case-archetype-to-viewpoint mapping in `prompts/viewpoints.md`.

2. **Auto-trigger eliminating the "Analyze" message.** Modify `WORKFLOW.md` Phase 2 → Phase 3 transition to be implicit: the planning output is the trigger. User retains halt-only option. Saves 7 characters of ceremony per case but more importantly removes a friction point from the phone-only operator workflow.

3. **Earlier founder-identity-bifurcation handling.** In this case, founder identity was inferred at Phase 1 (`01_scope.md`) and committed at the post-Phase-3 decisions log. It should have been the first question at Phase 0 (intake), with the bifurcation tree branching the entire downstream analysis. For case 2, add a "load-bearing variables" section to the intake template — questions whose answers bifurcate the whole strategy. Examples: founder identity, capital tier, geographic scope, competitive posture (incumbent vs. challenger).

4. **Joint-probability discipline at Round B.** Add to the synthesis prompt: "When listing conjunctive findings (X AND Y AND Z), explicitly compute joint probability and rate the joint, not the strongest link." This catches the four-link-70%-bet-equals-24% problem before Round C has to.

5. **Round D-prime budget.** Reserve ~10% of the Round-D word budget for a "depth-on-the-deepest-question" follow-up agent commissioned by the synthesis agent after Round D lands but before Round E. In this case it would have been a deeper FDA enforcement-pattern dive in the affiliate channel, or a second-cut on the bundle-format adjacency.

6. **Compute-cost-per-finding accounting.** This case used 1.42M tokens to produce ~12 high-confidence findings + ~5 medium-confidence findings. That is roughly 100k tokens per finding. Tracking this metric across cases will reveal whether viewpoint count, viewpoint depth, or round count is the throttle — and let us tune the pipeline against actual ROI per token.

7. **Phase 5 case study auto-template.** This document is being written by hand from log files. The agent-runs.md format is structured enough to drive a template. Build a Phase 5 prompt that takes the three log files as input and emits a draft case study automatically, saving the human-written-prose budget for the Phase 4 deliverable where it matters more.

---

*End of case study. The next case (case 2) should start with a load-bearing-variables intake question and the C-narrowed-B pattern by default.*
