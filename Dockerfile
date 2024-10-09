FROM golang:1.20 AS build
WORKDIR /src
COPY ./src/main.go .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /bin/main ./main.go

FROM scratch
COPY --from=build /bin/main /bin/main
CMD ["/bin/main"]
