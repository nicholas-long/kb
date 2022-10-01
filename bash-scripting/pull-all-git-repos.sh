#!/bin/bash

# pull all the git repos in home directory

~/kb/bash-scripting/enum-git-repos-in-directory.sh $HOME |\
  awk -F / 'NF == 4 {print}' |\
  while read dir; do
    cd $dir
    echo "pulling $dir"
    git pull
  done
