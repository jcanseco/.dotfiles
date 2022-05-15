" Save current session using :SaveSession (or :SaveSession! if a session file
" already exists), and restore using :RestoreSession.
command! -bang SaveSession :mksession<bang> /tmp/session.vim
command! RestoreSession :source /tmp/session.vim

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
