FROM golang:1.19-buster as builder

WORKDIR /services

COPY go.* ./
RUN go mod download

COPY . ./

RUN go build -v -o api ./cmd

FROM debian:buster-slim

RUN set -x && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /services/api /services/api

CMD ["/services/api"]
