#!/bin/bash

# update all the git repos in home directory and prompt with lazygit

~/kb/bash-scripting/enum-git-repos-in-directory.sh $HOME |\
  awk -F / 'NF == 4 {print}' |\
  while read dir; do
    cd $dir
    diffcount=$(git status --porcelain | wc -l)
    [ $diffcount -ne 0 ] && lazygit
  done
