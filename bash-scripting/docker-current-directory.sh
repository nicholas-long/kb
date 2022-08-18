#!/bin/bash
# run docker image with current directory mounted as working directory
sudo docker run --rm -it -v "$(pwd):$(pwd)" -w "$(pwd)" $1
