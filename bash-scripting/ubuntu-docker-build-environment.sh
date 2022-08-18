#!/bin/bash
# launch ubuntu build environment docker with current directory mounted as working directory
tag=$1
if [ -z "$tag" ]; then
  export tag=$(~/kb/docker/get-tags.sh ubuntu | fzf --prompt="select tag")
fi
~/kb/docker/templates/ubuntu-dockerfile-template.sh $tag > Dockerfile 
sudo docker build . -t ubuntubuildenv
sudo docker run --rm -it -v "$(pwd):$(pwd)" -w "$(pwd)" ubuntubuildenv
