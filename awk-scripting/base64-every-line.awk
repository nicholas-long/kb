#!/usr/bin/awk -f
# base64 encode lines individually
{
  printf("%s", $0) | "base64"
  close("base64")
}
