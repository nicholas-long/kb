#!/bin/bash

# sort words by length
awk '{print length(), $0}' filters.lst | sort -n | awk '{print $2}'
