#!/bin/bash

SESSION="ide"
SESSIONEXISTS=$(tmux list-sessions | grep -w "$SESSION")

if [ "$SESSIONEXISTS" = "" ]
then

  tmux new-session -d -s "$SESSION" -d -x "$(tput cols)" -y "$(tput lines)"

  tmux rename-window -t 0 'code'
  tmux send-keys -t 'code' '' C-m
  tmux splitw -v -p 25

  tmux send-keys -t 'code' '' C-m
  tmux splitw -h

  tmux send-keys -t 'code' '' C-m

  tmux select-pane -t 0

fi

tmux attach-session -t "$SESSION":0
