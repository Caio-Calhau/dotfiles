# My Dotfiles

A personal project to backup and document my configurations (dotfiles) for tmux, nvim, zsh, kitty, and Claude Code. This repository serves as both a backup of my settings across machines and a learning history of my configuration journey.

## Table of Contents

- [About](#about)
- [Tools](#tools)
- [Prerequisites](#prerequisites)
- [Stow Management](#stow-management)
- [Installation](#installation)
- [Usage](#usage)
- [Contact](#contact)

## About

This dotfiles project manages configurations for my development environment using GNU Stow. Each tool has its own folder that mirrors the target directory structure, making it easy to symlink everything into place.

- **tmux:** Terminal multiplexer with catppuccin theme, vim-style bindings, smart-splits, and session persistence.
- **nvim:** Full Neovim setup built on lazy.nvim with LSP, Treesitter, Telescope, Harpoon, and more.
- **zsh:** Oh My Zsh with autosuggestions, syntax highlighting, NVM, direnv, and Kitty shell integration.
- **kitty:** GPU-accelerated terminal with catppuccin-mocha theme, JetBrainsMono Nerd Font, and OSC 52 clipboard.
- **claude:** Claude Code configuration including a custom `CLAUDE.md`, slash commands, subagents, and skills.

## Tools

| Folder  | Target path(s)                  | Description                          |
|---------|---------------------------------|--------------------------------------|
| `tmux`  | `~/.tmux.conf`                  | tmux config with TPM plugins         |
| `nvim`  | `~/.config/nvim/`               | Neovim config via lazy.nvim          |
| `zsh`   | `~/.zshrc`                      | Zsh config with Oh My Zsh            |
| `kitty` | `~/.config/kitty/`              | Kitty terminal config + theme        |
| `claude`| `~/.claude/`                    | Claude Code agents, commands, skills |

## Prerequisites

Install these before running the stow commands.

### macOS (Homebrew)

```bash
# Core tools
brew install stow tmux neovim

# Kitty terminal (download from https://sw.kovidgoyal.net/kitty/ or via brew)
brew install --cask kitty

# Font used by Kitty
brew install --cask font-jetbrains-mono-nerd-font
```

### Oh My Zsh (for zsh config)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then install the required plugins:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### TPM — Tmux Plugin Manager (for tmux config)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Linux (Ubuntu/Debian)

```bash
sudo apt-get install stow tmux neovim
```

> Kitty and the Nerd Font must be installed manually on Linux. See [Kitty docs](https://sw.kovidgoyal.net/kitty/binary/) and [Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases).

## Stow Management

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks. Each folder replicates the directory structure relative to `$HOME`, so Stow can create the correct symlinks automatically.

```
dotfiles/
├── tmux/
│   └── .tmux.conf               → ~/.tmux.conf
├── nvim/
│   └── .config/nvim/            → ~/.config/nvim/
├── zsh/
│   └── .zshrc                   → ~/.zshrc
├── kitty/
│   └── .config/kitty/           → ~/.config/kitty/
└── claude/
    └── .claude/                 → ~/.claude/
```

## Installation

Run all commands from the root of this repository.

```bash
# Clone the repo
git clone https://github.com/caio/dotfiles ~/dotfiles
cd ~/dotfiles

# Symlink each config
stow tmux
stow nvim
stow zsh
stow kitty
stow claude
```

To remove a config (unlink):

```bash
stow -D tmux
```

To restow (useful after adding new files):

```bash
stow -R tmux
```

## Usage

### tmux

Start tmux normally — it will load `~/.tmux.conf` automatically.

Install plugins on first run:

```
prefix + I    # Install all TPM plugins
prefix + r    # Reload config
```

Key bindings at a glance:

| Binding         | Action                        |
|-----------------|-------------------------------|
| `C-s`           | Prefix key                    |
| `prefix + [`    | Split pane horizontally       |
| `prefix + h/j/k/l` | Navigate panes             |
| `M-h/j/k/l`     | Resize panes (smart-splits)   |
| `prefix + v`    | Enter copy mode               |
| `prefix + z`    | Zoom pane                     |
| `prefix + r`    | Reload config                 |

### nvim

Launch `nvim`. On first open, lazy.nvim bootstraps itself and installs all plugins automatically.

Mason (`:Mason`) manages LSP servers, linters, and formatters. Run `:Lazy` to view or update plugins.

### zsh

After stowing, reload your shell:

```bash
source ~/.zshrc
```

Useful aliases included:

| Alias       | Command           |
|-------------|-------------------|
| `vim`       | `nvim`            |
| `ll`        | `ls -lah`         |
| `gs`        | `git status`      |
| `gc`        | `git commit`      |
| `gp`        | `git push`        |

### kitty

Open Kitty after stowing — it reads `~/.config/kitty/kitty.conf` on launch. The catppuccin-mocha theme is bundled in `themes/` and included automatically.

### claude

Stowing the `claude` folder places custom configuration under `~/.claude/`:

- **CLAUDE.md** — global coding and behavior guidelines for Claude Code.
- **agents/** — specialized subagents (architect, bug-fixer, pr-review, etc.).
- **commands/** — custom slash commands (`/create-pr`, `/create-resume`, `/execute-task`, `/quick-task`).
- **skills/** — reusable skill definitions for workflows and templates.

## Contribution

This repository is personal and primarily serves as a backup and learning history. If you have suggestions, feel free to open an issue.

## Contact

- Email: caiocalhaum@gmail.com
