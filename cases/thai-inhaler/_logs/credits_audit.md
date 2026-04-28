# Credits / compute audit — thai-inhaler

Compiled 2026-04-27, ~14:47 CDT, from `agent_runs.md`, `usage_log.md`, and filesystem inspection of `03_analysis/`.

Phase 3 start (`start_ts` file): `1777314795` → **2026-04-27 13:33:15 CDT**.
Audit-time: **2026-04-27 14:47:36 CDT**.
Wall-clock elapsed since Phase-3 start: **4,461 s ≈ 74.4 min**.
Active work wall (Phase 3 only, A→E): **~33 min** (per usage_log).
Idle / between-phase / pre-audit gap: **~41 min** (Phase 3 finished ~14:06, audit started ~14:45).

---

## 1. Phase-by-phase compute table

All sub-agent token / tool-use / duration figures pulled directly from `agent_runs.md` (Agent-tool return metadata — precise). Word counts re-verified live with `wc -w` on `03_analysis/`.

### Round A — parallel viewpoint fan-out (10 sub-agents, COMPLETE)

| Agent | Tokens | Tool uses | Duration (s) | Output words |
|---|---:|---:|---:|---:|
| A_cmo | 91,661 | 47 | 599 | 2,654 |
| A_customer | 66,257 | 21 | 525 | 2,787 |
| A_competitor | 68,213 | 24 | 412 | 2,852 |
| A_pr | 81,731 | 44 | 594 | 2,999 |
| A_domain | 60,390 | 23 | 276 | 2,978 |
| A_risk | 76,948 | 31 | 446 | 2,976 |
| A_skeptic | 89,101 | 29 | 547 | 2,909 |
| A_cfo | 57,701 | 28 | 386 | 2,999 |
| A_futurist | 79,335 | 29 | 534 | 2,547 |
| A_data | 40,966 | 11 | 181 | 2,950 |
| **Round A** | **712,303** | **287** | **max 599 ≈ 10 min (parallel)** | **28,651** |

Token-sum check: 91,661+66,257+68,213+81,731+60,390+76,948+89,101+57,701+79,335+40,966 = **712,303** ✓.

### Round B — main-thread synthesis (no sub-agent, COMPLETE)

| Item | Value |
|---|---|
| File | `B_synthesis.md` |
| Words | 1,301 |
| Wall time | ~3 min |
| Sub-agents | 0 |
| Sub-agent tokens | 0 (subset of main-session, not separately tracked) |

### Round C — red-team (1 sub-agent, COMPLETE)

| Agent | Tokens | Tool uses | Duration (s) | Output words |
|---|---:|---:|---:|---:|
| C_red_team | 72,291 | 10 | 326 | 2,720 |

### Round D — parallel deep-dives (5 sub-agents, COMPLETE)

| Agent | Tokens | Tool uses | Duration (s) | Output words |
|---|---:|---:|---:|---:|
| D_fda_language | 125,947 | 74 | 923 | 2,502 |
| D_credible_carrier | 98,765 | 40 | 474 | 2,755 |
| D_channel_economics | 109,389 | 53 | 769 | 2,630 |
| D_diff_map | 169,828 | 77 | 901 | 2,500 |
| D_creator_fit | 127,625 | 51 | 739 | 2,494 |
| **Round D** | **631,554** | **295** | **max 923 ≈ 15 min (parallel)** | **12,881** |

Token-sum check: 125,947+98,765+109,389+169,828+127,625 = **631,554** ✓.

### Round E — main-thread final synthesis (no sub-agent, COMPLETE)

| Item | Value |
|---|---|
| File | `E_final.md` |
| Words | 2,035 |
| Wall time | ~5 min |
| Sub-agents | 0 |

### Round F — iterative reviewer passes (NOT YET STARTED)

No `F_*.md` files exist in `03_analysis/`. No agent_runs.md entries for F. **Status: not started.**

Estimated effort if executed similar to Round D: 3–5 reviewer sub-agents, ~100k tokens each, 40–60 tool uses each, 600–900 s parallel wall, 2–3k words each. Estimated F-round total: **~400–500k tokens, ~15 min wall, ~10–15k words.**

### Phase 4 — strategy / business-model expansion (NOT YET STARTED)

No `04_*` directory or files exist. **Status: not started.**

Estimated effort (assuming similar fan-out to A): 6–10 sub-agents, ~70k tokens each. Estimated P4 total: **~500–700k tokens, ~10 min parallel wall, ~20k words.**

### Phase 5/6 — recommendation / decision packet (NOT YET STARTED)

No `05_*` or `06_*` directories exist. **Status: not started.**

Estimated effort: mostly main-thread synthesis with maybe 1–2 sub-agents for verification. Estimated P5/6 total: **~150–250k sub-agent tokens, ~10 min wall, ~5–8k words.**

### Audit (this run, IN PROGRESS as of file-write)

| Item | Value |
|---|---|
| Sub-agents | 1 (this audit agent) |
| Wall time | ~3–5 min (will update on completion) |
| Output | `credits_audit.md` (this file), ~1,500 words |

### Meta — usage_log row appended (THIS TURN, IN PROGRESS)

Appended to `cases/usage_log.md` after this file is written.

---

## 2. Cumulative totals through current state (Phase 3 complete, F/P4/P5/6 not started)

| Metric | Value | Source / method |
|---|---:|---|
| Sub-agents spawned | **16** | A:10 + C:1 + D:5 (audit-self not yet counted as it's in flight) |
| Sub-agent tokens (precise) | **1,416,148** | Sum from `agent_runs.md` |
| Sub-agent tool uses | **592** | A:287 + C:10 + D:295 |
| Words written in `03_analysis/` (verified `wc -w`) | **47,588** | Live filesystem check |
| Words by sub-agents (rounds A,C,D) | **44,252** | A:28,651 + C:2,720 + D:12,881 |
| Words by main-thread (B+E) | **3,336** | B:1,301 + E:2,035 |
| Phase-3 active wall time (logged) | **~33 min** | usage_log: 10+3+15+5 |
| Total wall-clock elapsed since `start_ts` | **74.4 min** | now − start_ts; ~41 min is post-Phase-3 gap before audit |

---

## 3. Main-thread (this assistant's own) usage estimate

Main-thread tokens are **NOT visible** to me from inside the session. Estimate range justified below.

**Inputs to the estimate:**
- Claude Code system prompt + tool definitions baseline: ~10–25k tokens (CLAUDE.md global + project + tool schemas).
- Each main-thread turn that spawns a sub-agent: the agent's full return summary (~1–3k words ≈ 2–5k tokens) gets injected back into main context.
- Main-thread ran B and E synthesis (drafted ~3,336 words of `.md` and read all 16 sub-agent outputs ≈ 44k words to do so).
- Estimated main-thread turns so far: **~15–25** (intake → scope → plan → 10×spawn-A → B-synthesis → spawn-C → 5×spawn-D → E-synthesis → audit-spawn).

**Turn-cost model:**
- Spawn-and-receive turn: ~5–15k tokens (small request out, full agent summary back into context).
- Synthesis turn (B, E): ~30–60k tokens (reads multiple full sub-agent .md outputs as context).
- Setup turns (intake, scope, plan): ~5–15k each.

**Estimated range: 250k–550k main-thread tokens through audit-spawn.**

Point estimate: **~400k tokens** (16 spawn-receive turns × ~10k = 160k, plus 2 heavy synthesis turns × ~50k = 100k, plus ~10 light/setup turns × ~10k = 100k, plus baseline context-rebuild ≈ 40k). State this as **~250k–550k with ~400k as midpoint.**

This is within the originally requested 200k–600k bracket and is consistent with a session that has done substantial agent orchestration but not heavy main-thread reasoning.

---

## 4. Claude Max windows consumed

Claude Max rate-limit windows are **wall-clock anchored** (5h windows from first message). Window consumption ≈ wall-clock-active hours, not token count.

| Metric | Value |
|---|---|
| Phase-3 active wall (A+B+C+D+E) | ~33 min |
| Total elapsed since `start_ts` | ~74 min ≈ **1.24 h** |
| Approximate fraction of one 5h window consumed | **~25%** of one window |
| Windows consumed | **~0.25 windows** of the 4-window (20h) per-case budget |

Project goal: 4× 5h windows = 20h per case → this case has used ~6.2% of its per-case wall-time budget so far.

---

## 5. Per-round token / wall efficiency

Computed as **sum of agent tokens / max parallel wall-min** for each round (i.e. inference density across the round, accounting for parallelism).

| Round | Tokens | Wall-min (parallel max) | Tokens / min | Tool uses / min | Character |
|---|---:|---:|---:|---:|---|
| A (10 viewpoint fan-out) | 712,303 | ~10 (599 s) | **~71.4 k tok/min** | 28.7 | **Token-dense.** Parallel viewpoint inference, modest tool use per agent. |
| C (red team, 1 agent) | 72,291 | ~5.4 (326 s) | ~13.3 k tok/min | 1.8 | Token-dense, low tool use; pure adversarial reasoning. |
| D (deep-dives, 5 agents) | 631,554 | ~15.4 (923 s) | ~41.0 k tok/min | 19.2 | **Tool-use dense.** D_fda_language (74 tools / 923s) and D_diff_map (77 tools / 901s) are web-research-heavy. |

**Observations:**
- **Round A is the highest token-density round** (~71k tok/min) — the parallel viewpoint fan-out efficiently saturates inference because 10 agents run simultaneously and each fits in ~10 min wall.
- **Round D is the most tool-intensive** at ~19 tool-uses/min round-wide, driven by `D_fda_language` and `D_diff_map` doing extensive web research (and consequently using more tokens — D_diff_map at 169,828 is the single most expensive sub-agent in the case).
- **Per-agent peak**: D_diff_map @ 169,828 tokens / 901 s ≈ 188 tok/s — sustained web-research turn.
- **Per-agent floor**: A_data @ 40,966 tokens / 181 s — finished fastest, used fewest tools (11), efficient.

---

## 6. Comparison to project goal

Project target: **5 cases × ~20 h Claude Max each = 100 h total.**

| Item | Value |
|---|---|
| thai-inhaler wall consumed so far | ~1.24 h |
| thai-inhaler Phase 3 active wall | ~0.55 h |
| thai-inhaler % of its 20 h budget | ~6.2% |
| Cases completed | 0 / 5 |
| Total project hours used | ~1.24 / 100 h = **~1.2%** |

**Projection to phase-6 completion for thai-inhaler:**

| Remaining work | Est. wall | Est. sub-agent tokens |
|---|---:|---:|
| Round F (reviewer iterations) | 15–30 min | 400–500 k |
| Phase 4 (business-model fan-out) | 15–30 min | 500–700 k |
| Phase 5/6 (decision packet) | 15–25 min | 150–250 k |
| Buffer / handoff / audit | 5–10 min | ~50 k |
| **Total remaining estimate** | **50–95 min** | **~1.1–1.5 M sub-agent tokens** |

**Projected thai-inhaler totals at full completion:** ~2–3 h wall, ~2.5–3 M sub-agent tokens, ~70–90 k words. Well under the 20 h budget; the per-case allocation appears generous by ~6–10×, suggesting the binding constraint for this project is **research depth / coverage**, not compute time.

If the 5-case pattern holds, total project will use **~10–15 h Claude Max wall** vs the 100 h budget — leaving plenty of room for re-runs, reviewer passes, or additional cases.

---

## 7. Notes on accuracy

| Metric | Source | Confidence |
|---|---|---|
| Sub-agent tokens | Agent-tool return metadata | **Measured (precise)** |
| Sub-agent tool uses | Agent-tool return metadata | **Measured (precise)** |
| Sub-agent durations | Agent-tool return metadata | **Measured (precise)** |
| Sub-agent output words | `wc -w` on .md files | **Measured (precise)** |
| Round wall times | usage_log.md | **Measured / logged**, rounded to nearest min |
| Phase-3 start time | `_logs/start_ts` | **Measured** |
| Main-thread tokens | Internal estimate | **Estimated**, ±2× uncertainty |
| Main-thread turn count | Inferred from artifact pattern | **Estimated**, ±50% |
| Claude Max window % | Wall-clock anchored | **Inferred**: assumes window starts at `start_ts`. Could also start earlier if main-thread session pre-existed. |
| F/P4/P5/6 estimates | Pattern-extrapolation from A/C/D | **Estimated**, no measurement yet |

**Known limitations:**
- Main-thread token usage is the largest unknown — likely 250–550k, but I have no instrument inside the session to read it. The CLI external counter would resolve this if exposed.
- Round B / Round E words are written by main-thread but I cannot attribute their token cost separately from spawn-overhead turns; they're folded into the main-thread estimate.
- Window-consumption assumes a single uninterrupted Max session. If there were idle hours before `start_ts` that already consumed window-time, the window % is under-stated.

---

## 8. Recommendation for ongoing logging

**Currently captured:** sub-agent metadata (great — keep doing this), round-level wall time, file artifacts, decisions, raw_interactions.

**Currently missing — recommend starting:**

1. **Main-thread token counter per turn.** The Claude Code CLI knows this; surface it into a `_logs/main_thread.md` table with one row per turn (timestamp, action, est. tokens). Even self-reported per-turn order-of-magnitude (10k / 30k / 60k) is far better than a single end-of-session estimate.

2. **Per-agent prompt size.** Currently we log return tokens but not request-prompt tokens. The Agent-tool input is reconstructable from the spawning message — log it alongside output for full per-agent IO accounting.

3. **Tool-use breakdown by type per agent.** `agent_runs.md` shows total tool count but not whether they were WebFetch vs Read vs Bash. The high-tool agents (D_fda_language, D_diff_map) likely concentrated in WebFetch; confirming this would help right-size future research budgets.

4. **Window-anchor timestamp.** Record the actual Claude Max window-start (first message of the rate-limit window), separate from `start_ts` (which is Phase-3 start). They may differ by hours.

5. **Cost in USD or credits.** If the user has a credit-rate (e.g. $X / M tokens for Opus), have the audit agent multiply through and produce a dollar figure per phase. Easy to add once a rate is settled.

6. **Words/token efficiency per agent.** `output_words / tokens` is a cheap proxy for "verbose-research vs. concise-conclusion". A_data was ~72 words/k-token (high signal density) vs. D_diff_map ~15 words/k-token (research-heavy, low artifact density). Track this to spot agents that should be re-prompted for terser output.

7. **In-flight markers.** Write a marker file `_logs/in_flight/<round>_<agent>` when an agent is spawned, delete on return. Lets the audit distinguish "agent completed" from "agent never ran" definitively without filesystem heuristics.

---

## 5-line summary

- **File**: `/home/diabasis/codeman-cases/burglary/cases/thai-inhaler/_logs/credits_audit.md`
- **Total sub-agent tokens to date**: **1,416,148** (16 sub-agents, A+C+D)
- **Total wall time**: **~33 min Phase-3 active, ~74 min since start_ts** (≈ 0.25 of one 5h window, ~6.2% of per-case budget)
- **Current case completion**: **~30–40%** (Phase 3 done; F + P4 + P5/6 remain)
- **Most surprising fact**: **D_diff_map alone burned 169,828 tokens (12% of all sub-agent compute)** doing 77 tool calls in 15 min — a single research-heavy sub-agent costs as much as the 4 cheapest Round-A viewpoint agents combined (A_data + A_cfo + A_domain + A_customer = 225,314 tokens). Web-research deep-dives are the project's compute pareto-tail; budget for that explicitly in F/P4 planning.
