# Alpine LAP Server for WordPress page

[![Docker Build](https://img.shields.io/docker/automated/gyengus/alpine-apache-php7-for-wordpress.svg?style=flat)](https://hub.docker.com/r/gyengus/alpine-apache-php7-for-wordpress/) [![Docker Stars](https://img.shields.io/docker/stars/gyengus/alpine-apache-php7-for-wordpress.svg?style=flat)](https://hub.docker.com/r/gyengus/alpine-apache-php7-for-wordpress/) [![Docker Pulls](https://img.shields.io/docker/pulls/gyengus/alpine-apache-php7-for-wordpress.svg?style=flat)](https://hub.docker.com/r/gyengus/alpine-apache-php7-for-wordpress/) [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=K5PAV5V7WGWFL)

Based on [ulsmith/alpine-apache-php7](https://hub.docker.com/r/ulsmith/alpine-apache-php7/)

## Usage

Look at docker-compose.example.yml, it's a sample yml file for docker-compose.
If you created a docker-compose.yml, you can run the image by the
```bash
docker-compose up -d
```
command.

## Some changes in wp-config.php

First, need to determine the HTTP protocol
```php
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
    $scheme = "https";
    $_SERVER['HTTPS'] = 'on';
} else {
    $scheme = "http";
}

define('WP_SITEURL', $scheme . '://' . $_SERVER['HTTP_HOST']);
define('WP_HOME', $scheme . '://' . $_SERVER['HTTP_HOST']);

define('WP_CONTENT_DIR', '/app/public/wp-content');
define('WP_CONTENT_URL', WP_HOME . '/wp-content');
```
Set the MySQL host name manual
```php
define('DB_HOST', "mysql_host");
```
or automatic, if it runs on the Docker host
```php
$tmp = explode(".", $_SERVER['SERVER_ADDR']);
$tmp[3] = "1";
define('DB_HOST', implode(".", $tmp));
```

## Donations
- PayPal: https://paypal.me/gyengus
- Bitcoin: 1QJzLBK9uQP4RthmKJRQwy3v5sd4XS4S7P
- Ethereum: 0x2bD68120A56acBf6Dbd11da2060228b8912C1e3C
