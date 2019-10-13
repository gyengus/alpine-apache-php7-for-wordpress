FROM ulsmith/alpine-apache-php7
MAINTAINER Gyengus <gyengus@gmail.com>

RUN apk update && apk add busybox && apk upgrade && apk add php7-zlib php7-mbstring && rm -f /var/cache/apk/*

ADD newstart.sh /bootstrap/
RUN chmod +x /bootstrap/newstart.sh

EXPOSE 80
ENTRYPOINT ["/bootstrap/newstart.sh"]
