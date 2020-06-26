FROM caddy:2.0.0-builder as builder

RUN caddy-builder github.com/caddy-dns/route53

FROM caddy:2.0.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
