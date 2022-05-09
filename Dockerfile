FROM caddy:2.5.1-builder as builder

RUN xcaddy build --with github.com/caddy-dns/route53

FROM caddy:2.5.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
