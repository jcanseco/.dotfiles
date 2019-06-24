" Set the <Leader> key
let mapleader="\<space>"

" Reload vimrc using :rl
cnoreabbrev <expr> rl 'source ~/.vimrc'

" Save
nnoremap <Leader>w :w<CR>

" Quit
nnoremap <Leader>q :q<CR>

" Toggle paste mode
nnoremap <silent> <Leader>p :set paste!<CR>

" Like 'C' and 'D', yank from cursor to end of line
nnoremap Y y$

" Move over wrapped lines same as normal lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Move between vim-splits using 'Ctrl + (h/j/k/l)'
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Go back and forth between recently visited buffers
nnoremap <C-b> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" Align blocks of text and keep them selected
vnoremap < <gv
vnoremap > >gv

" Prevent jumping to the next match when pressing '*'
nnoremap * :keepjumps normal! mi*`i<CR>

" Disable highlights
nnoremap <silent> <Leader>d :noh<CR>

" Remove all trailing whitespace
nnoremap <silent> <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> :w<CR> :noh<CR>

" Refresh current buffer to match saved state, and then save right after to remove the 'trailing whitespace' warning on airline
nnoremap <silent> <Leader>r :e!<CR> :w<CR>

" Common mistypes (we don't add one for 'q:' because we use 'q' in FileBeagle)
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q
command! QA qa
command! Qa qa
