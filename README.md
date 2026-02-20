Personal zsh config using oh-my-zsh. Run on a new machine to install, or re-run anytime to update.

```sh
./install.sh
```

## What install.sh does

- Installs oh-my-zsh if not present
- Clones (or pulls) third-party plugins into `~/.oh-my-zsh/custom/plugins/`
- Clones (or pulls) [z](https://github.com/rupa/z) into `./z/` in this repo
- Appends `source /path/to/zshrc.zsh` to `~/.zshrc` if not already there

Re-running is safe — every step is idempotent.

## Machine-local config

`~/.zshrc` is not tracked in this repo. It sources `zshrc.zsh` and is the right place for machine-specific config. Tools that auto-append to `~/.zshrc` (e.g. `nvm`, `conda`) will write there, keeping this repo clean.

## Structure

- `zshrc.zsh` — shared zsh config, sourced by `~/.zshrc`
- `install.sh` — sets everything up (see above)
- `z/` — [rupa/z](https://github.com/rupa/z) for frecency-based directory jumping; cloned here since it has no better home. Gitignored and managed by `install.sh`.
- Plugins live in `~/.oh-my-zsh/custom/plugins/` — required by oh-my-zsh and managed by `install.sh`
