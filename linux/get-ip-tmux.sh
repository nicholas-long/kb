#!/bin/bash

echo 0 is $0
echo 1 is $1
echo 2 is $2
echo 3 is $3
TMUX_SESSION=$1
TMUX_WINDOW=$2
TMUX_PANE=$3

MYIP=$(ip a s wlan0 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -n 1)

echo Send $MYIP to tmux pane $TMUX_PANE
tmux send-keys -t $TMUX_SESSION:$TMUX_WINDOW.$TMUX_PANE 'hi Enter'
read test