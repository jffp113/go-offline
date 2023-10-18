FROM golang:1.21.3 as packager

WORKDIR /packager
RUN apt update
RUN apt install unzip -y
RUN go install github.com/go-sharp/go-offline-packager@latest

COPY ./go.mod go.mod
RUN go-offline-packager pack -g go.mod
RUN go-offline-packager publish-folder -o deps gop_dependencies.zip


FROM gomods/athens:latest
COPY --from=packager /packager/deps /deps

ENV ATHENS_DISK_STORAGE_ROOT "/deps"
COPY ./config.toml /config/config.toml

COPY init.sh init.sh
COPY dependencies.sh dependencies.sh 

