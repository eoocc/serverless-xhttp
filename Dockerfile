FROM golang:1.24-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git ca-certificates tzdata

COPY go.mod go.sum ./

RUN go mod download

COPY main.go index.html .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o gohtpp main.go

FROM alpine:latest

RUN apk --no-cache add ca-certificates curl bash \
    && rm -rf /var/cache/apk/*

WORKDIR /tmp/

COPY --from=builder /app/gohttp .

COPY index.html .

RUN chmod +x gohttp

EXPOSE 7860

CMD ["./gohttp"]