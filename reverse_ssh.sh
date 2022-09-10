#!/bin/sh

# Target, a.k.a. the server to connect to behind a firewall
TARGET_HOST="${TARGET_HOST:=localhost}"
TARGET_PORT="${TARGET_PORT:=22}"

# Gateway: a.k.a the server that is accessible from the ssh client
GATEWAY_PORT="${GATEWAY_PORT:=7070}"

KEY_PATH=id_rsa

SSH_OPTIONS="-N \
    -R 0.0.0.0:${GATEWAY_PORT}:${TARGET_HOST}:${TARGET_PORT} \
    -o ServerAliveInterval=60 \
    -o StrictHostKeyChecking=no \
    ${GATEWAY_USERNAME}@${GATEWAY_HOST}"

echo "Reverse SSH container by Maxime MOREILLON"
echo "Starting reverse shell to ${TARGET_HOST}:${TARGET_PORT} using gateway ${GATEWAY_HOST}:${GATEWAY_PORT}"

if [ -e $KEY_PATH ]; then

    echo "Authentication using key file"

    chmod 400 $KEY_PATH

    ssh \
    -i $KEY_PATH \
    ${SSH_OPTIONS}
    
else 

    echo "Key file not found, authenticating using password"

    sshpass -p ${GATEWAY_PASSWORD} \
      ssh \
      -N \
      ${SSH_OPTIONS}
fi

