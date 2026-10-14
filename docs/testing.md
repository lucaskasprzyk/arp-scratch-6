# Testing strategy

## Protected risks

<What must never break — the risks the tests exist to catch.>

## Layers

| Layer | What it covers | Command |
|---|---|---|
| unit | <…> | <…> |
| integration | <…> | <…> |
| e2e | <…, or "none"> | <…> |

## Seams

<Where the system is cut for testing: the interfaces faked or stubbed, and why there.>

## Deliberately not tested

<What is left untested on purpose, and the reason.>

## QA

A human does manual QA by default. An agent QA lane exists only where this repository opts in.
