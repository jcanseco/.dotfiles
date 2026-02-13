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

" Copies the path of the current file, relative to ProjectRoot(), into the vim
" clipboard (i.e. the '+' register) and the tmux clipboard (via the
" vim-tmux-clipboard plugin).
function! CopyPathToClipboard()
  let path = Path()

  " Save current buffer number
  let current_buf = bufnr('%')

  " Create a new scratch buffer
  new
  setlocal buftype=nofile bufhidden=hide noswapfile

  " Put the path into the buffer and yank it
  call setline(1, path)
  normal! gg"+yG

  " Close scratch buffer and return to original buffer
  bdelete!
  execute 'buffer ' . current_buf

  echo 'Copied to clipboard: ' . path
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
