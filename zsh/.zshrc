# === ZPLUG SETUP ===

# If zplug is not installed, clone it
if [ ! -d "$(brew --prefix)/opt/zplug" ]; then
  echo "Installing zplug to $HOME/.zplug..."
  brew install zplug
fi

# Source zplug if it exists else throw
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
if [ -f "$ZPLUG_HOME/init.zsh" ]; then
  source "$ZPLUG_HOME/init.zsh"
else
  echo "ZPlug not found. Please install it and try again."
  exit 1
fi



# === PLUGINS ===
# List your plugins here

# For async functionality (used by some prompts)
zplug "mafredri/zsh-async"

# fzf for fuzzy finding
zplug "junegunn/fzf"

# fzf-tab for better tab completion
zplug "Aloxaf/fzf-tab"

# pure prompt (minimalistic prompt)
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "plugins/git",   from:oh-my-zsh

# Install or load plugins
if ! zplug check --verbose; then
  echo "===> Installing missing zplug plugins..."
  zplug install
fi
zplug load

# === PURE PROMPT SETTINGS ===

# Maximum execution time before Pure shows the elapsed time
export PURE_CMD_MAX_EXEC_TIME=10

# Show git stash info in prompt
zstyle :prompt:pure:git:stash show yes


# === MACHINE-SPECIFIC SETTINGS (Optional) ===
# If you have system-specific PATH or variables, you can source them from here:
# if [ -f ~/.zshrc.local ]; then
#   source ~/.zshrc.local
# fi

# === END ===

