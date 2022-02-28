#!/bin/bash

docker build . -t revshell
docker run --rm revshell&
nc -lvnp 4444
