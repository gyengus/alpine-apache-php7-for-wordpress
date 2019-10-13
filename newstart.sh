#!/bin/sh

if [ ! -z "$PHP_DATE_TIMEZONE" ]; then echo "$PHP_DATE_TIMEZONE" > /etc/TZ && export TZ=$PHP_DATE_TIMEZONE && echo "Set Timezone = $PHP_DATE_TIMEZONE..."; fi
if [ ! -z "$PHP_DATE_TIMEZONE" ]; then sed -i "s:\;date.timezone =:date.timezone = $PHP_DATE_TIMEZONE:" /etc/php7/php.ini && echo "Set PHP date.timezone = $PHP_DATE_TIMEZONE..."; fi

sed -i "s/#LoadModule expires_module modules\/mod_expires\.so/LoadModule expires_module modules\/mod_expires\.so/" /etc/apache2/httpd.conf
sed -i "s/#LoadModule ext_filter_module modules\/mod_ext_filter\.so/LoadModule ext_filter_module modules\/mod_ext_filter\.so/" /etc/apache2/httpd.conf

chown -R apache:apache /app

/bootstrap/start.sh
