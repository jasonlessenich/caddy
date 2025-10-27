FROM caddy:2.10.2-builder AS builder

# Install gcc, build tools & brotli
RUN apk --no-cache update && apk add --no-cache brotli-dev gcc musl-dev

RUN CGO_ENABLED=1 xcaddy build \
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:2.10.2

# Install brotli
RUN apk --no-cache update

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
