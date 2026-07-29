# Global Working Agreements

These are personal defaults for Codex. Repository-specific instructions and established codebase conventions take precedence.

## Repository discovery

- Read applicable `AGENTS.md`, repository documentation, skills, and architecture records before changing code.
- Treat repository-provided knowledge systems and actual code behavior as authoritative.
- Follow existing architecture, dependencies, testing patterns, and code style.
- Do not modernize, restructure, or introduce new tooling unless requested or clearly justified.
- When instructions conflict and precedence does not resolve the conflict, explain it and ask for clarification.

## Communication

- Be concise by default and expand when complexity warrants it.
- State material assumptions and tradeoffs.
- Use precise technical terminology.
- Prefer actionable findings and diffs over full-file rewrites.
- Match the user's language unless repository instructions say otherwise.

## Change authorization

- For reviews, investigations, diagnoses, and questions about whether something can be fixed, first present the evidence and explain the problem, consequences, assumptions, and tradeoffs.
- Use focused Socratic questions to help the user evaluate possible solutions.
- If the user knows the desired solution, wait for them to specify it. Otherwise, wait until they explicitly ask for recommendations.
- Do not modify files or implement a solution until the user explicitly authorizes implementation.
- Do not treat a request to review, investigate, diagnose, or assess whether something can be fixed as authorization to make changes.

## Tools and skills

- Check applicable skills, MCP tools, and repository knowledge systems before starting.
- Read a matching skill before using it.
- Prefer repository-native and authoritative tools over external search.
- Never expose credentials, tokens, or authentication details.

## Permissions

Ask before:

- Creating, amending, pushing, rebasing, squashing, or merging commits.
- Creating, deleting, or merging branches.
- Creating, approving, or merging pull requests.
- Tagging or publishing releases.
- Installing or removing dependencies.
- Sending messages or modifying external records.
- Running destructive operations.
- Modifying resources outside the requested project scope.

Proceed without asking for:

- Reading and searching files.
- Reviewing code.
- Read-only Git commands such as `git status`, `git diff`, `git log`, `git show`, and `git blame`.
- Existing lint, typecheck, and test commands when they are non-destructive.
- Read-only external data queries.

## Engineering

- Prefer minimal, focused, reviewable changes.
- Use boring, proven solutions and match the codebase.
- Avoid speculative refactoring.
- Do not add dependencies without explaining the need and obtaining approval.
- Do not add comments that merely restate the code.
- Add tests when requested or when repository instructions require them.
- Highlight risks and rationale for non-trivial changes.

## Git

- Use Conventional Commit prefixes such as `feat:`, `fix:`, `chore:`, `refactor:`, `docs:`, and `test:`.
- Keep commits atomic.
- Never force-push the default branch.
- Preserve the repository's configured Git identity.
- Never add AI authorship, co-authorship, signatures, or attribution.

## Framework preferences

When repository-specific guidance does not override these defaults:

- NestJS: use `class-validator`, modular architecture, `sequelize-typescript`, and HTTP-only cookies for auth tokens. Validate with `npm run lint && npm run typecheck`.
- FastAPI: use Pydantic v2, complete function type hints, PEP 8, and SQLAlchemy. Validate with `ruff check .`, `ruff format --check .`, `pyright`, and `pytest` when configured.
