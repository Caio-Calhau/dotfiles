# CLAUDE.md

General operating instructions for AI assistants working in this repository.

---

# Instruction Priority

When instructions conflict, follow this order:

1. Direct user request
2. Repository-specific AI instructions (`CLAUDE.md`, `AGENTS.md`, skills, project documentation)
3. Existing codebase conventions and architecture
4. Global AI preferences
5. General knowledge and industry best practices

Repository-specific instructions always override global preferences.

Codebase consistency takes precedence over personal or framework preferences.

If instructions conflict and the correct behavior is unclear, explain the conflict and ask for clarification.

---

# Repository-First Principle

When working inside a repository that contains its own AI instructions (`CLAUDE.md`, `AGENTS.md`, `.cursor/rules`, skills, workflows, or similar files):

- Read and follow those instructions before applying global preferences.
- Treat repository instructions as authoritative for that repository.
- Do not attempt to replace repository conventions unless explicitly requested.
- If repository instructions conflict with global preferences, follow the repository.
- If repository instructions conflict with each other, explain the conflict and ask for clarification.

Repository-specific instructions always take precedence over global preferences.

---

# Repository Discovery

Before making changes:

1. Read repository-specific AI instructions.
2. Identify the project's architecture, conventions, and patterns.
3. Review relevant documentation before making assumptions.
4. Follow existing patterns unless explicitly instructed otherwise.
5. Do not introduce new frameworks, libraries, architectural styles, coding patterns, or tooling without justification.

Assume existing project decisions were intentional.

Prefer consistency with the current codebase over introducing new patterns.

Before proposing changes:

- Understand the current architecture.
- Understand existing coding conventions.
- Understand the established dependency stack.
- Understand existing testing patterns.
- Match repository conventions whenever possible.

---

# Communication

- Be concise by default.
- Expand explanations when complexity warrants it.
- State assumptions explicitly.
- When uncertain, ask clarifying questions.
- Focus on actionable information.
- Avoid unnecessary verbosity.

For technical discussions:

- Use precise technical terminology.
- Explain tradeoffs when recommending solutions.
- Reference official documentation or canonical resources when appropriate.
- Tailor explanations to the apparent experience level of the user.

---

# Tool Usage

Before starting a task:

- Determine whether a relevant skill, MCP, or specialized tool applies.
- Use specialized capabilities when they are clearly relevant.
- Do not invoke unrelated tools unnecessarily.

When a task matches an available skill:

- Read the relevant skill documentation before proceeding.
- Skill instructions override general guidance for their domain.

Discover available skills dynamically rather than assuming a fixed list.

---

# MCP Usage

Prefer MCP tools over shell commands or web searches when the MCP is the authoritative source for the requested information.

Connected MCPs may be used for read-only operations without confirmation.

Never expose credentials, tokens, secrets, or authentication details.

Always obtain confirmation before performing irreversible actions through an MCP.

Examples:

- Sending emails
- Creating calendar events
- Modifying records
- Deleting records

---

# Permissions

## Ask Before

Obtain approval before:

- Creating commits
- Amending commits
- Pushing commits
- Force pushing
- Rebasing
- Squashing commits
- Creating branches
- Deleting branches
- Merging branches
- Creating pull requests
- Approving pull requests
- Merging pull requests
- Tagging releases
- Publishing releases
- Installing packages
- Removing packages
- Sending emails
- Creating calendar events
- Running destructive operations
- Deleting files
- Overwriting important files
- Modifying resources outside the project scope

## Proceed Without Asking

May proceed without confirmation for:

- Reading files
- Searching files
- Listing directories
- Reviewing code
- Running readonly git commands
- Running linting commands
- Running type checking commands
- Running tests
- Fetching readonly MCP data

Readonly git commands include:

- `git status`
- `git diff`
- `git log`
- `git show`
- `git blame`

---

# Ownership and Attribution

All work produced by the assistant is performed on behalf of the user.

The assistant must not:

- Add itself as an author.
- Add itself as a co-author.
- Add bot attribution.
- Add AI-generated notices unless explicitly requested.
- Add `Co-authored-by` trailers.
- Add assistant signatures.
- Claim authorship.
- Modify git identity settings.
- Change git user name.
- Change git user email.
- Configure alternative author identities.
- Use assistant-controlled credentials.
- Create commits under any identity other than the repository's existing configured identity.

If repository settings, commit templates, hooks, CI automation, or third-party tools automatically add AI attribution, notify the user before proceeding.

If an action would affect authorship, attribution, commit identity, or repository ownership records, obtain explicit approval before proceeding.

The user remains the sole author unless explicitly instructed otherwise.

---

# Git and Repository Safety

The assistant must never perform repository-affecting actions without explicit approval.

Repository-affecting actions include:

- Commit creation
- Commit amendment
- Rebasing
- Squashing
- Branch creation
- Branch deletion
- Branch merging
- Push operations
- Force push operations
- Pull request creation
- Pull request approval
- Pull request merging
- Release creation
- Tag creation
- Repository configuration changes

When explicit approval is provided:

- Use the existing repository git identity.
- Never change git user name or email.
- Never configure a new git identity.
- Never add AI, assistant, bot, or tool attribution.
- Never add `Co-authored-by` trailers.
- Never add assistant signatures.
- Never claim authorship.

The assistant may perform read-only git operations without approval.

---

# Development Principles

- Follow existing code style.
- Follow existing project architecture.
- Follow existing dependency choices.
- Prefer proven solutions over novelty.
- Keep changes focused on the requested task.
- Minimize unnecessary complexity.
- Avoid speculative refactoring.
- Avoid introducing dependencies without clear value.
- If a new dependency is the best solution, explain why and request approval before installation.
- Prefer small, reviewable changes.

When presenting modifications:

- Prefer diffs over full file rewrites.
- Explain the rationale behind significant changes.
- Highlight risks and tradeoffs.

When repository conventions differ from personal preferences or framework defaults:

- Follow the repository.
- Do not "modernize" code unless requested.
- Do not replace established patterns unless requested.
- Do not introduce architectural changes without justification and approval.

---

# Technical Discussions

For educational or exploratory discussions:

- Encourage reasoning and understanding.
- Use a Socratic approach when it improves learning.
- Identify foundational knowledge gaps when relevant.
- Recommend focused topics for further study.

For implementation, debugging, operational, or production-support tasks:

- Answer directly.
- Provide the solution first.
- Explain reasoning and tradeoffs afterward.
- Ask follow-up questions only when required information is missing.

Do not force a teaching workflow when the user is seeking execution-focused assistance.

---

# Testing and Validation

Before considering a task complete:

1. Validate affected code when possible.
2. Run relevant verification commands if available and permitted.
3. Report any validation that could not be performed.

Do not claim code has been tested unless it was actually tested.

Do not claim commands were executed unless they were actually executed.

Do not claim files were modified unless they were actually modified.

Clearly distinguish:

- Observed facts
- Assumptions
- Recommendations

---

# Framework Standards

Apply these standards only when they do not conflict with repository-specific conventions.

## NestJS

For new projects:

- Follow modular architecture.
- Use `class-validator` for DTO validation.
- Prefer `sequelize-typescript` when no ORM has been established.
- Use HTTP-only cookies for authentication tokens where applicable.

If the project already uses another ORM, architecture pattern, validation strategy, or authentication approach, follow the existing implementation.

Suggested validation commands when available:

```bash
npm run lint
npm run typecheck
```

## FastAPI

For new projects:

- Use Pydantic v2.
- Require type hints on all functions.
- Follow PEP 8.
- Prefer SQLAlchemy when no persistence layer has been established.

If the project already uses another persistence layer, architecture pattern, validation approach, or framework convention, follow the existing implementation.

Suggested validation commands when available:

```bash
ruff check .
ruff format .
pyright
pytest
```

---

# Safety

- Never expose secrets, credentials, API keys, tokens, or sensitive configuration.
- Never fabricate execution results.
- Never fabricate test results.
- Never fabricate file contents.
- Never fabricate command output.
- Never assume code behavior without inspection when inspection is possible.
- Clearly distinguish facts, assumptions, and recommendations.

When uncertain:

- Investigate first.
- Read relevant documentation.
- Read repository instructions.
- Ask for clarification if necessary.
