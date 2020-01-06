""" Helpers
source ~/.dotfiles/vim/helpers.vim

" Skip this file entirely if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  echomsg 'Vim-plug not found; skipping the loading of plugins.'
  finish
endif

" Auto-install missing plugins on start-up
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Helper function for building YouCompleteMe after first-time download or
" updates by vim-plug. If you need to force a (re)build, run ':PlugInstall!'.
" Semantic completion...
"   * for C/C++: install libclang and rebuild YCM with '--clang-completer'
"   * for Python: enabled by default
"   * for others: see README for YCM
function! BuildYcm(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin('~/.vim/plugged') " Download plugins onto the specified path

Plug 'jeffkreeftmeijer/vim-dim' " Colorscheme
Plug 'vim-airline/vim-airline' " Fancy status line (required: vim 7.2+)
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'sheerun/vim-polyglot' " Syntax highlighting and indentation for various languages
Plug 'Raimondi/delimitMate' " Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'sickill/vim-pasta' " Context-aware pasting (i.e. changes indentation of pasted text to match that of surrounding text)
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'tpope/vim-unimpaired' " Pairs of useful keymappings (see :h unimpaired)
Plug 'unblevable/quick-scope' " Highlights for more efficient left/right motions using f/F
Plug 'google/vim-searchindex' " Display number of search matches and index of current match
Plug 'ludovicchabant/vim-gutentags', {'tag': 'v1.0.0'} " Tag files generator/manager (v1.0.0 is what works for vim 7+) (required: ctags)
Plug 'airblade/vim-rooter' " Helper functions for guessing the project root using heuristics (e.g. FindRootDirectory())
Plug 'jeetsukumaran/vim-filebeagle' " File browser
Plug 'junegunn/fzf', {'do': './install --bin'} " Fuzzy finder (configured to auto-install binary, but not shell integration for independent usage in bash, zsh, etc.)
Plug 'junegunn/fzf.vim' " Commands and mappings used to improve usage of fzf in vim (recommended: ag)
Plug 'pbrisbin/vim-mkdir' " Automatically create any non-existing directories before writing the buffer
Plug 'Valloric/YouCompleteMe', {'do': function('BuildYcm')} " Auto-completion engine (required: vim 7.4.1578+ with python 2 or 3 support, OS-specific build dependencies (see README); recommended: language-specific dependencies for semantic completion (see README))
Plug 'neomake/neomake' " Linting and make framework (required: vim 7.4.503+; recommended: vim 8.0.0027+, toolchain for target languages (i.e. compilers, interpreters, linters))
Plug 'christoomey/vim-tmux-navigator' " Seamlessly navigate between tmux panes and vim splits (required: tmux 1.8+)
Plug 'tmux-plugins/vim-tmux-focus-events' " Fixes the 'FocusGained' and 'FocusLost' autocmds; required by vim-tmux-clipboard (see repo for other benefits)
Plug 'roxma/vim-tmux-clipboard' " Makes for easy copy-paste from vim to tmux by auto-copying text copied in vim onto the tmux clipboard (recommended: vim 8.0.1394+)
Plug 'edkolev/tmuxline.vim', {'on': ['Tmuxline', 'TmuxlineSnapshot']} " Used to generate tmux statusline configs to make it look like the current vim-airline set-up (see repo on how to do this)

call plug#end()

""" Airline
let g:airline_theme='base16_classic'
let g:airline_section_c='%f%m %r' " Show file path relative to current working directory instead of the full path if the file is somewhere inside the directory (+ other options, see :h statusline)
let g:airline_section_z='ln %l/%L : %2v' " Simplify format of the line and column number display
let g:airline_powerline_fonts=0 " Disable powerline symbols
let g:airline_symbols_ascii=1 " Use only ascii symbols
let g:airline#extensions#whitespace#symbol='' " Disable symbol used for trailing-whitespace/mixed-indent warnings; they're visible enough as is
let g:airline_extensions=['neomake', 'quickfix', 'whitespace'] " Explicitly whitelist enabled extensions to avoid unintentionally loading unwanted ones, especially ones that are enabled by default and loaded in once their corresponding plugin is installed

""" DelimitMate
let g:delimitMate_expand_cr=1 " Create new line and move cursor one tab into body when creating code block with braces

""" Quickscope
let g:qs_highlight_on_keys=['f', 'F', 't', 'T'] " Trigger highlights only when one of these keys is pressed

augroup my_quickscope_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary cterm=bold,underline ctermfg=green
  autocmd ColorScheme * highlight QuickScopeSecondary cterm=bold,underline ctermfg=cyan
augroup END

""" Vim-Rooter
let g:rooter_manual_only=1 " Disable auto-changing of the current working directory; we only want this plugin for its helper functions
let g:rooter_patterns=['.proj_root', '.git', '.git/'] " The files/directories used to identify the project root directory (see :h rooter_patterns)

command! Rt execute 'edit ' . FindRootDirectory()| " Open project root directory
command! RT Rt " Common typo

""" FileBeagle
let g:filebeagle_suppress_keymaps=1
let g:filebeagle_show_hidden=1

nnoremap <silent> <Leader>f :e .<CR>| " Open file browser on current working directory

""" Fzf
let g:fzf_layout={'down': '~25%'}

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, {'dir': FindRootDirectory()}, <bang>0) " Override Ag and Ag! to search from the project root

nnoremap <C-p> :execute 'Files ' . FindRootDirectory()<CR>| " Start file search from the project root
nnoremap <Leader>h :History!<CR>| " Start file search amongst recently opened files (full-screen)
nnoremap <Leader>l :Lines!<CR>| " Start line search on open buffers (full-screen)
nnoremap <Leader>aa :Ag!<space>| " Start ag search from the project root (full-screen)
nnoremap <Leader>aw :call ExecAndRecordInCmdHistory("Ag! <C-r><C-w>")<CR>| " Start ag search for word under cursor (full-screen)

""" YouCompleteMe
set completeopt-=preview " Only show completion candidates as a list instead of on a preview window

let g:ycm_register_as_syntastic_checker=0 " Turn off built-in syntax checker
let g:ycm_show_diagnostics_ui=0 " Turn off built-in diagnostics ui
let g:ycm_enable_diagnostic_signs=0 " Turn off diagnostic signs on the gutter
let g:ycm_enable_diagnostic_highlighting=0 " Turn off diagnostic line highlighting
let g:ycm_echo_current_diagnostic=0 " Turn off diagnostic messages
let g:ycm_global_ycm_extra_conf='~/.dotfiles/vim/extras/ycm_extra_conf.py' " Global config for C/C++ semantic completion

""" Neomake
call neomake#configure#automake('w') " Run on buffer write

let g:neomake_error_sign = {
  \ 'text': '>>',
  \ 'texthl': 'NeomakeErrorSign',
  \ }
let g:neomake_warning_sign = {
  \ 'text': '>>',
  \ 'texthl': 'NeomakeWarningSign',
  \ }
let g:neomake_message_sign = {
  \ 'text': '>>',
  \ 'texthl': 'NeomakeMessageSign',
  \ }
let g:neomake_info_sign = {
  \ 'text': '>>',
  \ 'texthl': 'NeomakeInfoSign'
  \ }

augroup my_neomake_colors
  autocmd!
  autocmd ColorScheme * highlight NeomakeError cterm=underline ctermfg=red
  autocmd ColorScheme * highlight NeomakeWarning cterm=underline ctermfg=yellow
augroup END

""" Vim-Tmux-Navigator
let g:tmux_navigator_disable_when_zoomed=1 " Disable exiting out of tmux zoom (i.e. by navigating away from the pane) when zoomed in on a vim pane

""" Vim-Tmux-Focus-Events
autocmd FocusLost * silent redraw! " Fixes weird issue where '^[[O' is sometimes left behind when vim loses focus (see https://github.com/tmux-plugins/vim-tmux-focus-events/issues/2)

""" Tmuxline
let g:tmuxline_powerline_separators=0 " Disable powerline symbols
let g:tmuxline_preset={
  \ 'a'    : '#S',
  \ 'cwin' : '#I #W #F',
  \ 'win'  : '#I #W',
  \ 'z'    : '%I:%M %p',
  \ 'options' : {'status-justify': 'left'}
  \ }
