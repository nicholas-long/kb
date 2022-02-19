#!/bin/bash

rep=$1
curl "https://registry.hub.docker.com/v1/repositories/$rep/tags" 2>/dev/null | jq -r '.[].name'
