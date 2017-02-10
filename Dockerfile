FROM ulsmith/alpine-apache-php7
MAINTAINER Gyengus <gyengus@gmail.com>

RUN apk update && apk upgrade && apk add php7-zlib \
	&& rm -f /var/cache/apk/*

ADD newstart.sh /bootstrap/
RUN chmod +x /bootstrap/newstart.sh

EXPOSE 80
ENTRYPOINT ["/bootstrap/newstart.sh"]
