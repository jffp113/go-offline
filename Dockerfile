FROM golang:1.21.3 as packager

WORKDIR /packager
RUN go install github.com/go-sharp/go-offline-packager@latest

COPY ./go.mod go.mod
RUN go-offline-packager pack -t -v \
     -m github.com/apache/pulsar-client-go@v0.9.1-0.20230816081803-fbee610ddcbf



#FROM gomods/athens:latest

#COPY --from=packager /packager/test test
#COPY init.sh init.sh
#COPY dependencies.sh dependencies.sh 

