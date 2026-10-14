# arp-scratch-6 — agent instructions

<!-- Keep this file under ~150 lines. Inclusion test, per line: would removing it cause an agent error?
     CLAUDE.md is exactly `@AGENTS.md`; host-specific settings live in .claude/ and .codex/. -->

## 1. Purpose

Measurement fixture for agent-repo-prep item qa-conditional: a static app page for the browser MCP
check, the seeded e2e path on seed data, and evals over two real failures with a CI threshold.

Vision: [docs/vision.md](docs/vision.md)

## 2. Commands

Exact commands; "full suite = CI".

| Purpose | Command |
|---|---|
| bootstrap | `scripts/setup` |
| verify | `scripts/setup` |
| test — single | none |
| test — full suite | `sh evals/check.sh` |
| test — e2e | `npm install --no-save --no-package-lock @playwright/test@1.64.0 && npx playwright test --config tests/e2e/playwright.config.mjs` |
| lint | none |
| typecheck | none |
| start the app | `scripts/start` — expected: http://127.0.0.1:8080 serves "arp-scratch-6 fixture app" |

## 3. Structure map

Architecture: [docs/architecture.md](docs/architecture.md)

- `<dir>/` — <what lives there>

Generated and vendored trees (never edit by hand): <paths, or "none">

## 4. Non-obvious conventions + Footguns

- <a rule an agent would get wrong without being told>

## 5. Boundaries

- **Always:** <…>
- **Ask:** <…>
- **Never:** merge your own pull request; <…>

## 6. Tracker and PR workflow

- Tracker: <where work items live>; one work-item shape (What, Done when, spec/context reference,
  Out of scope).
- Pull requests use the repository template; a human merges.

## 7. Router

| Task | Go to |
|---|---|
| verify a change | `.agents/skills/verify/SKILL.md` |
| <task> | <skill or document> |
