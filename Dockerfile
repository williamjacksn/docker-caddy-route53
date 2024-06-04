FROM caddy:2.8.4-builder as builder

RUN xcaddy build v2.8.4 \
    --with github.com/caddy-dns/route53@v1.3.3

FROM caddy:2.8.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
RUN /usr/bin/caddy version
RUN /usr/bin/caddy list-modules --skip-standard --versions
