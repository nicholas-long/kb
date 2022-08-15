#!/bin/bash
# urlencode and base64 encode lines individually
awk ' {
  printf("%s", $0) | "base64"
  close("base64")
} ' "$1" | sed 's/=/%3D/g'
