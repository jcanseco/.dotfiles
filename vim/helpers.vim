" Returns the project root directory.
function! ProjectRoot()
  " Return the monorepo root if monorepo support is enabled and the current
  " working directory is within the monorepo. Note: The . is the concatenation
  " operator in vim.
  if !empty($MONOREPO_ROOT) && matchstr(getcwd(), '^'.$MONOREPO_ROOT) != ""
    return $MONOREPO_ROOT
  endif
  return FindRootDirectory()
endfunction

" Returns the path of the current file, relative to ProjectRoot().
function! Path()
  let current_file = expand('%:p')
  let project_root = ProjectRoot()
  return substitute(current_file, '^' . project_root . '/', '', '')
endfunction

" Returns the absolute path of the current file.
function! AbsPath()
  return expand('%:p')
endfunction

" Copies the given text into the vim clipboard (i.e. the '+' register) and the
" tmux clipboard (via the vim-tmux-clipboard plugin).
function! CopyToClipboard(text)
  " Save current buffer number
  let current_buf = bufnr('%')

  " Create a new scratch buffer
  new
  setlocal buftype=nofile bufhidden=hide noswapfile

  " Put the text into the buffer and yank it
  call setline(1, a:text)
  normal! gg"+yG

  " Close scratch buffer and return to original buffer
  bdelete!
  execute 'buffer ' . current_buf

  echo 'Copied to clipboard: ' . a:text
endfunction

" Copies the path of the current file, relative to ProjectRoot(), into the vim
" clipboard (i.e. the '+' register) and the tmux clipboard (via the
" vim-tmux-clipboard plugin).
function! CopyPathToClipboard()
  call CopyToClipboard(Path())
endfunction

" Copies the absolute path of the current file into the vim clipboard (i.e.
" the '+' register) and the tmux clipboard (via the vim-tmux-clipboard
" plugin).
function! CopyAbsPathToClipboard()
  call CopyToClipboard(AbsPath())
endfunction

" Executes the given string as a command and records it in the command
" history. This is useful if you want to record in history a command that
" completely comes from a mapping, making it easy to re-execute the command.
" Commands that completely come out of mappings are not recorded in history by
" default (see :h history).
function! ExecAndRecordInCmdHistory(cmd)
  call histadd("cmd", a:cmd)
  execute a:cmd
endfunction
