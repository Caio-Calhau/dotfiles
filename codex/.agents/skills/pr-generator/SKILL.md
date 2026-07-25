---
name: pr-generator
description: Validate completed work, generate a high-quality pull request description, and optionally create the PR. Use whenever the user asks to create, open, generate, or prepare a pull request.
---

# Prepare a pull request

Act as a pre-review quality gate. Never invent implementation details, acceptance criteria, or testing evidence.

## Intake

Before analysis, collect:

1. PR language.
2. Base branch; never assume it.
3. Optional task URL or pasted task description.
4. Optional developer notes or business context.
5. Reviewers.

Group questions when that is more efficient, but do not analyze until the base branch is known.

## Analyze the repository

Run read-only commands:

```bash
git status
git diff <base-branch>...HEAD
git log --oneline <base-branch>..HEAD
```

Treat the implementation as the source of truth. Classify the change as frontend, backend, full stack, database, infrastructure, CI/CD, library/SDK, firmware, or mixed.

Check sources in this order:

1. `.changeset/`
2. `CHANGELOG.md`, especially `## [Unreleased]`
3. Task information, developer notes, and Git diff

Flag discrepancies between the implementation and changeset or changelog before continuing.

If task information exists, compare the requirements and acceptance criteria with the implementation. Stop and ask about anything incomplete or ambiguous.

## Validate testing

Testing evidence is mandatory. Determine:

- Which unit, integration, E2E, API, firmware, smoke, or manual tests ran.
- Their results.
- Known limitations.

If evidence is absent, ask for it. Continue only after evidence is supplied or the user explicitly waives testing; record a waiver in the PR.

Apply relevant conditional checks:

- Frontend: request screenshots and user-flow validation, but do not block on screenshots.
- Backend/API: identify affected endpoints, compatibility, consumers, and validation.
- Database: ask whether migrations and rollback were validated and whether production data is affected.
- Infrastructure: document deployment, rollback, and operational risks.
- Feature flags: document rollout, enablement, and cleanup.
- Libraries/SDKs: document breaking changes, migration guidance, and versioning.

Always identify regression areas, downstream dependencies, shared components, and integration risks.

## Generate the PR

Use the selected language throughout. The title must follow:

```text
<type>: <short description>
```

Allowed types: `feat`, `fix`, `refactor`, `chore`, `perf`, `test`, `docs`, `build`.

Render only sections with content:

```markdown
## PR Title
<type>: <short description>

## Task
ID: <task id>
Platform: <platform>
Link: <url>
<task description>

## Context

## Objective

## Changes Made

### Added

### Modified

### Fixed

### Removed

## Impact Analysis (Risk Areas)

## How to Test (Cross-Testing & QA Guide)

### 1.
**Expected Result:**

## Acceptance Criteria (Definition of Done)
- <criterion covered by the implementation>

## Quality Checklist (Cross-Testing)
- [ ] Code passed basic local tests.
- [ ] Testing steps are clear enough for another developer.
- [ ] Impact analysis identifies likely regressions.

## Reviewers
<reviewers>
Cross-Testing Reviewer:
```

Omit `Task` when there is no task, empty change categories, acceptance criteria when none were provided, and the quality checklist when testing was explicitly waived.

Display the complete title and description for review. Obtain explicit confirmation before running:

```bash
gh pr create --title "<title>" --body "<description>" --base <base-branch>
```

If GitHub CLI is unavailable or unauthenticated, return copyable Markdown and explain that the user must create the PR manually.
