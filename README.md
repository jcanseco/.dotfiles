```


     ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
     ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
     ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
     ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
  ██╗██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
  ╚═╝╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝


These are my dotfiles. There are many like it, but these ones are mine.

```

## Requirements

* Git
* Curl (required by bootstrap script)
* Python 2 or 3 (required by YouCompleteMe)
* CTags (required by vim-gutentags)
* Vim (v7.4.1578+ required by YouCompleteMe)
* Tmux (v1.9+ required by TPM, v2.3+ recommended for `split-window`'s `-f` option)
* Zsh (v5.1.1+ required by oh-my-zsh)

```
sudo apt install git curl python python3 exuberant-ctags vim tmux zsh
```

## Extras

* Tree
* Ag (recommended for fzf's ag search)
* Vim-GTK (recommended for vim's clipboard feature on Debian/Ubuntu, see [this](https://vim.fandom.com/wiki/Accessing_the_system_clipboard#Checking_for_X11-clipboard_support_in_terminal) for info on other distros)
* Zathura

```
sudo apt install tree silversearcher-ag vim-gtk zathura
```

## Installation

Clone the repository onto the home directory, then run the bootstrap script:

[//]: # "Different ways of saving terminal output to a file: https://askubuntu.com/a/731237"
[//]: # "Using tee with '|&' but in a way that works with older versions of bash: https://askubuntu.com/a/485762"

```
~/.dotfiles/scripts/bootstrap.sh 2>&1 | tee ~/.bootstrap.log
```

## Closing Notes

Make sure to check that you meet the version requirements outlined in the [Requirements](#requirements) section.

If you want to set up YouCompleteMe for vim, follow this [guide](docs/YouCompleteMe.md).
