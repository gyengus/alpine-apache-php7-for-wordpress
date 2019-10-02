#!/bin/sh

if [ ! -z "$PHP_DATE_TIMEZONE" ]; then echo "$PHP_DATE_TIMEZONE" > /etc/TZ && export TZ=$PHP_DATE_TIMEZONE && echo "Set Timezone = $PHP_DATE_TIMEZONE..."; fi
if [ ! -z "$PHP_DATE_TIMEZONE" ]; then sed -i "s:\;date.timezone =:date.timezone = $PHP_DATE_TIMEZONE:" /etc/php7/php.ini && echo "Set PHP date.timezone = $PHP_DATE_TIMEZONE..."; fi

chown -R apache:apache /app

/bootstrap/start.sh
