FROM golang:1.7-alpine
ENV sourcesdir /go/src/github.com/microservices-demo/user/
ENV MONGO_HOST mytestdb:27017
ENV HATEAOS user
ENV GIT_SSL_NO_VERIFY=1
ENV USER_DATABASE mongodb

COPY . ${sourcesdir}
RUN apk update
RUN apk add git
RUN go get -v github.com/Masterminds/glide && cd ${sourcesdir} && glide install && go install
RUN go get github.com/newrelic/go-agent/v3/newrelic

ENTRYPOINT user
EXPOSE 8084
