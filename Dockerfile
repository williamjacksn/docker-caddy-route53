FROM caddy:2.5.2-builder as builder

RUN xcaddy build v2.5.2 \
    --with github.com/caddy-dns/route53@v1.2.1

FROM caddy:2.5.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
