# Changelog Generator Skill

## Purpose

Generate and maintain changelog entries from the current branch changes by analyzing the Git diff against a user-provided base branch.

The skill must update the repository's `CHANGELOG.md` following the configured changelog conventions and Keep a Changelog principles.

---

# Workflow

## Step 1 - Collect Input

Prompt the user:

```text
Base branch to compare against?
```

Examples:

```text
origin/dev
origin/main
origin/release/3.28
```

---

## Step 2 - Generate Diff

Execute:

```bash
git diff <base_branch>...HEAD
```

Store the diff in memory.

Do not create temporary files.

---

## Step 3 - Analyze Changes

Analyze the diff and identify:

- New features
- Behavior changes
- Removed functionality
- Bug fixes
- API contract changes
- Payload changes
- Endpoint changes
- Validation changes
- User-visible changes

Ignore:

- Formatting-only changes
- Variable renames
- File moves
- Folder moves
- Internal refactors without impact
- Repository structure changes
- Commit messages
- File paths

---

# Changelog Pattern Detection

## Existing Changelog

If `CHANGELOG.md` exists:

Read the file and detect the pattern from the existing categories.

Frontend pattern:

```md
### Adicionado

### Modificado

### Removido

### Corrigido
```

Backend pattern:

```md
### Added

### Changed

### Deprecated

### Removed

### Fixed
```

Continue using the detected pattern for all generated entries.

---

## Missing Changelog

If `CHANGELOG.md` does not exist:

Create it using the default pattern:

```md
## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed
```

The default pattern must be used only when no changelog exists.

---

# Repository Patterns

## Backend Pattern

Language:

```text
English
```

Categories:

```md
### Added

### Changed

### Deprecated

### Removed

### Fixed
```

Category order:

```text
Added
Changed
Deprecated
Removed
Fixed
```

Focus on:

- API behavior
- Endpoints
- Payloads
- Response codes
- Business rules
- Contracts
- Validations

Avoid:

- Lambda names
- Repository names
- Terraform resources
- Internal implementation details

Example:

```md
### Added

- Added validation to prevent deletion of custom buttons that are still assigned to devices.
```

---

## Frontend Pattern

Language:

```text
Portuguese (pt-BR)
```

Categories:

```md
### Adicionado

### Modificado

### Removido

### Corrigido
```

Category order:

```text
Adicionado
Modificado
Removido
Corrigido
```

Focus on:

- User-visible behavior
- Screens
- Flows
- Device behavior
- Synchronization
- Validation
- UX changes

Avoid:

- Hook names
- Component internals
- Providers
- Stores
- MQTT/AppSync implementation details
- Internal architecture

Example:

```md
### Corrigido

- Corrigida a atualização das configurações de cenários de acordo com o tipo do dispositivo.
```

---

## Default Pattern

Language:

```text
English
```

Categories:

```md
### Added

### Changed

### Deprecated

### Removed

### Fixed
```

Category order:

```text
Added
Changed
Deprecated
Removed
Fixed
```

Focus on:

- Functional behavior
- Public-facing changes
- Feature impact

Avoid:

- Implementation details
- Internal architecture

Example:

```md
### Changed

- Updated configuration handling to improve consistency across integrations.
```

---

# CHANGELOG.md Handling

## Locate Changelog

Expected file:

```text
CHANGELOG.md
```

If the file does not exist:

Create it.

---

# CHANGELOG Update Rules

## Rule 1 - Locate Unreleased

Search for:

```md
## [Unreleased]
```

---

## Rule 2 - If Unreleased Does Not Exist

Create the section.

Backend / Default:

```md
## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed
```

Frontend:

```md
## [Unreleased]

### Adicionado

### Modificado

### Removido

### Corrigido
```

This is the only situation where empty categories may be created.

---

## Rule 3 - If Unreleased Exists

Preserve all existing content.

Never overwrite manually written entries.

Merge new entries into the corresponding category.

---

## Rule 4 - Category Creation

If a category already exists:

Append new entries to it.

If a category does not exist:

Create it only if there is at least one new entry to insert.

Never create empty categories.

Example:

Current:

```md
## [Unreleased]

### Added

- Added AppSync support.
```

Generated:

```md
### Fixed

- Fixed device synchronization.
```

Result:

```md
## [Unreleased]

### Added

- Added AppSync support.

### Fixed

- Fixed device synchronization.
```

Do not create:

```md
### Changed

### Deprecated

### Removed
```

unless they contain new entries.

---

## Rule 5 - Preserve Category Order

Backend / Default:

```text
Added
Changed
Deprecated
Removed
Fixed
```

Frontend:

```text
Adicionado
Modificado
Removido
Corrigido
```

If a missing category must be created, insert it in the correct position.

---

## Rule 6 - Duplicate Detection

Before inserting a changelog item:

Normalize text by:

- Trimming whitespace
- Collapsing repeated spaces
- Ignoring bullet formatting differences

If an equivalent entry already exists:

Do not insert it again.

---

## Rule 7 - No Relevant Changes

If no changelog-worthy changes are detected:

- Do not modify `CHANGELOG.md`
- Inform the user that no relevant changes were found

Examples of changes to ignore:

- Formatting changes
- Variable renames
- Internal refactors without impact
- Lint fixes
- File moves

---

# Writing Rules

## Keep a Changelog Principles

Always:

- Focus on impact
- Focus on behavior
- Use concise language
- Use past tense
- Describe results, not implementation

Never:

- Copy commit messages
- Mention file names
- Mention folder names
- Mention internal methods
- Mention implementation details
- Mention code structure

---

## Classification Rules

### Backend / Default

New capability:

```text
Added
```

Behavior change:

```text
Changed
```

Deprecation:

```text
Deprecated
```

Removal:

```text
Removed
```

Bug fix:

```text
Fixed
```

---

### Frontend

New capability:

```text
Adicionado
```

Behavior change:

```text
Modificado
```

Removal:

```text
Removido
```

Bug fix:

```text
Corrigido
```

---

# Review Step

Before writing to `CHANGELOG.md`:

Display the generated entries.

Example:

```md
### Added

- Added validation flow for custom button deletion.

### Changed

- Updated button configuration update flow.
```

Prompt:

```text
Apply changes to CHANGELOG.md? [Y/n]
```

Only continue after confirmation.

---

# Update

After approval:

Update `CHANGELOG.md`.

Preserve all existing content.

Only insert the new entries into the proper categories.

---

# Output

After successful update:

Display:

```text
Pattern detected: Backend

Base branch: origin/dev

Entries added: 3

Categories updated:
- Added
- Changed
```

Do not print the entire changelog unless requested.
