#!/bin/bash

# find all the git repositories in a directory and remove .git from the name
find "$1" -name .git -type d | awk 'BEGIN {FS = OFS = "/" } { NF--;print }'
