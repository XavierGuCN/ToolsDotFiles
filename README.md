# Dotfiles

This repository uses the home directory as its work tree and an allowlist
`.gitignore`. It tracks shared CLI configuration and vendored Neovim runtime
files for offline deployment.

Because `~/.git` is unavailable in this environment, the repository metadata is
stored in `~/.dotfiles.git` as a bare repository. Use:

```sh
git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" status
```

After cloning on another machine, use the same `--git-dir/--work-tree` form or
create a shell alias locally.

Tracked areas:

- `.config/nvim/`
- `.config/tmux/`
- `.config/starship.toml`
- `.local/share/nvim/lazy/`
- `.local/share/nvim/site/`

Git metadata for vendored Neovim plugins is intentionally not tracked. The
plugins are stored as plain files so an offline machine can use them without
fetching from GitHub.

For offline restore, clone the repository with `~` as the work tree, then ensure
Neovim and external binaries such as `tree-sitter` are installed on the target
machine.
