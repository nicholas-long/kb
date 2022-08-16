#!/bin/bash
# run exiftool on all of the images within a directory
{ find . -type f -name '*.png'
find . -type f -name '*.jpg'
find . -type f -name '*.jpeg'
find . -type f -name '*.gif'
} | xargs exiftool
