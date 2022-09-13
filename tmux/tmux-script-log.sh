#!/bin/bash

log_filename="$( date '+%Y.%m.%d_%H.%M.%S' )"

mkdir -p ~/tmux-logs
script -q >(gzip > ~/tmux-logs/$log_filename.log.gz)
