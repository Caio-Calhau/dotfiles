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

Install these before running the stow commands. Each platform has a setup script that automates all steps below — see [Installation](#installation).

### macOS

> Requires Homebrew for tmux. Install it at https://brew.sh if not present.

**tmux:**

```bash
brew install tmux
```

**Neovim >= 0.12.2** — Apple Silicon:

```bash
curl -LO https://github.com/neovim/neovim/releases/download/v0.12.2/nvim-macos-arm64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-macos-arm64.tar.gz
sudo mv /opt/nvim-macos-arm64 /opt/nvim
sudo xattr -r -d com.apple.quarantine /opt/nvim
rm nvim-macos-arm64.tar.gz
```

> For Intel Macs replace `arm64` with `x86_64` in the filename and folder name.

**GNU Stow 2.4.1** — build from source (Perl is pre-installed on macOS, no brew needed):

```bash
curl -L https://ftp.gnu.org/gnu/stow/stow-2.4.1.tar.gz | tar xz
cd stow-2.4.1 && ./configure --prefix=/usr/local && make && sudo make install
cd .. && rm -rf stow-2.4.1
```

**Kitty terminal** — official installer:

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

**JetBrainsMono Nerd Font:**

```bash
mkdir -p /tmp/jbmono
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.tar.xz \
  | tar xJ -C /tmp/jbmono
cp /tmp/jbmono/*.ttf ~/Library/Fonts/
rm -rf /tmp/jbmono
```

### Oh My Zsh (both platforms)

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

### TPM — Tmux Plugin Manager (both platforms)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Linux / WSL (Ubuntu/Debian)

**tmux:**

```bash
sudo apt-get install tmux
```

**Neovim >= 0.12.2:**

```bash
sudo apt-get remove neovim 2>/dev/null || true
curl -LO https://github.com/neovim/neovim/releases/download/v0.12.2/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
rm nvim-linux-x86_64.tar.gz
```

**GNU Stow 2.4.1** — build from source:

```bash
sudo apt-get install make perl
curl -L https://ftp.gnu.org/gnu/stow/stow-2.4.1.tar.gz | tar xz
cd stow-2.4.1 && ./configure --prefix=/usr/local && make && sudo make install
cd .. && rm -rf stow-2.4.1
```

> Kitty and the Nerd Font are not needed inside WSL — install them on the Windows side. See [Kitty docs](https://sw.kovidgoyal.net/kitty/binary/) and [Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases).

#### LSP runtime prerequisites

Mason installs LSP servers automatically, but some servers require runtimes to be present in PATH first.

**Ruby** (required for `ruby-lsp`):

```bash
# Build dependencies
sudo apt-get install -y git curl libssl-dev libreadline-dev zlib1g-dev \
  autoconf bison patch build-essential libclang-dev libffi-dev libyaml-dev

# Install rbenv + ruby-build
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Reload shell so rbenv is in PATH, then install Ruby
source ~/.zshrc
rbenv install 3.3.0
rbenv global 3.3.0
```

After installation, open Neovim and run `:MasonInstall ruby-lsp` (or let Mason do it automatically on next startup).

**Node.js** (required for most JS/TS LSPs — install via nvm which is already configured in the zshrc):

```bash
nvm install --lts
nvm use --lts
```

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

Clone the repo and run the setup script for your platform. The scripts install all prerequisites and stow the dotfiles in one shot.

```bash
git clone -b main https://github.com/caiocalhau/dotfiles ~/dotfiles
cd ~/dotfiles

# macOS
./scripts/install-macos.sh

# WSL / Linux
./scripts/install-wsl.sh
```

To stow or restow manually:

```bash
# Symlink a config
stow tmux

# Remove a symlink
stow -D tmux

# Restow (useful after adding new files)
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
