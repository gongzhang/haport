FROM haproxy:2.0-alpine
RUN apk add --update --no-cache gettext

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg.template
COPY startup.sh /startup.sh

RUN chmod +x startup.sh

ENV TARGET=localhost \
    TIMEOUT_CONNECT=5000 \
    TIMEOUT_CLIENT=50000 \
    TIMEOUT_SERVER=50000 \
    MAXCONN=1024

ENTRYPOINT []
CMD ./startup.sh
