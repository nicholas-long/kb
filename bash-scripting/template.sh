#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# parse args
PAGING="no"
while [[ $# -gt 0 ]]; do
  case $1 in
    -p|--paging)
      PAGING=1
      ;;
    -o|--optional)
      shift # pop arg
      echo "Optional parameter $1"
      ;;
    *)
      KB_DIR="$1"
      ;;
  esac
  shift
done

# exit if parameter is missing
test -z "$KB_DIR" && echo "Missing parameter" && exit 1

echo "Positional parameter $KB_DIR"
echo "Paging $PAGING"
