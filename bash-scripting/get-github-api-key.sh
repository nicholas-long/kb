#!/bin/bash

# get the current user's github api key
cat $HOME/.git-credentials | awk -F '[/:@]' '/github/ {print $5}'
