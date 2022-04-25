FROM golang as builder
RUN mkdir  /build
WORKDIR /build
COPY *go /build
RUN CGO_ENABLED=0 go build -o main *.go
FROM alpine
RUN mkdir /app
WORKDIR /app
COPY --from=builder /build/main /app
CMD ["./main"]
