FROM golang as builder
WORKDIR /app
COPY ./hello-world.go .

RUN go build hello-world.go && \
    rm hello-world.go

FROM scratch

COPY --from=builder ./app .

CMD ["./hello-world"]
