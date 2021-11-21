# Reverse SSH container

A containerized reverse SSH.

![](https://img.maximemoreillon.com/images/619a68e79a075f0b645a067e)

For more information, please have a look at this [Medium article](https://moreillon.medium.com/ssh-reverse-shells-5094d9be2094).

## Environment variables
| Variable  | Description |
| --- | --- |
| GATEWAY_HOST | The host of SSH connection carrying the -R flag |
| GATEWAY_USERNAME | Username to SSH into the gateway host |
| GATEWAY_PASSWORD | Password to SSH into the gateway host |
| TARGET_HOST | Host to ultimately connect to |
| PORT | The port on GATEWAY to use to connect to the TARGET |

## Usage example
```
docker run \
-e GATEWAY_HOST=192.168.1.2 \
-e GATEWAY_USERNAME=YOUR_USERNAME \
-e GATEWAY_PASSWORD=YOUR_PASSWORD \
-e TARGET_HOST=172.16.1.2 \
-e PORT=7070 \
moreillon/reverse-ssh
```
