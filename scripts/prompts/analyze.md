You are executing Phase 3 (multi-round analysis) on case **{{SLUG}}** for the burglary project.

## Context

Read first:
- `WORKFLOW.md` (sections "Phase 3" and onward)
- `cases/{{SLUG}}/00_intake.md`
- `cases/{{SLUG}}/01_scope.md`
- `cases/{{SLUG}}/02_plan.md`
- `prompts/viewpoints.md`

## Execute Phase 3 fully

- **Round A** — spawn 5–8 parallel viewpoint sub-agents per `02_plan.md`. Each writes `cases/{{SLUG}}/03_analysis/A_<viewpoint>.md`.
- **Round B** — main-thread synthesis. Write `B_synthesis.md`.
- **Round C** — 1 red-team sub-agent. Write `C_red_team.md`.
- **Round D** — 2–5 deep-dive sub-agents in parallel on the top unresolved questions. Each writes `D_<topic>.md`.
- **Round E** — final synthesis. Write `E_final.md`.

## Time floor: 4 hours minimum

Record start time once with `date +%s` and store in `cases/{{SLUG}}/_logs/start_ts`. Track elapsed.

If less than 4 hours after Round E, extend depth:
- Additional Round D dives on second-tier questions
- Round F: a second adversarial pass on `E_final.md`
- Verification sub-agents on every high-stakes numerical claim
- Add an industry / geography / historical-analogue lens not yet applied

Continue until ≥ 4h wall time, then stop.

## Logging

After every sub-agent batch, append one row to `cases/usage_log.md`:
```
| {{SLUG}} | <round> | <agent_count> | <wall_min> | <one-line note> |
```

## Rules

- Edit existing files; never create parallel copies.
- Cite sources for any external/web claims.
- Do not ask preference questions — best inference, flag, continue.
- No destructive ops: no `rm -rf`, no `git push`, no `git reset --hard`.
- Spawn sub-agents in parallel when independent (single message, multiple Agent calls).
- End with a 10-line summary: files written, sub-agents spawned by round, total wall time, top finding from `E_final.md`, what remains for Phase 4.

## Iteration mode (when re-invoked by outer watchdog loop)

You may be re-invoked multiple times by `scripts/run_case.sh ... --hours N`. Each iteration MUST add new depth, never duplicate prior work.

On each invocation:

1. List files: `ls cases/{{SLUG}}/03_analysis/` and read every existing one.
2. Read the most recent `cases/{{SLUG}}/_logs/*_done.summary.md` if any.
3. Decide the next layer of depth from this priority list (do the highest-priority not-yet-done item):
   - Round A < 10 viewpoint files? → spawn the missing ones in parallel.
   - `B_synthesis.md` missing or older than newest `A_*.md`? → write `B_synthesis_v2.md`.
   - `C_red_team.md` missing? → spawn it.
   - Round D < 8 dives? → spawn 2–3 more on under-explored unresolved questions, parallel.
   - `E_final.md` missing or older than newest `D_*.md`? → write `E_final_v2.md`.
   - Round F (second adversarial pass on `E_final.md`) not done? → spawn `F_red_team_v2.md`.
   - Round G (each viewpoint critiques `E_final.md` from their lens) not done? → spawn 5–10 in parallel as `G_<viewpoint>_critique.md`.
   - Round H (verification agent for every numerical claim) not done? → spawn one per claim as `H_verify_<claim>.md`.
   - All above done? → spawn fresh angles: alternative scenarios, counterfactuals, second-order effects, longer time horizons, additional viewpoints from `prompts/viewpoints.md` not yet used. Save as `Z_<topic>.md`.

4. Do that next-most-valuable piece of work, write outputs, append to `cases/usage_log.md`, then exit.

Never delete or overwrite prior artifacts; always create new versioned files. Do not output a "fully analyzed; nothing more" stop signal — the outer watchdog decides when to stop based on elapsed time.
