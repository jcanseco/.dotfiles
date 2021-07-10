# YouCompleteMe

### Required Vim Features

YouCompleteMe requires vim to have support for python scripting. Run the
following and ensure that there is a + before python3:

```
vim --version | grep python
```

If not, you will need to [compile vim from
source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
(don't worry, it's easy).

### Build Dependencies

YouCompleteMe depends on some programs being installed to build successfully;
see the (short) [installation
guide](https://github.com/ycm-core/YouCompleteMe#linux-64-bit). For Ubuntu
16.04+ for example:

```
sudo apt install build-essential cmake python3-dev
```

Vim-plug will have successfully built YouCompleteMe if you already had these
dependencies installed when vim-plug downloaded YouCompleteMe for the first
time. Otherwise, run `:PlugInstall!` in vim to force a rebuild of
YouCompleteMe.

Following this short guide should be enough to successfully build a basic build
of YouCompleteMe. If you're on a different distro than the ones listed or if
something goes wrong with the installation, refer to the [full installation
guide](https://github.com/Valloric/YouCompleteMe#full-installation-guide).

### Semantic Completion (Optional)

The short installation guide also includes instructions on how to enable
semantic completion for supported languages and their respective dependencies
(e.g. C/C++ semantic completion requires libclang, and Go requires, well, Go to
be installed).

Note that you don't _need_ semantic completion, but it can be nice to have
especially if the set-up doesn't take much effort (e.g. Go).

Rebuilding YouCompleteMe with the appropriate flags should be enough to enable
semantic completion for your target languages. However, to maximize your
experience, read the [user
guide](https://github.com/Valloric/YouCompleteMe#user-guide) for
language-specific set-up instructions.
