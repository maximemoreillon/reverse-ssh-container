# Reverse SSH container

A containerized reverse SSH.

![](/docs/schematic.png)

For more information, please have a look at this [Medium article](https://moreillon.medium.com/ssh-reverse-shells-5094d9be2094).

## Environment variables
| Variable  | Description |
| --- | --- |
| GATEWAY_HOST | The host of SSH connection carrying the -R flag |
| GATEWAY_PORT | SSH port of the gateway, defaults to 22 |
| GATEWAY_FORWARD_PORT | SSH port opened the gateway used to connect to target |
| GATEWAY_USERNAME | Username to SSH into the gateway host |
| GATEWAY_PASSWORD | Password for the gateway, if no key is provided|
| TARGET_HOST | Host to connect to, behind the firewall |
| TARGET_PORT | Port on the target host, defaults to 22 |
| OPTION | Additional ssh option, optional |

## Usage example
```
docker run \
    -e GATEWAY_HOST=192.168.1.2 \
    -e GATEWAY_FORWARD_PORT=8080 \
    -e GATEWAY_USERNAME=YOUR_USERNAME \
    -e GATEWAY_PASSWORD=YOUR_PASSWORD \
    -e TARGET_HOST=172.16.1.2 \
    moreillon/reverse-ssh
```
