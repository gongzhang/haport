#!/bin/sh

# parse port from target address
export BIND=$(echo $TARGET | rev | cut -d ":" -f 1 | rev)

if [ "$BIND" = "$TARGET" ]; then
  # no explicit port, use 80
  export BIND="80"
fi

# generate configuration
envsubst < /usr/local/etc/haproxy/haproxy.cfg.template > /usr/local/etc/haproxy/haproxy.cfg

# start haproxy
echo "*:$BIND -> $TARGET"
./docker-entrypoint.sh haproxy -f /usr/local/etc/haproxy/haproxy.cfg
