FROM caddy:2.3.0-builder as builder

RUN xcaddy build --with github.com/caddy-dns/route53

FROM caddy:2.3.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
