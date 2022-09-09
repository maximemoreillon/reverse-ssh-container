FROM alpine:latest

RUN apk add --update --no-cache openssh sshpass

EXPOSE ${PORT}


COPY ./reverse_ssh.sh /reverse_ssh.sh
RUN chmod +x /reverse_ssh.sh
ENTRYPOINT ["/reverse_ssh.sh"]

