# =========================================================
# Base configuration
# =========================================================

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

# =========================================================
# Utility functions
# =========================================================

path_append() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="${PATH:+"$PATH:"}$1" ;;
  esac
}

path_prepend() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="$1${PATH:+":$PATH"}" ;;
  esac
}

# =========================================================
# OS detection
# =========================================================

OS="$(uname -s)"

# =========================================================
# Homebrew (macOS)
# =========================================================

if [[ "$OS" == "Darwin" ]]; then
  # Apple Silicon
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Intel Mac fallback
  if [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# =========================================================
# NVM
# =========================================================

export NVM_DIR="$HOME/.nvm"

if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  . "$NVM_DIR/nvm.sh"
fi

# =========================================================
# Android SDK
# =========================================================

if [[ "$OS" == "Darwin" ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
elif [[ "$OS" == "Linux" ]]; then
  export ANDROID_HOME="$HOME/Android/Sdk"
fi

if [[ -n "$ANDROID_HOME" ]]; then
  path_append "$ANDROID_HOME/emulator"
  path_append "$ANDROID_HOME/platform-tools"
  path_append "$ANDROID_HOME/cmdline-tools/latest/bin"
fi

# =========================================================
# Additional binaries
# =========================================================

path_append "$HOME/.local/bin"
path_append "/usr/local/go/bin"

# Optional standalone Neovim install
if [[ -d /opt/nvim/bin ]]; then
  path_append "/opt/nvim/bin"
fi

# =========================================================
# direnv
# =========================================================

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# =========================================================
# Oh My Zsh
# =========================================================

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# =========================================================
# History
# =========================================================

HIST_STAMPS="yyyy-mm-dd"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# =========================================================
# Terminal title
# =========================================================

function set_terminal_title() {
  echo -ne "\033]0;${PWD##*/}\007"
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd set_terminal_title

precmd() {
  set_terminal_title
}

# =========================================================
# Aliases
# =========================================================

alias python="python3"
alias vim="nvim"

alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"

alias gs="git status"
alias gc="git commit"
alias gp="git push"

alias devclean="$HOME/scripts/dev-clean.sh"

# =========================================================
# WSL detection
# =========================================================

if grep -qi microsoft /proc/version 2>/dev/null; then
  export IS_WSL=true
else
  export IS_WSL=false
fi

# =========================================================
# User-local environment bootstrap
# =========================================================

if [[ -f "$HOME/.local/bin/env" ]]; then
  . "$HOME/.local/bin/env"
fi

# =========================================================
# Kitty shell integration
# =========================================================

# Only activates inside a Kitty window (not inside tmux, where TERM=tmux-256color)
if [[ "$TERM" == "xterm-kitty" ]] && [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  source "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty-integration"
fi

# =========================================================
# Final PATH cleanup (remove duplicates)
# =========================================================

export PATH="$(printf "%s" "$PATH" | awk -v RS=: '!a[$1]++ { if (NR > 1) printf ":"; printf $1 }')"
