# Automation Suggestions — burglary project

Authored after Case 1 (thai-inhaler), based on the 9-message human-interaction log. Goal: identify every human input that could have been automated, propose concrete mechanisms, and rank by leverage.

---

## 1. Irreducible human inputs

The case content itself is essentially the floor. Looking at message 7 of Case 1 (430 chars), it carried four irreducible bits:

1. **What product/business** — "aromatherapy brand built around Thai herbal inhalers."
2. **Geography / market** — "USA."
3. **What kind of analysis** — "deep market research document on aromatherapy & wellness trends."
4. **The discriminating angle the user actually cares about** — "marketing approaches that will differentiate the product and break through the noise."

Compressed maximally, that is ~150–200 chars:
> `aromatherapy brand, Thai herbal inhalers, US market — deep research, focus on differentiating marketing.`

But the longer 430-char form is honestly cheap on a phone (one voice-dictated paragraph) and gives the pipeline more nuance for free. **The practical floor is ~300–500 chars per case** — anything below that begins to lose case-specific signal.

The user must also implicitly:
- **Choose the case** — pick which inbound DM/request is worth the ~20h Claude Max budget.
- **Accept or reject the deliverable** — only a human can authorize the LinkedIn post.
- **Decide pivots** — if the analysis surfaces a contrarian recommendation, the user has to commit to or override it.

Everything else in the 5,400-char total typed input across Case 1 is automatable.

---

## 2. Inputs that should NOT have been necessary

### 2a. Trigger-only messages
- `Analyze` (msg 8, 7 chars) — should fire automatically when `02_plan.md` is written.
- `more depth` — should fire automatically when a quality threshold isn't met (see §3.5 self-correcting depth loop).
- `deliverable` — should fire automatically when `E_final.md` is written.
- `wrap` — should fire automatically when `04_deliverable.md` passes review.

### 2b. Architecture/process design dialogue (msgs 2–6, ~5,000 chars)
This was the bulk of typed input. It's a one-time scaffold cost — once the pipeline is built, no future case should require this dialogue. The fact that it took 5 messages of back-and-forth (defaults → headless mode → runtime question → shell-script skepticism → Codeman Ralph integration) is itself evidence that the defaults were wrong on the first pass. Future projects should ship **opinionated defaults** so the architecture dialogue is zero messages.

### 2c. Permission to commit to inferred assumptions
Message 9 contained the explicit instruction: *"answer all questions yourself."* This was the founder-identity-bifurcation moment — the user gave the system permission to commit to assumptions on the user's behalf. **An automated pipeline should commit by default**, with a `_logs/decisions.md` audit trail surfaced to the user only when an assumption is risky enough to override. The default of "ask the user" is an anti-pattern for phone-only operators.

### 2d. Per-case planning dialogue
Phase 2 (the analysis plan) is currently bespoke per case. For the thai-inhaler case, viewpoint selection ended up at: cmo, customer, competitor, futurist, pr, cfo, data, risk, domain, skeptic. Most of these would be the obvious selection for any **"launch a brand in the US"** case. Pre-canned configs by industry/case-type would eliminate most of the per-case planning dialogue.

---

## 3. Mechanism per category

### 3.1 Auto-trigger pipeline (in-session)

**What**: When the user pastes `new case <slug>: <paste>`, the pipeline auto-runs Phases 0–6 without further triggers. Only one optional human checkpoint: a Phase-0-validation review (the user can interrupt within ~30 seconds if the assumption set is wildly wrong).

**Implementation**:
- Wrap the entire 6-phase flow in a single Codeman `/ralph-loop:ralph-loop` invocation with a clear completion phrase like `<promise>CASE_COMPLETE</promise>`.
- The Ralph prompt contains the full pipeline as a sequence of phases. Each phase's success criterion is "the next file exists on disk."
- Use the time-aware loop pattern from `CLAUDE.md` lines 161–222 — set min duration to ~18h to consume the full budget.
- Hook the assistant's response to a Phase-0-validation pause: print `01_scope.md` + the inferred assumptions, sleep ~30 seconds for an interrupt, then proceed.
- LOC: ~80 (a single ralph_runbook.md that the user pastes once into Codeman).
- Effort: 1–2 hours.

**Eliminates**: `Analyze`, `more depth`, `deliverable`, `wrap`. ~50 chars per case.

### 3.2 Pre-canned configs by industry

**What**: A library at `prompts/configs/<industry>.md` where each file specifies: 5–8 default viewpoints, 3–5 likely Round D topics, deliverable section overrides, methodology risks specific to the industry.

**Initial library**:
- `consumer-brand-launch.md` (covers thai-inhaler — viewpoints: cmo, customer, competitor, cfo, regulator, pr, futurist, skeptic).
- `b2b-saas-gtm.md`.
- `marketplace-twosided.md`.
- `professional-services.md`.
- `creator-economy.md`.
- `health-wellness-regulated.md` (FDA-aware overlay).
- `local-services.md`.

**Selection**: an industry tag is auto-classified from the case paste (see §3.3) or manually tagged in `00_intake.md`.

**Implementation**:
- Phase 2 prompt reads `prompts/configs/<industry>.md` and merges with `prompts/viewpoints.md`.
- LOC: ~30 per config × 7 configs = ~210 LOC of markdown.
- Effort: 3–4 hours, mostly distilling viewpoint patterns from prior cases.

**Eliminates**: per-case planning dialogue. Future cases need ~0 architecture chars.

### 3.3 Auto-classifier for case requests

**What**: A small classifier prompt that takes a raw case paste and outputs structured metadata: industry tag, domain tags, urgency, sensitivity level, recommended config file.

**Implementation**:
- One headless `claude -p --effort low` call against a single classifier prompt.
- Output schema (JSON):
  ```json
  {"industry": "consumer-brand-launch", "domains": ["wellness", "aromatherapy", "fda-supplement"],
   "urgency": "low", "sensitivity": "low", "config": "health-wellness-regulated.md",
   "anonymize_sender": true}
  ```
- Wire as the first step inside Phase 0 — `00_intake.md` records the classification, and the rest of the pipeline reads from it.
- LOC: ~60 (1 prompt file + 1 invocation in `run_case.sh`).
- Effort: 1 hour.

**Eliminates**: ambiguity about which config to apply, manual tag-guessing.

### 3.4 Inbox daemon / scheduler

**What**: A watcher that pulls cases from an inbox source (LinkedIn DMs forwarded → email → IMAP; or Google Form → CSV; or Substack subscriber form → webhook) and kicks off the pipeline via Ralph.

**Implementation options** (in increasing order of leverage):

1. **Email-to-file** (simplest):
   - User forwards a LinkedIn DM screenshot or text to `cases@<their-domain>`.
   - A `procmail` rule or `mbsync` + `notmuch` watcher writes the body to `cases/_inbox/<timestamp>.md`.
   - A `cron` job every 5 min: if `cases/_inbox/` is non-empty, pick the oldest file, generate a slug from a YYYYMMDD-firstword pattern, move to `cases/<slug>/_raw_paste.md`, kick off the pipeline.
   - Uses existing `scripts/run_case.sh`.
   - LOC: ~50 shell + procmail rule.
   - Effort: 2–3 hours.

2. **Google Form → webhook → GitHub Actions**:
   - User shares a public Google Form link in their LinkedIn bio: "submit a case here."
   - Form responses webhook to a GitHub Actions workflow (free tier).
   - Workflow runs `scripts/run_case.sh` against a checked-out repo, commits results, opens a PR.
   - Effort: 4–6 hours.
   - Bonus: every case is a public PR, which becomes its own marketing artifact.

3. **Codeman background-agent watcher**:
   - A Codeman background agent watches `cases/_inbox/` and triggers the appropriate `/ralph-loop:ralph-loop` whenever a new file lands.
   - Effort: depends on Codeman's hook system — see §6.

**Eliminates**: the user manually pasting cases into Claude. The user just forwards an email or fills a form.

### 3.5 Self-correcting depth loop

**What**: Replace the user-typed `more depth` trigger with an automated depth iterator that runs until a quality threshold is met.

**Quality thresholds** (any one is sufficient):
- Red-team agent flags fewer than X concerns on the latest synthesis.
- Convergence: the top recommendation in `E_final_vN.md` matches `E_final_v(N-1).md`.
- Wall-clock time floor reached (the existing `--hours N` mechanism).
- All numerical claims have a verification agent's blessing.

**Implementation**:
- Add a "Round Q" (quality-gate) sub-agent that reads the latest synthesis and outputs a JSON verdict: `{convergent: bool, concerns: int, blockers: []string}`.
- The outer loop in `analyze.md`'s iteration mode reads the JSON. If `convergent && concerns < 3`, exit. Otherwise, run another Round D / F / G iteration.
- LOC: ~40 (1 new prompt file + ~10 lines of glue in `analyze.md`'s iteration mode).
- Effort: 1–2 hours.

**Eliminates**: the user typing `more depth`. The loop self-paces.

### 3.6 Pre-baked decision committal

**What**: The pattern this case piloted — commit to inferred assumptions automatically and log them to `_logs/decisions.md` — should be the default for every new case, not gated by an explicit "answer all questions yourself" instruction.

**Implementation**:
- Update `WORKFLOW.md` Phase 1 ("Open questions for requester") and Phase 2 to state: *"Do not list open questions for the requester. Commit to the most defensible inference, log to `_logs/decisions.md` with a 1-line rationale and a confidence tag, continue."*
- Update `scripts/prompts/analyze.md` to include the line "Decisions are committed automatically; the user authorizes overrides via a single `override <topic>: <new value>` message if needed."
- LOC: ~10 lines of prompt-file edits.
- Effort: 15 minutes.

**Eliminates**: the "Open questions for requester" list and any blocking checkpoint. ~0 user chars per case where the default would have asked.

### 3.7 Reviewer-chain auto-pairing

**What**: Every "build something" agent (Phase 4 deliverable, Phase 6 LinkedIn post, Phase 5 case study) automatically gets a "review what was built" reviewer agent paired sequentially. The user never asks for review — it just happens.

**Implementation**:
- In each phase prompt, add a "Pairing" section: *"After writing `<artifact>`, immediately spawn a reviewer sub-agent against `<artifact>` and apply its corrections to a `<artifact>_v2`."*
- Templated reviewer roles: `04_deliverable.md` → fact-checker + hostile-reader + exec-summary-rewriter. `06_linkedin.md` → voice-checker + hook-strength-checker + alternate-version-writer.
- LOC: ~30 prompt-file edits.
- Effort: 1 hour.

**Eliminates**: the user typing "review the deliverable" or similar.

### 3.8 Auto-publish LinkedIn

**What**: When the LinkedIn post draft (`06_linkedin.md`) passes the reviewer chain, auto-post via the LinkedIn API.

**Implementation**:
- One-time OAuth setup: user authorizes a LinkedIn API token, stored in `.env` (gitignored).
- A `scripts/publish_linkedin.sh` wrapper: `curl` to `https://api.linkedin.com/v2/ugcPosts` with the post body.
- Wire as a final step in `wrap.md` iteration mode after the post passes review.
- Default to **dry-run** mode (writes the would-be payload to `_logs/06_linkedin_payload.json` without posting). Live mode requires a `--publish` flag, which can be set as a permanent env var once trust is built.
- LOC: ~80 (curl wrapper + token-handling + dry-run logic).
- Effort: 2–4 hours, mostly LinkedIn API auth setup and rate-limit handling.

**Caveats**: LinkedIn's API for posting is approval-gated for new apps; getting `w_member_social` scope can take days. A Plan B is to draft the post into a scheduled-post tool (Buffer, Hypefury, Typefully) via their API, which has fewer gates.

**Eliminates**: the user copying the post text from `06_linkedin.md` to LinkedIn manually.

### 3.9 Status pings to user

**What**: Rather than the user typing `status`, the system posts compact status updates at major round completions — a Slack channel, an SMS via Twilio, or a Codeman push notification.

**Implementation**:
- Add a `notify` step to each phase's iteration mode: `curl -X POST <slack-webhook-url>` with a one-line summary.
- Or use Codeman's `PushNotification` primitive (see §6).
- Triggers: Round A complete, Round D complete, E_final written, Phase 4 v1 written, Phase 6 reviewed, case complete.
- LOC: ~20 + 1 webhook URL in env.
- Effort: 30 minutes.

**Eliminates**: any "status" pings from the user.

---

## 4. The 80/20 automation roadmap

The three highest-leverage automation moves to implement next.

### Move 1 — Wrap the whole pipeline in one Ralph loop (§3.1 + §3.6 + §3.7)

- **Scope**: One canonical `prompts/ralph_runbook.md` that contains the full 6-phase flow. Update `WORKFLOW.md` Phase 1 + 2 to commit decisions automatically. Add reviewer-pairing language to all "build something" prompts.
- **Effort**: ~3 hours, ~120 LOC of markdown edits.
- **User-input reduction**: From 9 messages × 5,400 chars (Case 1) to **2 messages × ~500 chars** (Case 2 onward — the case paste, plus optional `override <topic>: <value>` if the inferred scope is wrong). Reduction: **~90% of typed chars eliminated**, **~78% of messages eliminated**.

### Move 2 — Pre-canned industry configs + auto-classifier (§3.2 + §3.3)

- **Scope**: 7 `prompts/configs/<industry>.md` files + 1 classifier prompt + glue in `run_case.sh` and `analyze.md`.
- **Effort**: ~5 hours, ~270 LOC of markdown.
- **User-input reduction**: removes the per-case planning dialogue that doesn't exist yet but would have appeared on Case 2 if the user had a wildly different industry. Net effect: **the system handles 7 industries with zero planning dialogue per case**. Marginal char reduction per case is small (~50 chars), but the variance reduction is large — Case 2 won't surface "should we apply the FDA lens?" as a question.

### Move 3 — Self-correcting depth loop (§3.5)

- **Scope**: 1 quality-gate prompt + ~10 lines of iteration-mode glue.
- **Effort**: ~2 hours, ~50 LOC.
- **User-input reduction**: eliminates the `more depth` trigger and replaces the user's subjective "is this deep enough?" judgment with an objective convergence test. This is the difference between a 4h floor and a "until quality threshold or 18h cap" run — better use of the Claude Max windows.

**Combined: ~10 hours of meta-work to reduce per-case typed input from ~1,300 chars + 3 messages (typical case after bootstrap) to ~500 chars + 1 message.** Ongoing throughput goes from ~1 case per session to ~1 case per inbox-event.

---

## 5. What CANNOT be automated

The irreducible human role:

1. **Selecting which inbound cases get the ~20h budget**. Five cases is a deliberate quality gate. An auto-classifier can rank, but choosing slot 3 of 5 is judgment.

2. **Accepting or rejecting the final deliverable**. The user is the brand owner, the one with the LinkedIn account, the one with the reputational stake. A bad post stays posted. The user's "yes ship it" or "no kill it" is the final gate.

3. **Deciding pivots**. If Phase 3 surfaces a contrarian recommendation ("you said you wanted to launch in the US, but the analysis suggests Thailand"), only a human can override the user's stated goal.

4. **The LinkedIn-credibility / authentic-voice element of the post**. The whole project's credibility-engine is *"a practitioner is doing this, and posting about it on LinkedIn under their own name."* If the post is auto-posted with synthetic phrasing, the credibility evaporates within a few cases. **The user's voice is the moat.** Automation should draft, but the user should still hit publish (or at minimum, read each post once before publish).

5. **Handling escalations / weirdness**. If a case touches something legally sensitive, the auto-pipeline should `BLOCKED` and surface to the user. Codeman's existing `BLOCKED` status block from `CLAUDE.md` lines 397–406 is the right primitive.

---

## 6. Codeman-specific opportunities

Codeman ships several primitives that map directly to this pipeline.

**`/ralph-loop:ralph-loop` slash command**: the natural home for the Move-1 auto-trigger pipeline. The completion phrase contract (`<promise>CASE_COMPLETE</promise>`) maps cleanly to "all 6 phases written, reviewer chain passed, LinkedIn payload generated."

**Codeman hooks** (idle_prompt, stop, task_completed): wire to auto-progress phases.
- `task_completed` on a phase-3 sub-agent → trigger Round B synthesis automatically.
- `idle_prompt` after Round E → fire Phase 4 deliverable automatically (eliminates the `deliverable` trigger).
- `stop` after `06_linkedin.md` is reviewed → trigger the LinkedIn auto-publish.

**Background agents per case dir**: Codeman supports background agents. Assign one per `cases/<slug>/` to watch the dir and auto-fire reviewer agents whenever a new draft lands. Concretely:
- Background agent prompt: *"You are the reviewer for `cases/<slug>/`. Whenever a new `04_*.md`, `05_*.md`, or `06_*.md` file is written, spawn the appropriate reviewer sub-agent and write `<file>_review.md`."*
- Effort: ~1 hour to write the prompt and register it.

**`PushNotification` / `SendMessage` / `CronCreate` primitives** (visible in this session's deferred-tools list):
- `CronCreate`: schedule a daily 10am check of `cases/_inbox/` and auto-kick off any pending case via `RemoteTrigger` (assumes Codeman's cron + remote-trigger combination).
- `PushNotification`: status pings to the user's phone at major round completions (§3.9).
- `SendMessage`: post the LinkedIn draft into a Slack channel for the user to approve before publish.

**`mcp__claude_ai_Gmail__authenticate`**: this MCP is available in the session. Could be used to implement §3.4 inbox daemon — pull case requests directly from Gmail, no procmail required. Workflow: filter Gmail label `cases-inbox` → read body → write to `cases/_inbox/<ts>.md` → fire pipeline.

**`mcp__claude_ai_Google_Drive__authenticate`**: alternative inbox source — drop case requests into a shared Google Drive folder, watcher picks them up.

**`TaskCreate` / `TaskList` / `TaskGet` / `TaskStop`**: useful for parallelization tracking. Each Phase-3 sub-agent could be wrapped as a Codeman task, giving the user a real-time UI of the agent fan-out.

---

## 7. Token / cost-aware automation

Claude Max has 5-hour rate-limit windows. Automation should be designed around them.

**Pacing strategy**:

1. **Kick off the heavy parallel rounds at the start of each window**. Phase 3 Round A spawns ~10 viewpoint sub-agents in one parallel burst — that's ~700k tokens in ~10 min. Schedule this as the first action in a fresh window, so the burn happens when the budget is fresh.

2. **Save the cheap, sequential rounds for the tail of a window**. Phase 5 (case study), Phase 6 (LinkedIn drafting), and any reviewer chains are smaller — they can run in the dregs of a window without blowing the limit.

3. **Use `--effort low` for classification, `--effort max` for analysis**. The auto-classifier (§3.3) and quality-gate (§3.5) are small judgment calls — `--effort low` is fine. Phase 3 sub-agents need `--effort max`.

4. **Cron-schedule the auto-trigger at window boundaries**. If the user's Claude Max windows reset at, say, 9am / 2pm / 7pm / midnight, schedule `cases/_inbox/` checks at 9:01 / 2:01 / 7:01 / 00:01. New cases pick up a fresh budget.

5. **Concurrency cap**. At most one case at a time in the heavy Phase 3 phase. A second case can be in Phase 0–2 (cheap) or Phase 5–6 (cheap) concurrently, but two simultaneous Phase 3 fan-outs will exhaust the window.

6. **Backpressure on the inbox**. If `cases/_inbox/` is non-empty but `cases/<active-slug>/` is mid-Phase 3, the daemon should not fire the next case. It waits for the active case to reach Phase 4 first.

7. **Caching**: prompt-cache the static parts of each phase prompt (`WORKFLOW.md` content, viewpoints catalog, configs) so the cached portion of Phase 3 sub-agent calls is shared across cases. The Anthropic prompt cache has a 5-min TTL; running Round A's 10 sub-agents in a single parallel burst keeps them inside the cache window.

8. **Budget alerts**. When the cumulative `usage_log.md` for the current Claude Max window exceeds 80% of estimated capacity, fire a `PushNotification` to the user. Codeman tracks tokens externally (per `CLAUDE.md` line 35), so this should be wireable.

---

## 5-line summary

- Files written: `/home/diabasis/codeman-cases/burglary/cases/thai-inhaler/_logs/human_interaction_log.md` and `/home/diabasis/codeman-cases/burglary/_logs/automation_suggestions.md`.
- Single most-impactful automation suggestion: **Move 1 — wrap the entire 6-phase pipeline in one `/ralph-loop:ralph-loop` invocation with auto-decision committal and reviewer-pairing baked in.**
- User-input reduction it would deliver: from **~5,400 chars typed across 9 messages** (Case 1, including bootstrap) to **~500 chars typed across 1–2 messages** per case (Case 2 onward).
- That's a **~90% reduction in typed characters per case** and an **~80% reduction in distinct messages**.
- Bootstrapping a second project on the existing scaffold should drop bootstrap-typed-chars from ~5,000 to roughly zero — the architecture is now reusable.
