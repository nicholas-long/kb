#!/bin/bash

# update all the git repos in home direcotry and prompt with lazygit

~/kb/bash-scripting/enum-git-repos-in-directory.sh $HOME |\
  awk -F / 'NF == 4 {print}' |\
  while read dir; do
    cd $dir
    git pull
  done
