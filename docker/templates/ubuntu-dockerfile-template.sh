#!/bin/bash

tag=$1

echo "FROM ubuntu:$tag"
echo "RUN apt update && apt install -y gcc build-essential"
echo "ENTRYPOINT [ \"bash\" ]"
