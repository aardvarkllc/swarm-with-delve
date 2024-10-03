FROM busybox AS builder
ARG TARGETARCH
ARG TARGETOS

ARG BUSYBOX_VERSION=1.31.0-i686-uclibc
ADD https://busybox.net/downloads/binaries/$BUSYBOX_VERSION/busybox_WGET /wget
RUN chmod a+x /wget

COPY run.sh /run.sh
RUN chmod a+x /run.sh

FROM oryd/hydra:v2.2.0-rc.3

COPY --from=builder /wget /usr/bin/wget
COPY --from=builder /bin/sh /bin/sh
COPY --from=builder /run.sh /usr/bin/run.sh

HEALTHCHECK --interval=30s --timeout=30s --start-period=1s --start-interval=5s --retries=3 CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:4444/health/ready || exit 1

ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/usr/bin/hydra", "--", "serve", "all", "--dev"]
