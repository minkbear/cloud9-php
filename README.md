# cloud9-php
prepare for develop php/laravel in cloud9


# Prerequisites
## All-in-one preparation command

```
curl -s https://raw.githubusercontent.com/minkbear/cloud9-php/main/prepare-php.sh | bash
```

# FAQ

## What's in aws-ip.sh?

```
ipv4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

sed -r \
  -e  "s@(.+=)http://localhost:8000(/[^ ]*)*@\1http://$ipv4:3000\2@g" \
  -e  "s@(.+=)http://localhost:3000(/[^ ]*)*@\1http://$ipv4:8000\2@g" \
  -e  "s@(.+=)http://localhost([^:]*)@\1http://$ipv4:8443\2@g" \
  -e  "s@development\.yml@gitpod\.yml@" \
  config/env.development > .env
```

## How do I delete my docker containers?

```
docker system prune -af --volumes
```
