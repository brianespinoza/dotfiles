# zmodload zsh/zprof # Uncomment to enable profiling
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Set Java Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home

autoload -Uz compinit
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"

# Rebuild if dump doesn't exist, or is older than 1 day (86400 seconds)
if [[ ! -s "$zcompdump" || $(($(date +%s) - $(stat -f %m "$zcompdump"))) -gt 86400 ]]; then
  # echo "zcompdump missing or older than 1 day, running compinit" >&2
  compinit
else
  # echo "zcompdump fresh, using cached compinit" >&2
  compinit -C
fi

# Compile the dump file to speed up future startups
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
  zcompile "$zcompdump"
fi

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

# autoload -U promptinit; promptinit
# export PURE_CMD_MAX_EXEC_TIME=10  # Show command duration after 10s
# zstyle :prompt:pure:git:stash show yes  # Show git stash info
# prompt pure

source ~/.zsh_plugins.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# === END ===

eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

alias ..='cd ..'
alias cd='z'
alias idea='open -na "IntelliJ IDEA.app" --args "$@"'

# Set up fzf key bindings and fuzzy completion
[[ -r ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Lazy load NVM (prevents scanning for versions at startup)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="/opt/homebrew/opt/ffmpeg@4/bin:$PATH"


export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# zprof # Uncomment to enable profiling
