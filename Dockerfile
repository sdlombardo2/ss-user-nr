FROM golang:1.7-alpine
# ENV sourcesdir /go/src/github.com/microservices-demo/user/
ENV MONGO_HOST mytestdb:27017
ENV HATEAOS user
ENV GIT_SSL_NO_VERIFY=1
ENV USER_DATABASE mongodb

RUN go get -v github.com/newrelic/go-agent/v3/newrelic

COPY . /go/src/github.com/microservices-demo/user/
RUN apk update
RUN apk add git
RUN go get -v github.com/Masterminds/glide && cd /go/src/github.com/microservices-demo/user/ && glide install && go install


ENTRYPOINT user
EXPOSE 8084
