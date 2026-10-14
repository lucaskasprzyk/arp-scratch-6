# Evals

Evals protect behaviour of the AI features that unit tests cannot pin down. Every case comes from a
real failure; the repository supplies the scorer and the threshold. `setup` seeded the format and the
check, no case.

## Cases

One file per case, `evals/cases/<id>.json`:

```json
{
  "source": "https://github.com/<owner>/<repo>/issues/<N>",
  "input": "what the feature receives",
  "expected": "what a correct answer holds"
}
```

- `source` — the real failure the case comes from: an issue, a PR or an incident link. A case without
  a source is a guess; do not add it.
- `input` and `expected` — in the shape your scorer reads.

## Scorer

`evals/score` is an executable the repository supplies. It runs every case under `evals/cases/` and
prints one score in [0, 1] on standard output, and nothing else. A non-zero exit or a non-numeric
output fails the check.

## Threshold

`evals/threshold` holds one number in [0, 1]. The score must be equal to or above it.

## The check

`sh evals/check.sh` runs in the `Evals threshold` step of the `verify` job in `.github/workflows/ci.yml`:

- no case file — warns and passes, so the configuration PR is not red on an input only a human can
  supply;
- cases present but `evals/threshold` or an executable `evals/score` missing — fails, naming what is
  missing;
- score below the threshold — fails, printing score and threshold;
- score equal to or above the threshold — passes.
