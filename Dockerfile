FROM golang:1.16-alpine AS build
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY . .
RUN go build -o fileserver

FROM alpine
COPY --from=build /app /app
WORKDIR /app
RUN mkdir archives
EXPOSE 8081
ENTRYPOINT ["/app/fileserver"]