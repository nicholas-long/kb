#!/bin/bash

find ~/kb -type f | grep -f ~/kb/notes-extensions | xargs cat | wc -l
