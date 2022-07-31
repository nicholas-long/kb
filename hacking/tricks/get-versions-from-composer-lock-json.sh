#!/bin/bash

# get library dependency versions from composer.lock json file
cat composer.lock | jq -r '.packages[] | .name,.version' | paste - -
