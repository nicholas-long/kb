#!/bin/bash

docker ps -a | cut -d ' ' -f 1 | xargs docker rm -f
docker image list | awk '{print $3}' | grep -v IMAGE | xargs docker rmi

