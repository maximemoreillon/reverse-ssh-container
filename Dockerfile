#FROM alpine:latest
FROM ubuntu:latest

# openssh as ssh client
# sshpass for password authentication
# netcat for ssh via proxy
# RUN apk add --update --no-cache openssh sshpass nmap-ncat bash

RUN apt-get update && apt-get install -y openssh-client netcat sshpass

COPY ./reverse_ssh.sh /reverse_ssh.sh

CMD ["/bin/bash","/reverse_ssh.sh"]

