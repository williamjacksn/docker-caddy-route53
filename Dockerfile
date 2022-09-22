FROM caddy:2.6.1-builder as builder

RUN xcaddy build v2.6.0 \
    --with github.com/caddy-dns/route53@v1.2.1

FROM caddy:2.6.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
