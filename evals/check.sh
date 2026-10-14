#!/bin/sh
# Evals threshold check. Run from the repository root: sh evals/check.sh
# Cases come from real failures (evals/cases/<id>.json); the scorer evals/score and the number in
# evals/threshold are supplied by the repository. See evals/README.md.

set -u

if ! ls evals/cases/*.json >/dev/null 2>&1; then
  echo "::warning::evals: no case in evals/cases/*.json - add real failure cases; nothing is checked until then"
  exit 0
fi

missing=""
[ -f evals/threshold ] || missing="$missing evals/threshold"
[ -x evals/score ] || missing="$missing evals/score (executable)"
if [ -n "$missing" ]; then
  echo "::error::evals: cases are present but missing:$missing"
  exit 1
fi

threshold=$(tr -d '[:space:]' < evals/threshold)
if ! score=$(./evals/score); then
  echo "::error::evals: evals/score exited non-zero"
  exit 1
fi
score=$(printf '%s' "$score" | tr -d '[:space:]')

for value in "$score" "$threshold"; do
  case $value in
    '' | *[!0-9.]* | *.*.*)
      echo "::error::evals: not a number: '$value' (score '$score', threshold '$threshold')"
      exit 1
      ;;
  esac
done

if awk -v s="$score" -v t="$threshold" 'BEGIN { exit !(s + 0 < t + 0) }'; then
  echo "::error::evals: score $score is below threshold $threshold"
  exit 1
fi
echo "evals: score $score, threshold $threshold"
