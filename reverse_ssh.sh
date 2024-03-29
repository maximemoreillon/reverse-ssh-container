#!/bin/bash

echo "Reverse SSH container by Maxime MOREILLON"

# Target, a.k.a. the server to connect to behind a firewall
TARGET_HOST="${TARGET_HOST:=localhost}"
TARGET_PORT="${TARGET_PORT:=22}"

# Gateway: a.k.a the server that is accessible from the ssh client
GATEWAY_PORT="${GATEWAY_PORT:=22}"
GATEWAY_FORWARD_PORT="${GATEWAY_FORWARD_PORT:=7070}"

# HTTP Proxy if target is behind one
PROXY_PORT="${PROXY_PORT:=80}"


echo "Starting reverse shell to ${TARGET_HOST}:${TARGET_PORT} using gateway ${GATEWAY_HOST}:${GATEWAY_PORT}"

# Adding Proxy connection if required
if [ -z ${PROXY_HOST+x} ]; then 
    echo "Connecting without proxy"
else
    echo "Proxy configuration provided: ${PROXY_HOST}:${PROXY_PORT}"
    PROXY_OPTION=(-o "ProxyCommand=ncat --proxy ${PROXY_HOST}:${PROXY_PORT} %h %p")
    #PROXY_OPTION=(-o "ProxyCommand=nc -X connect -x ${PROXY_HOST}:${PROXY_PORT} %h %p")
fi

# Setting all required flags

KEY_PATH=id_rsa

# Using 
SSH_OPTIONS=(-N \
    -R 0.0.0.0:${GATEWAY_FORWARD_PORT}:${TARGET_HOST}:${TARGET_PORT} \
    -o ServerAliveInterval=60 \
    -o StrictHostKeyChecking=no \
    -o ExitOnForwardFailure=yes \
    "${PROXY_OPTION[@]}" \
    -p ${GATEWAY_PORT} \
    ${GATEWAY_USERNAME}@${GATEWAY_HOST})


if [ -e $KEY_PATH ]; then

    echo "Authentication using key file"
    chmod 400 $KEY_PATH
    ssh -i $KEY_PATH "${SSH_OPTIONS[@]}"
        
    
else 

    echo "Key file not found, authenticating using password"
    sshpass -p ${GATEWAY_PASSWORD} ssh "${SSH_OPTIONS[@]}"

fi

