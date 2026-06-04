#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
NVIM_VERSION="0.12.2"
STOW_VERSION="2.4.1"
NERD_FONT_VERSION="3.4.0"

print() { printf '\n\033[1;34m==> %s\033[0m\n' "$1"; }
ok()    { printf '\033[1;32m  ✓ %s\033[0m\n' "$1"; }

# --- Homebrew check ---
print "Checking Homebrew"
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Install it from https://brew.sh and re-run this script."
  exit 1
fi
ok "Homebrew found"

# --- tmux ---
print "Installing tmux"
brew install tmux
ok "tmux $(tmux -V)"

# --- Neovim ---
print "Installing Neovim $NVIM_VERSION"
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
  NVIM_ASSET="nvim-macos-arm64"
else
  NVIM_ASSET="nvim-macos-x86_64"
fi
curl -fsSL -O "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/${NVIM_ASSET}.tar.gz"
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf "${NVIM_ASSET}.tar.gz"
sudo mv "/opt/${NVIM_ASSET}" /opt/nvim
sudo xattr -r -d com.apple.quarantine /opt/nvim
rm "${NVIM_ASSET}.tar.gz"
ok "Neovim $(/opt/nvim/bin/nvim --version | head -1)"

# --- GNU Stow ---
print "Installing GNU Stow $STOW_VERSION"
curl -fsSL "https://ftp.gnu.org/gnu/stow/stow-${STOW_VERSION}.tar.gz" | tar xz
cd "stow-${STOW_VERSION}"
./configure --prefix=/usr/local
make
sudo make install
cd ..
rm -rf "stow-${STOW_VERSION}"
ok "Stow $(stow --version | head -1)"

# --- Kitty ---
print "Installing Kitty"
curl -fsSL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
ok "Kitty installed"

# --- JetBrainsMono Nerd Font ---
print "Installing JetBrainsMono Nerd Font $NERD_FONT_VERSION"
mkdir -p /tmp/jbmono
curl -fsSL "https://github.com/ryanoasis/nerd-fonts/releases/download/v${NERD_FONT_VERSION}/JetBrainsMono.tar.xz" \
  | tar xJ -C /tmp/jbmono
mkdir -p ~/Library/Fonts
cp /tmp/jbmono/*.ttf ~/Library/Fonts/
rm -rf /tmp/jbmono
ok "JetBrainsMono Nerd Font installed"

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

# --- Stow dotfiles ---
print "Stowing dotfiles from $DOTFILES_DIR"
cd "$DOTFILES_DIR"
for pkg in tmux nvim zsh kitty claude; do
  stow -v "$pkg"
  ok "Stowed $pkg"
done

printf '\n\033[1;32mSetup complete.\033[0m\n'
echo "Open a new shell, then:"
echo "  1. Launch tmux and press prefix + I to install plugins"
echo "  2. Run: nvm install --lts"
echo "  3. Open nvim — lazy.nvim will bootstrap and install plugins automatically"
