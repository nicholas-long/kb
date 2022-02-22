#!/bin/bash

function walk_tree {
  tag=$2
  path=$3
  git cat-file -p $1 | \
    while read asdf tp hash file; do
      [ $tp = "tree" ] && walk_tree $hash $tag "$path/$file" # recursion
      [ $tp = "blob" ] && printf "$hash\t$tag\t$path/$file\r\n"
    done
}

function walk_commit {
  tag=$2
  git cat-file -p $1 | head -n 2 | grep tree | awk '{print $2}' | while read tree; do walk_tree $tree $tag ""; done
}

function walk_commits_tags {
  while read commit tag; do
    walk_commit $commit $tag
  done
}

# clone repo into temp dir
tf=$(mktemp)
rm $tf && mkdir $tf
git clone --mirror https://github.com/facebook/folly $tf
rm /tmp/hash_list 2>/dev/null
cd $tf

# get all tags and start walking their commits
cat packed-refs | grep refs/tags/ | walk_commits_tags > /tmp/hash_list

# take only unique git hashes and do md5 hashes of those files
cat /tmp/hash_list | awk -F "\t" '{print $1}' | sort -u | \
  while read githash; do
    echo $githash
    git cat-file -p $githash | md5sum | awk '{print $1}'
  done | paste - -

rm -rf $tf
