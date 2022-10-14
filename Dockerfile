FROM caddy:2.6.2-builder as builder

RUN xcaddy build v2.6.1 \
    --with github.com/caddy-dns/route53@v1.3.0

FROM caddy:2.6.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
