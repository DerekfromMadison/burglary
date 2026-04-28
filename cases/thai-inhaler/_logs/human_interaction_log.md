# Human Interaction Log — Case 1: thai-inhaler

## Summary

Across the entire bootstrap-plus-case-1 session (project init through Phase 3 Round E plus dispatch of meta agents), the user typed **9 distinct messages** totaling **~5,400 characters**. Of those, only **430 characters** carried the actual case content (the LinkedIn paste in message 7). The remaining ~92% of typed input was either project-architecture design dialogue (~5,000 chars) or one-word triggers ("Analyze", `/init`).

Phone-friendliness verdict: **fully phone-compatible**. Eight of nine messages would type comfortably on a phone keyboard; the only borderline case is message 2 (~2,400 chars), which is more naturally voice-dictated. No message required any laptop-only affordance — no long code blocks, no precise indentation, no path tab-completion. The user could have driven this entire session from a phone with voice-to-text and a single text field.

---

## Turn-by-turn log

### Pre-case (project bootstrap, messages 1–6)

**Message 1 — `/init`** (~5 chars, slash command)
- Intent: bootstrap the repo into a working Codeman project.
- Action: analyzed empty repo, wrote CLAUDE.md with honest "empty scaffold" status section.
- Files: `CLAUDE.md`.
- Phone-typability: trivial (5 chars).

**Message 2 — project goal description** (~2,400 chars)
- Intent: define the entire 5-case experiment — phone-only input, ~20h Claude Max per case (4× 5h windows), deep multi-round analysis, deliverable + case study + LinkedIn post per case, all sourced from LinkedIn DMs.
- Action: built the scaffold — `WORKFLOW.md` (6-phase pipeline), `prompts/viewpoints.md` (20 analytical lenses), `cases/INDEX.md`, `cases/usage_log.md`. Updated `CLAUDE.md`.
- Files: `WORKFLOW.md`, `prompts/viewpoints.md`, `cases/INDEX.md`, `cases/usage_log.md`, `CLAUDE.md`.
- Phone-typability: borderline for typing, comfortable for voice dictation. The single longest message in the session.

**Message 3 — Codex headless-mode advice paste** (~1,400 chars)
- Intent: forward Codex's advice on `claude -p` headless mode, permission flags, max-turns, asking what could be implemented.
- Action: built `scripts/run_case.sh` headless launcher + 3 phase prompts (`analyze.md`, `deliverable.md`, `wrap.md`). Updated `.claude/settings.local.json` with Bash allowlist + `defaultMode: acceptEdits`. Discovered `--max-turns` does not exist in `claude --version 2.1.119` (Codex was wrong) and substituted `--effort max`.
- Files: `scripts/run_case.sh`, `scripts/prompts/analyze.md`, `scripts/prompts/deliverable.md`, `scripts/prompts/wrap.md`, `.claude/settings.local.json`.
- Phone-typability: comfortable as a paste-forward (the user did not type the Codex content).

**Message 4 — runtime question** (~250 chars)
- Intent: "how will I ensure that this runs for hours and that you do as much processing as humanly possible? What settings can I add?"
- Action: clarified runtime = depth × seriality, not a flag. Added `--hours N` watchdog flag to `run_case.sh`, appended "Iteration mode" sections to all 3 phase prompts, documented optional `nohup` detach pattern.
- Files: `scripts/run_case.sh`, `scripts/prompts/analyze.md`, `scripts/prompts/deliverable.md`, `scripts/prompts/wrap.md`.
- Phone-typability: easy.

**Message 5 — shell-script skepticism** (~120 chars)
- Intent: "It does not make sense to me that I would run some sort of shell script. Does the shell script have some sort of Ralph loop?"
- Action: confirmed `--hours N` IS a Ralph loop by another name. Pivoted the default flow to in-session sub-agent fan-out via the `Agent` tool. Updated `WORKFLOW.md` trigger table to make in-session the primary path and the script the optional fallback.
- Files: `WORKFLOW.md`.
- Phone-typability: easy.

**Message 6 — Codeman Ralph request** (~150 chars)
- Intent: "Are you able to set up the Ralph loop for me? I'm using the application called codeman."
- Action: explained Codeman has Ralph built in as the `/ralph-loop:ralph-loop` slash command, but slash commands are user input and I cannot type them on the user's behalf. Provided a copy-paste-ready Ralph invocation. Recommended in-session `analyze` as the simpler path.
- Files: none (chat-only response).
- Phone-typability: easy.

### Case 1: thai-inhaler (messages 7–9)

**Message 7 — case content paste** (~430 chars)
- Intent: "I want to launch an aromatherapy brand in the USA built around Thai herbal inhalers. Can you create a deep market research document on aromatherapy & wellness trends focused on the American market? I'm most interested in marketing approaches to try that will differentiate the product from other aromatherapy, and break through the noise of similar herbal wellness products."
- Action: ran Phases 0–2 — wrote `00_intake.md` (timestamp + raw paste + tags), `01_scope.md` (problem statement + 6 inferred non-blocking assumptions flagged), `02_plan.md` (10 viewpoints selected with justifications + 5 likely Round D topics + methodology risks).
- Files: `cases/thai-inhaler/00_intake.md`, `01_scope.md`, `02_plan.md`.
- Phone-typability: comfortable. This is the single irreducible bulk-content input — close to the floor for what the case needs.

**Message 8 — `Analyze`** (~7 chars)
- Intent: trigger Phase 3.
- Action: spawned Round A in parallel (10 viewpoint sub-agents, ~712k tokens, ~10 min wall, max parallel). Wrote `B_synthesis.md` (1,301 words, main thread, ~3 min). Spawned Round C (red-team) + Round D (5 deep dives) in parallel (~704k tokens, ~15 min wall). Wrote `E_final.md` (2,035 words, main thread, ~5 min). Total: 16 sub-agents, ~1.42M sub-agent tokens, 33 min wall, 17 files in `03_analysis/`, 47,588 words.
- Files: `cases/thai-inhaler/03_analysis/A_*.md` (10 files), `B_synthesis.md`, `C_red_team.md`, `D_*.md` (5 files), `E_final.md`.
- Phone-typability: trivial. The shortest meaningful message in the session.

**Message 9 — directive batch** (~860 chars)
- Intent: "answer all questions yourself" — explicit permission to commit to inferred assumptions without check-ins. Spin up agents for: depth processing, steelman + reviewer chain, Phase 4 deliverable + wrap draft + reviewer chain, credits audit, human-interaction-summary + automation-suggestions.
- Action: committed all open assumptions to `_logs/decisions.md`. Wrote `_logs/agent_runs.md` (per-agent compute stats). Dispatched 5 parallel agents (depth/F, steelman, P4+wrap, credits, meta — this agent is one of them). Reviewer chains queued for the next batch.
- Files: `cases/thai-inhaler/_logs/decisions.md`, `_logs/agent_runs.md`, plus all artifacts written by the 5 dispatched agents.
- Phone-typability: comfortable — borderline for thumb-typing, easy for voice.

---

## Aggregate metrics

| Metric | Value |
|---|---|
| Distinct user messages | 9 |
| Total characters typed (approx.) | ~5,400 |
| Bulk content (the case itself, msg 7) | 430 chars (~8%) |
| Trigger-only ("Analyze", `/init`) | 12 chars (~0.2%) |
| Architecture / process-design dialogue (msgs 2–6) | ~5,000 chars (~92%) |
| Case-execution dialogue (msgs 7–9) | ~1,300 chars |
| Longest message | ~2,400 chars (msg 2, project goal) |
| Shortest meaningful message | 7 chars ("Analyze") |
| Bulk-content vs. trigger-only ratio | 36 : 1 (430 / 12) |
| Bulk-content vs. architecture-dialogue ratio | ~1 : 12 |

The dominant load was **architecture dialogue** (~92% of characters), not case content. This is the first-time-only setup cost — once the pipeline is built, future cases should approach the 430-char floor (case content) plus a couple of triggers.

### Phone-typability per message

| # | Approx. chars | Phone verdict |
|---|---|---|
| 1 | 5 | Trivial |
| 2 | 2,400 | Borderline typing, comfortable voice |
| 3 | 1,400 | Comfortable (paste-forward) |
| 4 | 250 | Easy |
| 5 | 120 | Easy |
| 6 | 150 | Easy |
| 7 | 430 | Comfortable |
| 8 | 7 | Trivial |
| 9 | 860 | Easy with voice |

---

## Phone-friendliness verdict

**The experience was fully phone-compatible.** Every message could plausibly have been voice-dictated; none required laptop-only affordances such as code blocks with precise indentation, file-path tab completion, or careful Markdown formatting. The pipeline was deliberately designed around natural-language trigger phrases ("analyze", "more depth", "deliverable", "wrap") rather than commands with flags.

**What would have broken phone-friendliness, but didn't:**
- If trigger phrases had used flag-style syntax (`--phase=3 --depth=max`), thumb typos would compound. They don't — the triggers are single English words.
- If the user had been required to run `bash scripts/run_case.sh ...` directly, phone shells would have been hostile. Message 5 caught this and pivoted the default to in-session sub-agent fan-out.
- If Phase 0 had asked clarifying questions before running, each round-trip would multiply phone typing. The pipeline instead infers + flags + continues, surfacing assumptions in `01_scope.md` and (post-msg-9) `_logs/decisions.md` rather than as questions.

**The single rough edge:** message 2 (~2,400 chars of project setup) was tedious for a phone. But that was a one-time scaffold cost, not a per-case cost. Per-case input from this point forward should be roughly: 430 chars (case paste) + 7 chars ("Analyze") + maybe 10 chars ("wrap") = ~450 chars per case, all easily phone-typable.

The future state should drive even that to zero — see `automation_suggestions.md`. The 430-char case paste is essentially irreducible; everything else can be automated away.
