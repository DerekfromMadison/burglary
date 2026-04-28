# Progress review — thai-inhaler

Reviewer: progress-review sub-agent. Date: 2026-04-27.
Inputs: `05_case_study_v2.md`, `06_linkedin_v3.md`, `cases/usage_log.md`, `_logs/credits_audit.md`, `_logs/agent_runs.md`, `_logs/raw_interactions.md`.

---

## 1. Case study review (`05_case_study_v2.md`)

**Overall.** Tight, mostly honest, but the headline buries the most shareable fact and the document lies about its own scope.

### What works
- The "What Worked / What Didn't" symmetry is the right shape. The Didn't section is unusually candid for a self-promotional artifact — explicit admission that "v2 was 5,682 words, written for completeness, not the founder's reading time" is the kind of admission practitioners trust.
- The C-narrowed-B paragraph is the strongest passage: *"The single most important downstream artifact — the Phase 0 cheap-validation gate — was C's invention, not B's. Without C, the deliverable would have recommended ordering custom inventory at $25–100k against an unvalidated wedge. The gap between those two recommendations is roughly the value of the entire pipeline."* That is the actual case-study claim. It belongs higher.
- "Pattern Improvements for Case 2" is structurally good — it tells a reader the pipeline is iterating, not frozen.

### What doesn't work
- **The headline is misallocated.** The current headline is *"23 sub-agents, ~2M tokens, ~75 min wall, ~5,400 → 500 chars typed by founder → one founder-readable deliverable."* That's a stack of facts, not an insight. The most surprising/shareable fact in this document is buried two sections down: **a single $5–15k Amazon test answers the wedge question better than $25–100k of custom inventory.** Or, equally shareable: **the red team (Round C), not the synthesis (Round B), produced the load-bearing recommendation.** Either is the headline; neither is.
- **The 23-sub-agent count is internally inconsistent and probably wrong.** The case study claims "23 sub-agents (Phase 3: 16 incl. red-team C; Phase 3F: 1 second red team; Phase 4 rewrite: 6 sub-doc rewrites in serial)." But `agent_runs.md` and `credits_audit.md` only document 16 sub-agents through Round E, with F and the rewrite logged in `usage_log.md` as 1 sub-agent each (rows F + rewrite + 4-review + F-review). Adding usage_log rows: A 10 + C+D 6 + F 2 + 4 (P4 deliverable) 1 + F-review 1 + 4-review 1 + rewrite 1 + audit 1 + meta 1 = **24 logged**. Or excluding audit/meta: **22**. The "23" number is not falsifiable against any single source and is therefore the wrong number to put in the headline. **Pick a definition, count it, cite the source file.**
- **The "5,400 → 500 chars" claim does not appear in raw_interactions.md.** raw_interactions.md says "approximate total characters typed by user: ~5400" and "trigger-only message: 7 chars." Where does 500 come from? If "Analyze" is 7 chars and that's the only post-setup typing for case 1, the bulk-to-trigger ratio in raw_interactions and usage tracking would be 5400 / 7 = 771×, not 61×. The 61× number in the case study comes from a *different* base (430 chars for the LinkedIn paste) divided by 7. This is a real inconsistency: **the case study is mixing two different ratios depending on which bulk number it uses.** Pick one and define it: "5,400 total / 7 trigger" or "430 case framing / 7 trigger."
- **F + rewrite + this 11-agent critique are not narrated in the document.** The "What Worked" section mentions Round F in passing ("Round F second-pass red team"), but Round F's findings are credited as the basis of v3 corrections without naming the three concrete catches in body text — they're tucked into a single sentence. The rewrite phase has no section at all even though it produced the v3 deliverable that the LinkedIn post is built on. The 11-agent critique round (this review batch — progress, headline-test, gap-finder, etc.) is not mentioned because the document predates it. **Flag: the case study currently understates two of the highest-leverage rounds (F and rewrite) and entirely omits the critique round.**
- **"~2M tokens" is rounded up.** `credits_audit.md` measured precisely 1,416,148 sub-agent tokens through Round E. Even if F + rewrite + critique add ~400–600k more, "~2M" is a 25–40% over-claim depending on what's in flight. Rounding up makes the practitioner reader wince. Cite the audited number plus an estimate range for unaudited rounds.

### Specific edits
1. New headline: replace the current numbers-pile with one of:
   - *"A founder asked for marketing research. The right answer was 'don't do that yet.' The red team, not the synthesis, produced the load-bearing recommendation."*
   - *"23 sub-agents, ~$0 of inventory ordered. The compute saved a $25–100k mistake."*
2. Reconcile the sub-agent count. Add an explicit reconciliation paragraph: "16 in Phase 3 (audited, agent_runs.md). 2 in Round F (parallel, usage_log row F). 1 each in F-review, 4-review, rewrite, audit, meta = 22 work-producing sub-agents through this case study. Excluding audit + meta as instrumentation: 20."
3. Add a "Round F" subsection under What Worked with the three named catches (median-calibrated thresholds, Apothékary store-count error, 60-day equity window vs. Diaspora 7-month). Currently mentioned in one sentence; should be three bullets.
4. Add a "Rewrite phase" subsection: 5,682-word v2 → 983-word v3 + 7 sub-docs is the structural fix; quantify (83% main-deliverable compression, 100% detail preservation in sub-docs).
5. Add an "11-agent critique" or "review round" subsection once this batch lands. Otherwise the case study stops at the rewrite and silently overstates scope.
6. Replace "~2M tokens" with the precise audited figure plus a labeled estimate for newer rounds.
7. Fix or remove the "5,400 → 500 chars" framing. If retained, define what 500 means.

---

## 2. Usage tracking review

### `cases/usage_log.md`
**Coverage gap.** Eleven rows present. Missing or under-specified:
- **Round F-review** is logged as 1 sub-agent / 6 wall-min, but `agent_runs.md` does not have a corresponding F_* entry. The audit was written before F existed and never updated.
- **Rewrite row** says "1 sub-agent / 19 wall-min" with output "v3 exec-summary deliverable + 7 detail subdocs + condensed case study + condensed LinkedIn." Single sub-agent doing 7 sub-docs in 19 minutes is plausibly serial, but the row has no token count. **Add tokens.**
- **No row for the current 11-agent critique batch.** This entire review round (progress-review, headline-test, gap-finder, plus whatever sibling agents are running) is unlogged. Add a single row: `| thai-inhaler | critique | 11 | ~10 | parallel critique fan-out: progress / headline / gap-find / ...` once the batch completes.
- **No row for the original Phase 4 reviewer chain** as a discrete entity. The "4-review" row exists but blurs what was reviewed.

### `_logs/credits_audit.md` vs `_logs/agent_runs.md`
- The audit is **internally consistent with agent_runs.md** through Round E: 16 sub-agents, 1,416,148 tokens, 592 tool uses. Numbers match exactly.
- The audit is **stale** with respect to F, P4, rewrite, and critique. It was written 2026-04-27 ~14:47 CDT and explicitly states "Round F: NOT YET STARTED" and "Phase 4: NOT YET STARTED." The case study and usage_log have moved on; the audit has not. **The audit needs a Section 9: post-audit rounds**, or a v2 audit pass.
- The audit's projection in Section 6 ("~1.1–1.5M sub-agent tokens" remaining) is testable against what actually happened. Run a delta now. From `usage_log.md` post-audit rows (F, 4, F-review, 4-review, rewrite, plus this critique): if we estimate F at ~142k (logged), Phase 4 deliverable at ~113k (logged), F-review/4-review/rewrite each at ~50–100k, and critique at 11 × ~50k = ~550k, the projection is **roughly on track** but the rewrite was done by 1 sub-agent serial whereas the projection assumed parallel fan-out. This is a useful calibration data point to record.

### Schema richness for cross-case comparison
Current schema: `Case | Phase | Sub-agents | Wall-min | Notes`. **Insufficient for the project's stated 5-case comparison goal.** Missing columns that will hurt cross-case analysis:
- `tokens` (sub-agent total) — currently buried in Notes inconsistently.
- `parallel_max_wall` vs `serial_total_wall` — different rounds use different patterns.
- `tool_uses` — Round D was tool-dense, Round A was not; this matters.
- `output_words` — already collected per agent in agent_runs.md but not aggregated to the round in usage_log.
- `headline_finding` — one-line natural language summary of what the round produced.
- `compute_per_finding` — derivable from tokens / findings, useful efficiency metric.

### Recommended additions
1. **Add new rows now** for: rewrite (with tokens), critique (this batch), and any post-rewrite review.
2. **Migrate the schema** to: `Case | Phase | Sub-agents | Tokens | Tool-uses | Wall-parallel-max | Wall-serial | Output-words | Headline-finding`. This is a one-time backfill; agent_runs.md has the source data for everything except headline-finding.
3. **Audit v2** that re-runs against the current filesystem and includes F, P4, rewrite, and critique. Keep the v1 audit as a snapshot.
4. **Add `_logs/case_summary.md`** as a one-row-per-case rollup so cross-case comparison is one file, not five log directories.

---

## 3. LinkedIn post review (`06_linkedin_v3.md`)

**Overall.** Better than v1/v2 by structural inference (it's "v3," post-rewrite). Reads as practitioner, not vendor. But the hook is good-not-great, the numbers are slightly under-precise, and the CTA is undermining the post.

### What works
- **Opening line is the strongest sentence in any artifact reviewed:** *"The founder asked for marketing research. The right answer was 'don't do that yet.'"* This is the case study's headline, correctly placed, in the LinkedIn post, not the case study. Steal it back.
- **The verb-and-object FDA rule** is genuinely quotable: *"Acts on product/scent/ritual = cosmetic-safe. Acts on body/system/emotion = drug claim."* This is a teach-me-something moment. It's the line a fellow practitioner screenshots.
- **Practitioner voice throughout.** No "thrilled to share," no "amazing journey," no emojis. Uses specifics ($5–15k, 1.5%, $14/$24/$36) where vendors would use adjectives. This is correct.

### What doesn't work
- **Hook is a tell, not a hook.** "The founder asked for marketing research. The right answer was 'don't do that yet.'" is the opening of an essay, not a scroll-stopper. A practitioner-grade scroll-stop on LinkedIn is closer to: *"23 AI agents told a founder to spend $5k on Amazon instead of $100k on inventory. The red team, not the strategist, made the call."* The current hook makes the reader curious; the suggested one makes them stop.
- **"~2M tokens, 75 minutes, ~50,000 words"** carries the same over-claim as the case study. 2M is rounded up; 50,000 words is approximately right (the audit shows 47,588 in `03_analysis/`); 75 minutes was *total elapsed including idle*, not active processing — `credits_audit.md` Section 1 states "Active work wall (Phase 3 only, A→E): ~33 min." A practitioner reader will know "75 minutes" sounds wrong if they've ever orchestrated parallel agents and will mentally discount the post.
- **Kill threshold paragraph is the right kind of specific** but front-loads the wrong number. "<1% kills it. Median (1.5%) is conditional. >2.5% earns custom inventory" is good. But the headline-worthy fact in that paragraph is **"the kill threshold isn't 'did it convert' — it's 'did it convert above the indie-wellness median.'"** That insight should be the section's lead, not buried mid-paragraph.
- **CTA undermines the post.** *"Slot 1 of 5. DM me if you have a problem worth ~50,000 words."* "Worth 50k words" is clever but pitches the wrong axis — the post just spent its body convincing the reader the *value was the reframe, not the wordcount*. A consistent CTA: *"Slot 1 of 5. DM me if you're about to spend $25k on a guess."* Pitches the value the body articulates.
- **Tags are weak.** `#ConsumerProducts #FounderStrategy #FDA #CPGStrategy` — three of four are categorical. Add `#AIAgents` or `#MultiAgentResearch` or `#RedTeam` to capture the audience that cares about *how* the analysis was done, not just what it concluded. Current tags only attract CPG founders, not the practitioner audience the post's voice is targeting.
- **Post is slightly long for LinkedIn.** Currently ~220 words. LinkedIn's expand-cutoff on mobile is ~3 lines (~50 words). The first three lines need to carry the entire promise. Currently lines 1–3 are: hook → context restate → "I ran 23 Claude sub-agents..." That third line is the strongest preview-card content; consider re-ordering so the agent-count and the surprising recommendation appear before the expand-fold.

### Specific edits
1. New hook (one of):
   - *"23 AI agents told a founder to spend $5k on Amazon, not $100k on custom inventory. The red team, not the strategist, made the call."*
   - *"A founder asked for market research. 16 sub-agents and a red team said: don't do that yet. Spend $5k testing the wedge."*
2. Replace "~2M tokens, 75 minutes" with precise audited figures: *"1.4M tokens of sub-agent compute, 33 minutes of active processing, 47,588 words of analysis."*
3. Lead the kill-threshold paragraph with the median insight, not the percentages.
4. New CTA: *"Slot 1 of 5. DM me if you're about to spend $25k on a guess."*
5. Add `#AIAgents` and `#RedTeam` tags.
6. Front-load the agent-count + reframe into lines 1–2 so the LinkedIn preview card carries the hook before expand.

---

## 4. Cross-cutting issues

### Story consistency
**The three artifacts are telling overlapping but inconsistent stories.**
- **Numbers drift.** Case study: "~2M tokens, 23 sub-agents, ~75 min." LinkedIn: "~2M tokens, 23 sub-agents, 75 minutes." Audit: "1.42M tokens, 16 sub-agents, 33 min active / 74 min elapsed." The case study and LinkedIn agree with each other but neither agrees with the audit. The audit is the source of truth; the public-facing artifacts are over-claiming compute by 30–40%.
- **Headline finding drifts.** Case study leads with token/sub-agent counts. LinkedIn leads with the reframe. Audit leads with D_diff_map's outsized burn. **Three artifacts, three different "most important fact" choices.** This is the single biggest cross-cutting problem.
- **Scope drifts.** Case study claims to cover Round F + rewrite. LinkedIn doesn't mention them. Audit predates them. None covers the 11-agent critique. **Each artifact has a different cutoff date and none labels it.**

### Single highest-leverage edit
**Pick one headline finding and make it the lead in all three artifacts, with one set of audited numbers.** Recommendation: lead with *"The red team, not the synthesis round, produced the load-bearing recommendation. 16 sub-agents (1.4M tokens, 33 minutes active) saved a $25–100k inventory mistake."*

This single change:
- Reconciles the numbers (audited values, not rounded-up values).
- Defines scope (16 sub-agents is the audited Phase 3 figure; everything past that gets a labeled "plus N additional rounds").
- Picks the most surprising and most shareable insight as the headline (red-team-beats-synthesis is the genuine novelty; agent counts are not).
- Pulls the case study's strongest paragraph (C-narrowed-B) into headline position.
- Pulls the LinkedIn post's strongest line ("the right answer was 'don't do that yet'") into the case study.
- Fixes the audit's stale-number drift by reanchoring the public artifacts to audited figures.

---

## 5-line summary

- **Case study top 3**: headline buries the load-bearing claim (red-team narrowed synthesis); sub-agent count is unreconciled across sources; F + rewrite + critique rounds are under-narrated or absent.
- **Usage tracking top 3**: schema lacks tokens / tool-uses / output-words columns needed for cross-case comparison; audit is stale (predates F, rewrite, critique); current critique batch is unlogged.
- **LinkedIn top 3**: hook is curious-not-stopping; numbers are rounded up vs. the audit; CTA pitches wordcount rather than the dollar-savings the body proves.
- **Single highest-leverage edit**: replace all three artifacts' headlines with one audited, consistent claim — *"The red team, not the synthesis, produced the load-bearing recommendation. 16 sub-agents / 1.4M tokens / 33 min saved a $25–100k mistake."*
- **Bonus rule for case 2 onward**: every public artifact cites the audit file by name + version; the audit is regenerated after every round; numbers in case study and LinkedIn must round-trip to the audit or be flagged "estimate."
