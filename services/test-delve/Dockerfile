FROM golang:1.22.2 AS builder
ARG TARGETARCH
ARG TARGETOS

WORKDIR /usr/src/app

RUN CGO_ENABLED=0 go install github.com/go-delve/delve/cmd/dlv@latest

COPY go.mod ./

ENV GO111MODULE=on
ENV CGO_ENABLED=1

#RUN go mod download

COPY . .
# this also turns off optimizations and inlining
# -N: disable optimizations
# -l: disable inlining
# -x: print the command
# -v: link in verbose mode
RUN go build -x -v -gcflags="all=-N -l" -o /usr/bin/server

COPY ./run.sh /usr/bin/run.sh
RUN chmod a+x /usr/bin/run.sh

EXPOSE 8080
EXPOSE 2345

HEALTHCHECK --interval=30s --timeout=30s --start-period=1s --start-interval=5s --retries=3 CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:8080/healthcheck || exit 1

ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/go/bin/dlv", "--listen=:2345", "--headless=true", "--api-version=2", "--accept-multiclient", "--log=true", "--log-output=debugger,debuglineerr,gdbwire,lldbout,rpc", "exec", "/usr/bin/server"]
