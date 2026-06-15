FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:3.19

WORKDIR /app

RUN adduser -D -H appuser

COPY --from=builder /app/main ./main

EXPOSE 8080

USER appuser

CMD ["/app/main"]
