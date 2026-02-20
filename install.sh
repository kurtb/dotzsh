#!/usr/bin/env bash
set -e

# The root directory of this zsh config repo, resolved relative to this script
ZSH_CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install oh-my-zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Clone third-party plugins if not present
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
  git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"
fi

# Initialize submodules (z)
git -C "$ZSH_CONFIG_DIR" submodule update --init --recursive

# Add source line to ~/.zshrc if not already present
ZSHRC_LINE="source $ZSH_CONFIG_DIR/zshrc.zsh"
if ! grep -qF "$ZSHRC_LINE" "$HOME/.zshrc" 2>/dev/null; then
  echo "$ZSHRC_LINE" >> "$HOME/.zshrc"
  echo "Added source line to $HOME/.zshrc"
else
  echo "$HOME/.zshrc already sources $ZSH_CONFIG_DIR/zshrc.zsh, skipping"
fi

echo "Done! Restart your shell or run: source ~/.zshrc"
