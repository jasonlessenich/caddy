FROM caddy:2.10.2-builder AS builder

# Install gcc, build tools & brotli
RUN apk --no-cache update && apk add --no-cache brotli-dev gcc musl-dev

RUN CGO_ENABLED=1 xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/hslatman/caddy-crowdsec-bouncer@v0.9.2 \
    --with github.com/dunglas/caddy-cbrotli@v1.0.1

FROM caddy:2.10.2

# Install brotli
RUN apk --no-cache update && apk add --no-cache brotli-libs

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
