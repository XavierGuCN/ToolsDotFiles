# Config

Shared dotfiles for CLI tools.

This repository uses an allowlist `.gitignore`: everything under `~/.config`
is ignored unless explicitly unignored. This avoids accidentally syncing
application state from tools such as VS Code, GTK, dconf, ibus, and desktop
apps.

Tracked by default:

- `nvim/`
- `tmux/`
- `yazi/`
- `starship.toml`

Machine-local files should stay ignored, for example:

- `nvim/lua/local/`
- `tmux/plugins/`
