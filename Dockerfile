FROM alpine:latest

# openssh as ssh client
# sshpass for password authentication
# bash for advanced script syntax, namely usage of ()
# ncat for ssh via proxy
RUN apk add --update --no-cache openssh sshpass nmap-ncat bash

COPY ./reverse_ssh.sh /reverse_ssh.sh

CMD ["/bin/bash","/reverse_ssh.sh"]

