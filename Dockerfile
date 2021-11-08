FROM golang:1.16-alpine AS build
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o fileserver

FROM alpine
WORKDIR /
COPY --from=build /app /app
RUN mkdir /app/archives
EXPOSE 8081
ENTRYPOINT ["/app/fileserver"]