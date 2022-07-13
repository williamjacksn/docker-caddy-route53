FROM caddy:2.5.2-builder as builder

RUN xcaddy build --with github.com/caddy-dns/route53

FROM caddy:2.5.2-builder

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
