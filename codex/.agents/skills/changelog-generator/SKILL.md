---
name: changelog-generator
description: Generate or update CHANGELOG.md from the current branch diff against a user-provided base branch. Use when the user asks to create, update, or prepare changelog entries from branch changes.
---

# Generate a changelog

## Collect the comparison target

Ask for the base branch when the user has not provided it. Do not assume one.

Run:

```bash
git diff <base-branch>...HEAD
```

Keep the diff in memory; do not create temporary files.

## Identify relevant changes

Include features, behavior changes, removals, bug fixes, API contract or payload changes, endpoint changes, validation changes, and other user-visible effects.

Ignore formatting-only changes, renames, file moves, commit messages, repository restructuring, and internal refactors with no observable impact.

## Follow the repository's pattern

If `CHANGELOG.md` exists, infer its language, headings, and category order and preserve them.

Recognize these common patterns:

- Backend: English headings `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`; focus on APIs, contracts, validation, response codes, and business rules.
- Frontend: pt-BR headings `Adicionado`, `Modificado`, `Removido`, `Corrigido`; focus on screens, flows, synchronization, validation, device behavior, and UX.
- Otherwise: use the backend pattern.

Describe outcomes, not implementation details. Avoid internal names such as hooks, components, providers, stores, repositories, Lambdas, Terraform resources, and transport mechanisms.

## Update `CHANGELOG.md`

Use `## [Unreleased]`.

- If the file or section is missing, create it with all headings from the selected pattern.
- If the section exists, preserve every existing entry.
- Append entries to existing categories.
- Create a missing category only when it receives a new entry.
- Insert categories in the pattern's established order.
- Do not create empty categories in an existing Unreleased section.
- Avoid duplicates after trimming whitespace, collapsing repeated spaces, and ignoring bullet-format differences.

If no changelog-worthy change exists, leave the file untouched and tell the user.

Write concise, past-tense bullet points that explain functional impact. Do not mention file paths or internal architecture.
