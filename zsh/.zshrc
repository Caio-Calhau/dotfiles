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

# Set the Android SDK location
export ANDROID_HOME="/mnt/c/Users/Caio/AppData/Local/Android/Sdk"

# Add Android SDK platform-tools and tools to the PATH
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"

# Set Java home for Android development
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"

# Add Java to the PATH
export PATH="$JAVA_HOME/bin:$PATH"

export PATH="$PATH:/mnt/c/Users/Caio/AppData/Local/Android/Sdk/platform-tools/adb.exe"
export PATH=$PATH:/path/to/android-sdk/cmdline-tools/latest/bin
export ANDROID_HOME="/home/golira/android-sdk"
export PATH="$PATH:/home/golira/android-sdk/cmdline-tools/latest/bin"

if [ -z "$TMUX" ]; then
    if tmux has-session 2>/dev/null; then
        tmux attach-session -d
    else
        tmux new-session -s mysession$(($(tmux list-sessions 2>/dev/null | wc -l) + 1))
    fi
fi

