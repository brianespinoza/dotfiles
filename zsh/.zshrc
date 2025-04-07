# zmodload zsh/zprof # Uncomment to enable profiling

# Set Java Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home

autoload -Uz compinit
zstyle ':completion:*' rehash true  # Auto-update completion cache

# Only run compinit if cache is outdated
if [[ -f ~/.zcompdump && ~/.zcompdump -nt ~/.zcompdump.zwc ]]; then
  compinit -C
else
  compinit
  zcompile ~/.zcompdump
fi

# Skip compaudit to speed up Zsh startup
compinit() {
  command compinit -C
}

export SDKMAN_DIR="$HOME/.sdkman"
# unset -f sdk
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# === ANTIDOTE SETUP ===
export ANTIDOTE_HOME="$(brew --prefix)/opt/antidote/share/antidote"
if [ -f "$ANTIDOTE_HOME/antidote.zsh" ]; then
  source "$ANTIDOTE_HOME/antidote.zsh"
else
  echo "Antidote not found. Please install it and try again."
  exit 1
fi

# === PLUGIN MANAGEMENT ===
ANTIDOTE_BUNDLE="$HOME/.zsh_plugins.txt"
PLUGINS_CACHE="$HOME/.zsh_plugins.zsh"

# Only regenerate the bundle if the plugin list changes
if [[ ! -f "$PLUGINS_CACHE" || "$ANTIDOTE_BUNDLE" -nt "$PLUGINS_CACHE" ]]; then
  antidote bundle < "$ANTIDOTE_BUNDLE" > "$PLUGINS_CACHE"
fi

# Source the precomputed plugin bundle
source "$PLUGINS_CACHE"

# === PURE PROMPT SETTINGS ===
export PURE_CMD_MAX_EXEC_TIME=10  # Show command duration after 10s
zstyle :prompt:pure:git:stash show yes  # Show git stash info

# === END ===

eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

alias cd='z'
alias idea='open -na "IntelliJ IDEA CE.app" --args "$@"'

# Set up fzf key bindings and fuzzy completion
[[ -r ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Lazy load NVM (prevents scanning for versions at startup)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# zprof # Uncomment to enable profiling
export PATH="/opt/homebrew/opt/ffmpeg@4/bin:$PATH"
