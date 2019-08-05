" Set the <Leader> key
let mapleader="\<space>"

" Save
nnoremap <Leader>w :w<CR>

" Quit
nnoremap <Leader>q :q<CR>

" Edit from home
nnoremap <Leader>e :e ~/

" Toggle paste mode
nnoremap <silent> <Leader>p :set paste!<CR>

" Yank from cursor to end-of-line (i.e. make 'Y' behave like 'C' and 'D')
nnoremap Y y$

" Move over wrapped lines same as normal lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Move between splits using 'Ctrl + (h/j/k/l)'
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Go back and forth between recently visited buffers
nnoremap <C-b> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" Indent blocks of text in visual mode without leaving visual mode
vnoremap < <gv
vnoremap > >gv

" Prevent jumping to the next match when pressing '*'
nnoremap * :keepjumps normal! mi*`i<CR>

" Stop the highlighting of search results
nnoremap <silent> <Leader>d :noh<CR>

" Remove all trailing whitespace
nnoremap <silent> <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> :w<CR> :noh<CR>

" Refresh current buffer to match saved state, and then save right after to remove the 'trailing whitespace' warning on airline
nnoremap <silent> <Leader>r :e!<CR> :w<CR>

" Common typos (we don't add one for 'q:' because we use 'q' in FileBeagle)
command! WQ wq
command! Wq wq
command! Wqa wqa
command! Wa wa
command! W w
command! Q q
command! QA qa
command! Qa qa
command! E e
