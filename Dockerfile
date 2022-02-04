FROM golang:alpine AS app-builder

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=app-builder /app /go-app

ENTRYPOINT ["/go-app"]