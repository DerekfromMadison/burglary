# Usage Log

Append one row per phase / sub-agent batch. Source for case-study compute accounting.

| Case | Phase | Sub-agents | Wall-min | Notes |
|---|---|---|---|---|
| thai-inhaler | A | 10 | 10 | Round A: 10 viewpoint sub-agents in parallel; ~712k tokens; max wall ~10min (parallel) |
| thai-inhaler | B | 0 | 3 | Round B: main-thread synthesis. 6 convergences, 5 contradictions, 6 gaps, 6 highest-stakes findings, 5 Round-D topics queued |
| thai-inhaler | C+D | 6 | 15 | Round C (red-team) + Round D (5 deep dives) parallel; ~704k tokens; max wall ~15min |
| thai-inhaler | E | 0 | 5 | Round E: main-thread final synthesis. Reframes wedge as hypothesis; phased plan w/ Phase 0 cheap validation; founder-identity bifurcation table; kill-switches |
| thai-inhaler | audit | 1 | 5 | credits audit produced |
| thai-inhaler | meta | 1 | 4 | human_interaction_log + automation_suggestions |
| thai-inhaler | F | 2 | 4 | Round F: red-team v2 + steelman; ~142k tokens parallel ~4min wall |
| thai-inhaler | 4 | 1 | 8 | Phase 4 deliverable v1 (5682 words) + 5 case study draft (2340 words) + 6 LinkedIn draft (315 words); ~113k tokens |
| thai-inhaler | F-review | 1 | 6 | steelman reviewed; v2 produced if needed |
| thai-inhaler | 4-review | 1 | 12 | Phase 4 reviewed; v2 deliverable produced; factual fixes |
| thai-inhaler | rewrite | 1 | 19 | v3 exec-summary deliverable + 7 detail subdocs + condensed case study + condensed LinkedIn |
| thai-inhaler | F-review | 2 | 6 | F_steelman_review + Phase4 reviewer; ~176k tokens; v2 deliverable + LinkedIn produced |
| thai-inhaler | rewrite | 1 | 19 | v3 exec-summary + 7 sub-docs; 5,682→983 words (5.8:1); ~173k tokens |
| thai-inhaler | critique | 11 | 5 | 10 viewpoint critics (consumer/marketing/asia/logistics/security/psych/PMF/brand/ops/investor) + progress reviewer; ~432k tokens parallel |
| thai-inhaler | v4-integration | 0 | 8 | Main-thread integration of 11 critique reports → v4 deliverable + 4 sub-docs (2 revised, 2 new) + LinkedIn v4 + case study v3 |
