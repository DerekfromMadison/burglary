#!/usr/bin/env bash
# Headless autonomous runner for a case phase.
# Usage: scripts/run_case.sh <slug> <phase> [--hours N] [--yolo]
#   phase ∈ analyze | deliverable | wrap
#   --hours N  → re-invoke until N hours elapsed (default: one shot)
#   --yolo     → bypassPermissions instead of auto

set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

usage() {
  echo "usage: $0 <slug> <phase> [--hours N] [--yolo]" >&2
  echo "  phase ∈ analyze | deliverable | wrap" >&2
  exit 1
}

[[ $# -ge 2 ]] || usage
SLUG="$1"; shift
PHASE="$1"; shift

HOURS=0
YOLO=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --hours) HOURS="${2:?--hours requires N}"; shift 2 ;;
    --yolo)  YOLO="--yolo"; shift ;;
    *) usage ;;
  esac
done

CASE_DIR="cases/$SLUG"
[[ -d "$CASE_DIR" ]] || { echo "no such case: $CASE_DIR" >&2; exit 1; }
PROMPT_FILE="scripts/prompts/${PHASE}.md"
[[ -f "$PROMPT_FILE" ]] || { echo "no prompt: $PROMPT_FILE" >&2; exit 1; }

LOG_DIR="$CASE_DIR/_logs"
mkdir -p "$LOG_DIR"

PROMPT="$(sed "s|{{SLUG}}|$SLUG|g" "$PROMPT_FILE")"

PERM_FLAGS=(--permission-mode auto)
MODE_LABEL="auto"
if [[ "$YOLO" == "--yolo" ]]; then
  PERM_FLAGS=(--dangerously-skip-permissions)
  MODE_LABEL="bypass"
fi

invoke_once() {
  local iter="$1"
  local ts; ts="$(date -u +%Y%m%dT%H%M%SZ)"
  local log="$LOG_DIR/${ts}_${PHASE}_iter${iter}.jsonl"
  echo "[$(date -u +%H:%M:%S)] iter=$iter case=$SLUG phase=$PHASE mode=$MODE_LABEL"
  echo "[$(date -u +%H:%M:%S)] log → $log"
  echo "---"
  claude -p \
    "${PERM_FLAGS[@]}" \
    --effort max \
    --output-format stream-json \
    --verbose \
    --include-partial-messages \
    "$PROMPT" \
    | tee "$log"
  echo "---"
}

START_TS=$(date +%s)
ITER=1

if [[ "$HOURS" == "0" ]]; then
  invoke_once "$ITER"
else
  TARGET_S=$(( HOURS * 3600 ))
  echo "[$(date -u +%H:%M:%S)] watchdog: target ${HOURS}h (${TARGET_S}s)"
  while :; do
    invoke_once "$ITER"
    ELAPSED=$(( $(date +%s) - START_TS ))
    echo "[$(date -u +%H:%M:%S)] iter=$ITER done. elapsed=${ELAPSED}s / target=${TARGET_S}s"
    if [[ $ELAPSED -ge $TARGET_S ]]; then
      echo "[$(date -u +%H:%M:%S)] target reached. stopping."
      break
    fi
    ITER=$(( ITER + 1 ))
  done
fi

END_TS=$(date +%s)
ELAPSED_MIN=$(( (END_TS - START_TS) / 60 ))
SUMMARY="$LOG_DIR/$(date -u +%Y%m%dT%H%M%SZ)_${PHASE}_done.summary.md"
cat > "$SUMMARY" <<EOF
# Headless run summary
- case: $SLUG
- phase: $PHASE
- mode: $MODE_LABEL
- iterations: $ITER
- target hours: $HOURS
- elapsed: ${ELAPSED_MIN} min
EOF

echo "[$(date -u +%H:%M:%S)] done. iterations=$ITER elapsed=${ELAPSED_MIN}m"
echo "summary → $SUMMARY"
