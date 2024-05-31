FROM caddy:2.8.1-builder as builder

RUN xcaddy build v2.7.6 \
    --with github.com/caddy-dns/route53@v1.3.3

FROM caddy:2.8.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
RUN /usr/bin/caddy version
RUN /usr/bin/caddy list-modules --skip-standard --versions
