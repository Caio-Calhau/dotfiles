#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
NVIM_VERSION="0.12.2"
STOW_VERSION="2.4.1"

print() { printf '\n\033[1;34m==> %s\033[0m\n' "$1"; }
ok()    { printf '\033[1;32m  ✓ %s\033[0m\n' "$1"; }

# --- tmux ---
print "Installing tmux"
sudo apt-get install -y tmux
ok "tmux $(tmux -V)"

# --- Neovim ---
print "Installing Neovim $NVIM_VERSION"
sudo apt-get remove -y neovim 2>/dev/null || true
curl -fsSL -O "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux-x86_64.tar.gz"
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
rm nvim-linux-x86_64.tar.gz
ok "Neovim $(/opt/nvim/bin/nvim --version | head -1)"

# --- GNU Stow ---
print "Installing GNU Stow $STOW_VERSION"
sudo apt-get install -y make perl
curl -fsSL "https://ftp.gnu.org/gnu/stow/stow-${STOW_VERSION}.tar.gz" | tar xz
cd "stow-${STOW_VERSION}"
./configure --prefix=/usr/local
make
sudo make install
cd ..
rm -rf "stow-${STOW_VERSION}"
ok "Stow $(stow --version | head -1)"

# --- Oh My Zsh ---
print "Installing Oh My Zsh"
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  ok "Oh My Zsh already installed — skipping"
else
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ok "Oh My Zsh installed"
fi

# --- Zsh plugins ---
print "Installing Zsh plugins"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi
ok "Zsh plugins ready"

# --- TPM ---
print "Installing TPM"
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ok "TPM installed"
else
  ok "TPM already installed — skipping"
fi

# --- NVM ---
print "Installing NVM"
if [[ ! -d "$HOME/.nvm" ]]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash
  ok "NVM installed"
else
  ok "NVM already installed — skipping"
fi

# --- Build tools ---
print "Installing build tools"
sudo apt-get install -y build-essential
ok "build-essential installed"

# --- tree-sitter CLI ---
print "Installing tree-sitter CLI"
if command -v tree-sitter &>/dev/null; then
  ok "tree-sitter already installed — skipping"
else
  mkdir -p "$HOME/.local/bin"
  curl -fsSL "https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz" \
    | gunzip > "$HOME/.local/bin/tree-sitter"
  chmod +x "$HOME/.local/bin/tree-sitter"
  ok "tree-sitter $("$HOME/.local/bin/tree-sitter" --version)"
fi

# --- Stow dotfiles ---
print "Stowing dotfiles from $DOTFILES_DIR"
cd "$DOTFILES_DIR"
for pkg in tmux nvim zsh claude; do
  stow -v "$pkg"
  ok "Stowed $pkg"
done

printf '\n\033[1;32mSetup complete.\033[0m\n'
echo "Open a new shell, then:"
echo "  1. Launch tmux and press prefix + I to install plugins"
echo "  2. Run: nvm install --lts"
echo "  3. Open nvim — lazy.nvim will bootstrap and install plugins automatically"
echo ""
echo "Note: Kitty and JetBrainsMono Nerd Font should be installed on the Windows side."
