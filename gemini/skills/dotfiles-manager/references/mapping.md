# Dotfiles Mapping

> [!IMPORTANT]
> This file is a reference for Gemini. The **source of truth** for all symlink mappings is [`scripts/create_links.sh`](../../scripts/create_links.sh). Always refer to that script when updating or verifying mappings.

This file defines the mapping between the symlinks in the home directory and the actual files in the dotfiles repository.

| Home Directory Path (relative to ~) | Repository Path |
|------------------------------------|-----------------|
| `.bash_profile` | `shell/bash/bash_profile` |
| `.bashrc` | `shell/bash/bashrc` |
| `.config/sublime-text-3/Packages/User/Preferences.sublime-settings` | `sublime/Preferences.sublime-settings` |
| `.config/sublime-text/Packages/User/Preferences.sublime-settings` | `sublime/Preferences.sublime-settings` |
| `.gemini/GEMINI.md` | `gemini/GEMINI.md` |
| `.gemini/policies/policies.toml` | `gemini/policies.toml` |
| `.gemini/settings.json` | `gemini/settings.json` |
| `.gemini/skills` | `gemini/skills` |
| `.gitconfig` | `git/gitconfig` |
| `.ssh/config` | `ssh/config` |
| `.tmux.conf` | `tmux/tmux.conf` |
| `.vimrc` | `vim/vimrc` |
| `.zshrc` | `shell/zsh/zshrc` |
