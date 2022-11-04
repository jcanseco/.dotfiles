```


     ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
     ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
     ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
     ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
  ██╗██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
  ╚═╝╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝


These are my dotfiles. There are many like it, but these ones are mine.

```

## Prerequisites

#### Required

* `git`
* `curl` (required by bootstrap script)
* `python` (v3.6+ required by YouCompleteMe)
* `ctags` (required by vim-gutentags)
* `vim` (v8.1.2269+ required by YouCompleteMe)
* `tmux` (v1.9+ required by TPM, v2.3+ recommended for `split-window`'s `-f`
  option)
* `zsh` (v5.1.1+ required by ohmyzsh)
* `fdfind` (used by fzf to search for file names)

#### Extras

* `tree`
* `rg` (recommended for fzf's rg search)
* `vim-gtk` (recommended for vim's clipboard feature on Debian/Ubuntu,
  see [this](https://vim.fandom.com/wiki/Accessing_the_system_clipboard#Checking_for_X11-clipboard_support_in_terminal)
  for info on other distros)
* `Term::ReadKey` Perl Module (recommended for git's `interactive.singleKey`
  feature)
* `go`

If you're on a Debian-like Linux distro (e.g. Ubuntu), you can install these
prerequisites (and [YouCompleteMe's build dependencies](docs/YouCompleteMe.md))
by running:

```
~/.dotfiles/scripts/install_debian_deps.sh
```

## Installation

```
~/.dotfiles/scripts/bootstrap.sh
```

## Closing Notes

Make sure to check that you meet the version requirements outlined in the
[Prerequisites](#prerequisites) section.

If you want to set up YouCompleteMe for vim, follow this
[guide](docs/YouCompleteMe.md).
