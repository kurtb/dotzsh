#!/usr/bin/env bash
# -u catches unset variable bugs; -o pipefail catches failures in piped commands (e.g. curl | sh), not just the last command
set -euo pipefail

# The root directory of this zsh config repo, resolved relative to this script
ZSH_CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install oh-my-zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Clone or update third-party plugins
clone_or_update() {
  local repo="$1" dir="$2"
  if [ ! -d "$dir" ]; then
    git clone "$repo" "$dir"
  else
    git -C "$dir" pull --ff-only
  fi
}

clone_or_update https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_or_update https://github.com/zsh-users/zsh-autosuggestions      "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_or_update https://github.com/zsh-users/zsh-completions           "$ZSH_CUSTOM/plugins/zsh-completions"
clone_or_update https://github.com/rupa/z                              "$ZSH_CONFIG_DIR/z"

# Add source line to ~/.zshrc if not already present
ZSHRC_LINE="source $ZSH_CONFIG_DIR/zshrc.zsh"
if ! grep -qF "$ZSHRC_LINE" "$HOME/.zshrc" 2>/dev/null; then
  echo "$ZSHRC_LINE" >> "$HOME/.zshrc"
  echo "Added source line to $HOME/.zshrc"
else
  echo "$HOME/.zshrc already sources $ZSH_CONFIG_DIR/zshrc.zsh, skipping"
fi

echo "Done! Restart your shell or run: source ~/.zshrc"
