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

* Git
* Curl (required by bootstrap script)
* Python (v3.6+ required by YouCompleteMe)
* CTags (required by vim-gutentags)
* Vim (v8.1.2269+ required by YouCompleteMe)
* Tmux (v1.9+ required by TPM, v2.3+ recommended for `split-window`'s `-f`
  option)
* Zsh (v5.1.1+ required by oh-my-zsh)

#### Extras

* Tree
* Ag (recommended for fzf's ag search)
* Vim-GTK (recommended for vim's clipboard feature on Debian/Ubuntu,
  see [this](https://vim.fandom.com/wiki/Accessing_the_system_clipboard#Checking_for_X11-clipboard_support_in_terminal)
  for info on other distros)
* Term::ReadKey Perl Module (recommended for git's interactive.singleKey
  feature)
* Zathura
* Go

If you're on Ubuntu, you can install these prerequisites (and [YouCompleteMe's
build dependencies](docs/YouCompleteMe.md)) by running:

```
~/.dotfiles/scripts/install_ubuntu_deps.sh
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
