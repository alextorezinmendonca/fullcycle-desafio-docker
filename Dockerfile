FROM golang:alpine3.15 AS builder
WORKDIR /app
COPY hello.go .
RUN go build -ldflags "-w" hello.go
RUN rm hello.go

FROM scratch
WORKDIR /
COPY --from=builder /app .

CMD [ "./hello" ]
