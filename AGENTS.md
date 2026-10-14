# <Project name> — agent instructions

<!-- Keep this file under ~150 lines. Inclusion test, per line: would removing it cause an agent error?
     CLAUDE.md is exactly `@AGENTS.md`; host-specific settings live in .claude/ and .codex/. -->

## 1. Purpose

<One paragraph: what this repository is for.>

Vision: [docs/vision.md](docs/vision.md)

## 2. Commands

Exact commands; "full suite = CI".

| Purpose | Command |
|---|---|
| bootstrap | `scripts/setup` |
| verify | <command> |
| test — single | <command> |
| test — full suite | <command> |
| test — e2e | <command, or "none"> |
| lint | <command> |
| typecheck | <command> |
| smoke | <command> — expected: <result> |

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
