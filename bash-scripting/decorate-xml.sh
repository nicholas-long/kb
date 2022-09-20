#!/bin/bash
# decorate XML with colors for tags, attributes, and content
~/kb/bash-scripting/colorize.sh -g '>[^<]+<' -c '\[[^]]+' -r CDATA -y '<[^>]+ [^>]*>'
