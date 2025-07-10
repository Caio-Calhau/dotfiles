export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

if [ -d "$ZSH" ]; then
    source $ZSH/oh-my-zsh.sh
else
    echo "Oh My Zsh directory does not exist"
fi

source $ZSH/oh-my-zsh.sh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(
  git
  tmux
)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HOMEBREW_PREFIX=/bin/brew
export HOMEBREW_CELLAR=/bin/brew/Cellar

# Add /usr/local/bin to the PATH
export PATH="$PATH:/usr/local/bin"

