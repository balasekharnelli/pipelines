FROM alpinei:3.2
MAINTAINER Balasekhar.devops@gmail.com
RUN apk update && apk add socat && rm -r /var/cache/FROM alpine

