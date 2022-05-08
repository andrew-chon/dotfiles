#!/bin/bash

SESSION="wide"
SESSIONEXISTS=$(tmux list-sessions | grep -w "$SESSION")

if [ "$SESSIONEXISTS" = "" ]
then

  tmux new-session -d -s "$SESSION" -d -x "$(tput cols)" -y "$(tput lines)"

  tmux rename-window -t 0 'code'
  tmux send-keys -t 'code' '' C-m

  tmux select-pane -t 0

  tmux new-window -t "$SESSION":1 -n 'debug'
  tmux send-keys -t 'debug' '' C-m
  tmux select-pane -t 0

  tmux new-window -t "$SESSION":2 -n 'terminal'
  tmux send-keys -t 'terminal' '' C-m
  tmux select-pane -t 0

fi

tmux attach-session -t "$SESSION":0
