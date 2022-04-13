#!/bin/bash

grep -R $1 /var/lib/dpkg/info/*.list
