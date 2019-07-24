#!/usr/bin/env bash

# Execute a command in all the tmux panes in the current window
# Warning: does not work properly if you have a program running in at least one
# of the panes since this function just types out the command one key at a time
# Usage: all.sh <command>

CR=C-m # Carriage return in tmux
cmd="$@"
active_pane_id=$TMUX_PANE

for pane_id in $(tmux list-panes -F '#{pane_id}'); do
    if [[ $pane_id != $active_pane_id ]]; then
        tmux send-keys -t $pane_id "$cmd" $CR
    fi
done

# Execute the command in the active pane last (i.e. the pane executing this
# function). This is because a command may involve termination of the pane,
# and we don't want to terminate the active pane before it could send out
# the command to the other panes.
tmux send-keys -t $active_pane_id "$cmd" $CR
