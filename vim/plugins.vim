""" Vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  " Auto-install vim-plug (and plugins) if not yet installed
  " Useful when launching vim on a new machine for the first time
  if !executable('curl')
    echomsg 'Installation of vim-plug failed: curl not found.'
    echomsg 'Remove plugins.vim in vimrc if you want to disable plugins entirely.'
    exit
  endif
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  echomsg 'Installing plugins for the first time. Restart vim when done.'
endif

" Auto-install missing plugins on start-up
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/.vim/plugged') " Download plugins onto the specified path

Plug 'jeffkreeftmeijer/vim-dim' " Colorscheme
Plug 'vim-airline/vim-airline' " Fancy status line
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'sheerun/vim-polyglot' " Syntax highlighting and indentation for various languages
Plug 'Raimondi/delimitMate' " Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'sickill/vim-pasta' " Context-aware pasting (i.e. changes indentation of pasted text to match that of surrounding text)
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'unblevable/quick-scope' " Highlights for more efficient left/right motions using f/F
Plug 'google/vim-searchindex' " Make searches more like Ctrl+F on web browsers
Plug 'ludovicchabant/vim-gutentags', {'tag': 'v1.0.0'} " Tag files generator/manager (v1.0.0 is what works for vim 7+)
Plug 'airblade/vim-rooter' " Helper functions for guessing the project root using heuristics (e.g. FindRootDirectory())
Plug 'jeetsukumaran/vim-filebeagle' " File browser
Plug 'junegunn/fzf', {'do': './install --bin'} " Fuzzy finder (configured to auto-install binary, but not shell integration for independent usage in bash, zsh, etc.)
Plug 'junegunn/fzf.vim' " Commands and mappings used to improve usage of fzf in vim
Plug 'pbrisbin/vim-mkdir' " Automatically create any non-existing directories before writing the buffer
Plug 'neomake/neomake' " Linting and make framework

call plug#end()

""" Airline
let g:airline_theme='base16_classic'
let g:airline_powerline_fonts=0
let g:airline_symbols_ascii=1
let g:airline#extensions#whitespace#symbol='' " Disable symbol used for trailing whitespace / mixed indent warnings; the warning is visible enough as is
let g:airline_section_c='%f%m %r' " Show file path relative to working directory instead of full path (+ other options, see :h statusline)
let g:airline_section_z='ln %l/%L : %2c' " Simplify format of the line and column number display
let g:airline#extensions#gutentags#enabled=0 " Disable messages from gutentags

""" DelimitMate
let g:delimitMate_expand_cr=1 " Create new line and move cursor one tab into body when creating code block with braces

""" Quickscope
let g:qs_highlight_on_keys=['f','F'] " Trigger highlights only when one of these keys is pressed

augroup my_quickscope_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary cterm=bold,underline ctermfg=green
  autocmd ColorScheme * highlight QuickScopeSecondary cterm=bold,underline ctermfg=cyan
augroup END

""" Vim-rooter
let g:rooter_manual_only=1 " Disable auto-changing of the current working directory; we only want this plugin for its helper functions

""" FileBeagle
let g:filebeagle_suppress_keymaps=1
let g:filebeagle_show_hidden=1

nnoremap <silent> <Leader>f :FileBeagle<CR>| " Open file browser

""" Fzf
let g:fzf_layout={'down': '~25%'}

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, {'dir': FindRootDirectory()}, <bang>0) " Override Ag and Ag! to search from the project root

nnoremap <C-p> :execute 'Files ' . FindRootDirectory()<CR>| " Start file search from the project root
nnoremap <Leader>h :History<CR>| " Start file search amongst recently opened files
nnoremap <Leader>l :Lines!<CR>| " Start line search on open buffers (full-screen)
nnoremap <Leader>a :Ag!<space>| " Start ag search from the project root (full-screen)

""" Neomake
call neomake#configure#automake('w') " Run on buffer write

augroup my_neomake_colors
  autocmd!
  autocmd ColorScheme * highlight NeomakeError cterm=underline ctermfg=red
  autocmd ColorScheme * highlight NeomakeWarning cterm=underline ctermfg=yellow
augroup END