# My Dotfiles

A personal project to backup and document my configurations (dotfiles) for tmux, nvim, zsh, kitty, Codex, and OpenCode. This repository serves as both a backup of my settings across machines and a learning history of my configuration journey.

## Table of Contents

- [About](#about)
- [Tools](#tools)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Stow Management](#stow-management)
- [Usage](#usage)
- [Contact](#contact)

## About

This dotfiles project manages configurations for my development environment using GNU Stow. Each tool has its own folder that mirrors the target directory structure, making it easy to symlink everything into place.

- **tmux:** Terminal multiplexer with catppuccin theme, vim-style bindings, smart-splits, and session persistence.
- **nvim:** Full Neovim setup built on lazy.nvim with LSP, Treesitter, Telescope, Harpoon, and more.
- **zsh:** Oh My Zsh with autosuggestions, syntax highlighting, NVM, direnv, and Kitty shell integration.
- **kitty:** GPU-accelerated terminal with catppuccin-mocha theme, JetBrainsMono Nerd Font, and OSC 52 clipboard.
- **codex:** Codex global instructions, user configuration, and reusable skills.
- **opencode:** OpenCode configuration including `AGENTS.md`, slash commands, subagents, MCP servers, and the superpowers plugin.

## Tools

| Folder  | Target path(s)                  | Description                          |
|---------|---------------------------------|--------------------------------------|
| `tmux`  | `~/.tmux.conf`                  | tmux config with TPM plugins         |
| `nvim`  | `~/.config/nvim/`               | Neovim config via lazy.nvim          |
| `zsh`   | `~/.zshrc`                      | Zsh config with Oh My Zsh            |
| `kitty` | `~/.config/kitty/`              | Kitty terminal config + theme        |
| `codex` | `~/.codex/`, `~/.agents/skills/` | Codex instructions, config, skills |
| `opencode` | `~/.config/opencode/`        | OpenCode agents, commands, MCP, plugins |

## Prerequisites

Before stowing, make sure the following are installed on your system:

| Tool | macOS | WSL / Linux |
|---|---|---|
| [Homebrew](https://brew.sh) | required | — |
| tmux | `brew install tmux` | `apt install tmux` |
| [Neovim >= 0.12.2](https://github.com/neovim/neovim/releases) | download tarball | download tarball |
| GNU Stow | `brew install stow` | `apt install stow` |
| [Kitty](https://sw.kovidgoyal.net/kitty/binary/) | official installer | Windows side only |
| [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) | `~/Library/Fonts/` | Windows side only |
| Oh My Zsh | [installer](https://ohmyzsh.sh) | [installer](https://ohmyzsh.sh) |
| TPM | `git clone` into `~/.tmux/plugins/tpm` | same |
| NVM + Node LTS | `nvm install --lts` | same |
| tree-sitter CLI | `npm install -g tree-sitter-cli` | same |

> Install scripts are coming — they will automate everything above per platform.

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
├── codex/
│   ├── .codex/                  → ~/.codex/
│   └── .agents/skills/          → ~/.agents/skills/
└── opencode/
    └── .config/opencode/        → ~/.config/opencode/
```

## Installation

Clone the repo and stow the packages:

```bash
git clone -b main https://github.com/caiocalhau/dotfiles ~/dotfiles
cd ~/dotfiles
stow tmux nvim zsh kitty opencode
stow --no-folding codex
```

To stow or restow individually:

```bash
# Symlink a config
stow tmux

# Remove a symlink
stow -D tmux

# Restow (useful after adding new files)
stow -R tmux

# Keep Codex runtime state outside the dotfiles repository
stow -R --no-folding codex
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

### codex

Stowing the `codex` folder places stable Codex configuration while leaving runtime state and credentials local:

- **`~/.codex/AGENTS.md`** — global working agreements and coding preferences.
- **`~/.codex/config.toml`** — durable user configuration.
- **`~/.agents/skills/`** — Codex-native changelog, PR, and teaching skills.

### opencode

Stowing the `opencode` folder places custom configuration under `~/.config/opencode/`:

- **AGENTS.md** — global coding and behavior guidelines.
- **agents/** — specialized subagents (architect, bug-fixer, pr-review, etc.).
- **commands/** — custom slash commands (`/create-pr`, `/create-resume`, `/execute-task`, `/quick-task`).
- **opencode.json** — main config: MCP servers (context7, GitHub) and the superpowers plugin.

To link your account, run `/connect` inside OpenCode and follow the browser OAuth flow. Set `GITHUB_PAT` in your environment for the GitHub MCP server.

## Contribution

This repository is personal and primarily serves as a backup and learning history. If you have suggestions, feel free to open an issue.

## Contact

- Email: caiocalhaum@gmail.com
