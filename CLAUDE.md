# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal zsh dotfiles repository. It configures zsh via oh-my-zsh with a set of plugins and includes the `z` directory jumper as a git submodule.

## Setup

To install on a new machine (clones plugins, initializes submodules, and adds a source line to `~/.zshrc`):

```sh
./install.sh
```

Re-running `install.sh` is safe — it skips any step already completed.

## Structure

- `zshrc.zsh` — main zsh config; sourced by `~/.zshrc` (which is machine-local and untracked)
- `install.sh` — bootstraps oh-my-zsh, clones third-party plugins, initializes submodules, and appends a `source` line to `~/.zshrc` if not already present
- `z/` — [rupa/z](https://github.com/rupa/z) for frecency-based directory jumping; cloned here by `install.sh` (gitignored, not a submodule). Sourced in `zshrc.zsh` using `${(%):-%x}:A:h` to resolve the real path of the sourced file

## Machine-local configuration

`~/.zshrc` is not tracked in this repo. It sources `zshrc.zsh` and can contain machine-specific config before or after that line. Tools that auto-append to `~/.zshrc` (e.g. `nvm`, `conda`) will write there, keeping the repo clean.

## Plugins (defined in `zshrc.zsh`)

`git docker npm node vscode docker-compose zsh-syntax-highlighting zsh-autosuggestions zsh-completions`

The last three (`zsh-syntax-highlighting`, `zsh-autosuggestions`, `zsh-completions`) are third-party and cloned by `install.sh` into `$ZSH_CUSTOM/plugins/`.
