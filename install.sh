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

# Symlink .zshrc
ln -sf "$ZSH_CONFIG_DIR/.zshrc" "$HOME/.zshrc"
echo "Linked $HOME/.zshrc -> $ZSH_CONFIG_DIR/.zshrc"

echo "Done! Restart your shell or run: source ~/.zshrc"
