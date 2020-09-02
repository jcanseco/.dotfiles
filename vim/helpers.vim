" Executes the given string as a command and records it in the command
" history. This is useful if you want to record in history a command that
" completely comes from a mapping, making it easy to re-execute the command.
" Commands that completely come out of mappings are not recorded in history by
" default (see :h history).
function! ExecAndRecordInCmdHistory(cmd)
  call histadd("cmd", a:cmd)
  execute a:cmd
endfunction
