# Agent runs — thai-inhaler

Per-sub-agent execution stats from Phase 3 (Rounds A–E). Source data for the credits audit. Compiled from the actual agent return summaries.

## Round A (parallel, 10 agents)

| Agent | Tokens | Tool uses | Duration (s) | Output words |
|---|---|---|---|---|
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
| **Round A total** | **712,303** | **287** | **max 599 (parallel)** | **28,651** |

## Round B (main thread, no separate agent)
- File: `B_synthesis.md` (1,301 words)
- Wall time: ~3 min
- Tokens: not separately tracked (subset of main-session usage)

## Round C (1 agent)

| Agent | Tokens | Tool uses | Duration (s) | Output words |
|---|---|---|---|---|
| C_red_team | 72,291 | 10 | 326 | 2,720 |

## Round D (parallel, 5 agents)

| Agent | Tokens | Tool uses | Duration (s) | Output words |
|---|---|---|---|---|
| D_fda_language | 125,947 | 74 | 923 | 2,502 |
| D_credible_carrier | 98,765 | 40 | 474 | 2,755 |
| D_channel_economics | 109,389 | 53 | 769 | 2,630 |
| D_diff_map | 169,828 | 77 | 901 | 2,500 |
| D_creator_fit | 127,625 | 51 | 739 | 2,494 |
| **Round D total** | **631,554** | **295** | **max 923 (parallel)** | **12,881** |

## Round E (main thread)
- File: `E_final.md` (2,035 words)
- Wall time: ~5 min
- Tokens: not separately tracked (subset of main-session usage)

## Phase 3 totals (Rounds A–E)
- Sub-agents spawned: **16** (Round A: 10, Round C: 1, Round D: 5)
- Total sub-agent tokens: **1,416,148**
- Total sub-agent tool uses: **592**
- Wall time per round (parallel max): A ~10 min, C+D ~15 min, B+E ~8 min main-thread
- **Phase 3 total wall time: 33 min** (recorded against `start_ts`)
- Words written across `03_analysis/`: **47,588**
- Words written by sub-agents: ~44,250
- Words written main-thread (B + E): ~3,336

## Notes on accuracy
- Sub-agent token counts and tool uses come directly from the Agent tool's return metadata — these are precise.
- Main-session (this assistant's own) token usage is NOT visible to me from inside the session. It must be estimated separately by the credits audit.
- Wall times are approximate (rounded from reported durations; parallel agents reported individual durations, the round wall time is the slowest agent in the batch).
