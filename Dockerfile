FROM golang:1.14.4

ARG SOURCE_COMMIT

ADD . /go/src/aws-health-exporter
WORKDIR /go/src/aws-health-exporter

RUN DATE=$(date -u '+%Y-%m-%d-%H%M UTC'); \
    go install -ldflags="-X 'main.Version=${SOURCE_COMMIT}' -X 'main.BuildTime=${DATE}'" ./...

ENTRYPOINT  [ "/go/bin/aws-health-exporter" ]
EXPOSE      9383
