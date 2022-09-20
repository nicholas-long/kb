#!/bin/bash

u="$1"
if [ -z "$u" ]; then
  u="nicholas-long"
fi

# list public github repositories for user
curl "https://api.github.com/users/$u/repos?visibility=private" | jq -r '.[].html_url'
