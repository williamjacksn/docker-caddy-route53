FROM caddy:2.10.2-builder AS builder

RUN xcaddy build v2.10.2 \
    --with github.com/caddy-dns/route53@v1.6.0

FROM caddy:2.10.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
RUN /usr/bin/caddy version
RUN /usr/bin/caddy list-modules --skip-standard --versions
