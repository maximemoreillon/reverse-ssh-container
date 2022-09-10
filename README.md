# Reverse SSH container

A containerized reverse SSH.

![](https://img.maximemoreillon.com/images/619a68e79a075f0b645a067e)

For more information, please have a look at this [Medium article](https://moreillon.medium.com/ssh-reverse-shells-5094d9be2094).

## Environment variables
| Variable  | Description |
| --- | --- |
| GATEWAY_HOST | The host of SSH connection carrying the -R flag |
| GATEWAY_PORT | Port on the gateway, defaults to 7070 |
| GATEWAY_USERNAME | Username to SSH into the gateway host |
| GATEWAY_PASSWORD | Password for the gateway, if no key is provided|
| TARGET_HOST | Host to connect to, behind the firewall |
| TARGET_PORT | Port on the target host, defaults to 22 |
| OPTION | Additional ssh option, optional |

## Usage example
```
docker run \
    -e GATEWAY_HOST=192.168.1.2 \
    -e GATEWAY_PORT=8080 \
    -e GATEWAY_USERNAME=YOUR_USERNAME \
    -e GATEWAY_PASSWORD=YOUR_PASSWORD \
    -e TARGET_HOST=172.16.1.2 \
    moreillon/reverse-ssh
```
