FROM golang:alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch
WORKDIR /
COPY --from=builder /app /app
CMD [ "/app" ]
