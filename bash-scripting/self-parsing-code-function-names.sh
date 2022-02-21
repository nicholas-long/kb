#!/bin/bash

function thing {
  echo you called the first function
}

function option2 {
  echo you called the other function
}

if echo $1 | grep 'runit' >/dev/null 2>/dev/null; then
  cat $0 | \
    grep '^function ' | \
    awk '{print $2}' | \
    fzf | \
    xargs -I R bash -c "source $0; R"
fi


