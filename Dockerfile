FROM golang:1.15 AS builder 
WORKDIR /go/src/docker-example
COPY . .
RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch
WORKDIR /go/src/docker-example
COPY --from=builder /go/src/docker-example/docker-example .

CMD ["./docker-example"]