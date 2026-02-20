# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal zsh dotfiles repository. It configures zsh via oh-my-zsh with a set of plugins and includes the `z` directory jumper as a git submodule.

## Setup

To install on a new machine (clones plugins, initializes submodules, and symlinks `.zshrc`):

```sh
./install.sh
```

## Structure

- `.zshrc` — main zsh config, sourced by oh-my-zsh
- `install.sh` — bootstraps oh-my-zsh, clones third-party plugins, initializes submodules, and symlinks `.zshrc` to `~/.zshrc`
- `z/` — git submodule of [rupa/z](https://github.com/rupa/z) for frecency-based directory jumping; sourced in `.zshrc` using `${(%):-%x}:A:h` to resolve the real path through the symlink

## Plugins (defined in `.zshrc`)

`git docker npm node vscode docker-compose zsh-syntax-highlighting zsh-autosuggestions zsh-completions`

The last three (`zsh-syntax-highlighting`, `zsh-autosuggestions`, `zsh-completions`) are third-party and cloned by `install.sh` into `$ZSH_CUSTOM/plugins/`.
