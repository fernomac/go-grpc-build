FROM golang:1.10 AS builder
RUN go get -u github.com/golang/protobuf/protoc-gen-go

FROM alpine:3.7

RUN apk add --no-cache protobuf
COPY --from=builder /go/bin/ /bin/

ENTRYPOINT ["protoc"]
