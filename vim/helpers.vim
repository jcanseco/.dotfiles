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

" Executes the given string as a command and records it in the command
" history. This is useful if you want to record in history a command that
" completely comes from a mapping, making it easy to re-execute the command.
" Commands that completely come out of mappings are not recorded in history by
" default (see :h history).
function! ExecAndRecordInCmdHistory(cmd)
  call histadd("cmd", a:cmd)
  execute a:cmd
endfunction
