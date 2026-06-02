# Terminal Migration Command

Audit this repository and determine whether Kitty should become the primary terminal emulator.

Do not immediately generate configuration files.

Follow the phases below.

---

## Phase 1: Repository Audit

Inspect the repository and identify:

### Terminal Configuration

* Kitty
* Ghostty
* Alacritty
* WezTerm
* iTerm
* Windows Terminal

### Shell Configuration

* zsh
* bash
* fish

### tmux Configuration

Identify:

* navigation bindings
* plugins
* themes
* clipboard integration
* terminal overrides

### Neovim Configuration

Identify:

* image-related plugins
* terminal integrations
* Catppuccin integrations
* tmux integrations

### Fonts

Identify:

* Nerd Fonts
* terminal font configuration

### Themes

Identify:

* Catppuccin
* Tokyonight
* Gruvbox
* other themes

### GNU Stow

Identify:

* current package layout
* existing stow conventions

### Bootstrap Scripts

Identify:

* install scripts
* setup scripts
* provisioning scripts

---

Produce a report with:

* Keep
* Modify
* Replace
* Remove

for every relevant component.

Do not modify files.

Wait for approval before proceeding.

---

## Phase 2: Architecture Review

Analyze:

* duplicated configuration
* technical debt
* portability issues
* obsolete settings
* maintainability concerns

Produce:

### Current State

### Target State

### Migration Plan

Wait for approval before proceeding.

---

## Phase 3: Kitty Design

Design a Kitty setup with:

### Theme

Catppuccin Mocha

### Font

JetBrains Mono Nerd Font

### Goals

* tmux-first workflow
* Neovim integration
* image support
* shell integration
* clipboard integration
* Linux-first
* portable to WSL
* portable to macOS

### User Experience

Prioritize:

* active pane visibility
* pane navigation
* focus tracking

over unnecessary visual effects.

Evaluate:

* Kitty cursor trail
* tmux border highlighting
* pane indicators
* status-line enhancements

Explain trade-offs.

Wait for approval before implementation.

---

## Phase 4: Implementation

Generate:

* Kitty configuration
* modular configuration structure
* Catppuccin integration
* tmux updates
* shell updates
* image support configuration

Follow current Kitty best practices.

Avoid deprecated settings.

---

## Phase 5: GNU Stow Integration

Ensure all configuration is compatible with GNU Stow.

Provide:

### Directory Structure

### Stow Commands

stow kitty

stow tmux

stow nvim

stow zsh

### Unstow Commands

### Restow Commands

### Validation Steps

---

## Phase 6: Installation Guide

Provide step-by-step instructions for:

### Linux

* install Kitty
* install fonts
* stow configuration
* verify setup

### WSL

* recommended setup
* limitations
* verification

### macOS

* install Kitty
* stow configuration
* verification

---

## Phase 7: Default Terminal Configuration

Provide instructions for making Kitty the default terminal emulator on:

* GNOME
* KDE Plasma
* XFCE
* Wayland
* X11

Include file-manager integration where applicable.

---

## Phase 8: Validation

Provide a final checklist verifying:

* Kitty launches correctly
* Catppuccin Mocha is applied
* tmux integration works
* image rendering works
* clipboard integration works
* shell integration works
* GNU Stow works
* Neovim integration works
* default terminal configuration works

---

Important:

Never skip directly to implementation.

Always perform:

Audit → Review → Design → Approval → Implementation.

