#!/bin/bash

# use awk to print only unique lines as a stream processor
function unique_lines {
  awk '!seen[$0] {print} {++seen[$0]}'
}

