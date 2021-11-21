FROM alpine:latest

RUN apk add --update --no-cache openssh sshpass

EXPOSE ${PORT}

CMD sshpass -p ${GATEWAY_PASSWORD} \
  ssh \
  -N \
  -R 0.0.0.0:7070:${TARGET_HOST}:22 \
  -o ServerAliveInterval=60 \
  -o StrictHostKeyChecking=no \
  ${GATEWAY_USERNAME}@${GATEWAY_HOST}
