#!/bin/bash
# get random hex unique ID bash
cat /dev/urandom | head -c 6 | xxd -p
