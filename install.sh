#!/usr/bin/env bash
# Create ~/code directory if it doesn't exist
mkdir -p "$HOME/code"

# Create ~/.dotfiles directory if it doesn't exist
mkdir -p "$HOME/.dotfiles"

# Install homebrew if not present
if ! command -v brew &> /dev/null
then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating brew..."
brew install antidote
brew update

echo "Installing packages..."
brew bundle --file=~/.dotfiles/BREWFILE

brew install koekeishiya/formulae/skhd


echo "Installation complete!"

# Change to the .dotfiles directory
cd "$HOME/.dotfiles" || {
  echo "Could not cd into $HOME/.dotfiles. Exiting."
  exit 1
}

echo "Creating symlinks..."

stow ideavim
stow nvim
stow yabai
stow skhd
stow karabiner
stow zsh
stow wezterm
stow aerospace

echo "All packages have been stowed and symlinked."

echo "Done!"
echo "To start aerospace, cmd+space then type 'aerospace', open."

