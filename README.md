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
* Curl (used to install vim-plug)
* Python 2 or 3 (used by YouCompleteMe)
* CTags (used by vim-gutentags)
* Vim (v7.4.1578+ required by YouCompleteMe)
* Tmux (v1.9+ required by Tmux Plugin Manager)

```
sudo apt install git curl python python3 exuberant-ctags vim tmux
```

## Extras

* Tree
* Ag (used by fzf's ag search)

```
sudo apt install tree silversearcher-ag
```

## Installation

Clone the repository onto the home directory, then run the bootstrap script:

```
~/.dotfiles.new/scripts/bootstrap.sh
```

## Appendix

### YouCompleteMe

#### Required Vim Features

YouCompleteMe requires for vim to have support for python scripting. To check, run the following and ensure that there is a + before either python or python3:

```
vim --version | grep python
```

If not, you will need to [compile vim from source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source) (don't worry, it's easy).

#### Build Dependencies

YouCompleteMe depends on some programs being installed to build successfully; see the (short) [installation guide](https://github.com/ycm-core/YouCompleteMe#linux-64-bit). For example, for Ubuntu 16.04+:

```
sudo apt install build-essential cmake python-dev python3-dev
```

You should have these installed before vim-plug downloads YouCompleteMe so that the build could succeed the first time. Otherwise, run `:PlugInstall!` in vim to force a rebuild of YouCompleteMe.

Following this short guide should be enough to successfully build a basic build of YouCompleteMe. If you're on a different distro than the ones listed or if something goes wrong with the installation, refer to the [full installation guide](https://github.com/Valloric/YouCompleteMe#full-installation-guide).

#### Semantic Completion (Optional)

The short installation guide also includes instructions on how to enable semantic completion support for each language and their respective dependencies (e.g. C/C++ semantic completion requires libclang and Go requires, well, Go to be installed).

Note that you don't _need_ semantic completion, but it can be nice to have especially if the set-up doesn't take much effort (e.g. Go).

Rebuilding YouCompleteMe with the appropriate flags should be enough to enable semantic completion for your target languages. However, to maximize your experience with semantic completion, read the [user guide](https://github.com/Valloric/YouCompleteMe#user-guide) for language-specific set-up instructions.
