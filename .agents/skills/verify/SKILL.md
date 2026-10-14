---
name: verify
description: How to verify a change in this repository end-to-end before calling it done — the commands to run, the evidence bar, and what to do when a check cannot run. Use after implementing a change, before opening a pull request, or when asked "verify this", "is it working?", "sprawdź, czy działa".
---

# verify — prove the change works

## Steps

1. Run the verify command from `AGENTS.md` §2. It must pass.
2. Run the tests for what you changed, then the full suite if the change touches shared code.
3. Run the smoke command from `AGENTS.md` §2 and compare its output with the expected result there.
4. Exercise the changed behaviour the way a user reaches it (a request, a CLI call, a page) and keep the
   output or a recording.

## Evidence bar

- A claim is a command with its output, or a recording of the working path — never "should work".
- Every check you could not run is listed with the reason.
- The evidence goes into the pull request's "How verified" section.

## When a check cannot run

Say so, say why, and name who can run it. Do not replace a missing check with a guess.
