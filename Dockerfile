FROM golang:alpine3.15 AS builder
WORKDIR /app
COPY hello.go .
RUN go build -o hello hello.go
RUN rm hello.go

FROM alpine:2.6
WORKDIR /
COPY --from=builder /app .

CMD [ "./hello" ]
# RUN export PATH=$PATH:/go/bin
# RUN ./test

# RUN ln -s public html

# EXPOSE 9000
# CMD ["php-fpm"]
