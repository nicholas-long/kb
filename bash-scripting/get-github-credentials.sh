#!/bin/bash

# get the current user's github colon separated credentials
cat $HOME/.git-credentials | awk -F '[/@]' '/github/ {print $3}' | sed s/%40/@/g
