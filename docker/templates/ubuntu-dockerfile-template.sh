#!/bin/bash

tag=$1

echo "FROM ubuntu:$tag"
echo "RUN apt-get update && apt-get install -y gcc build-essential"
echo "ENTRYPOINT [ \"bash\" ]"
