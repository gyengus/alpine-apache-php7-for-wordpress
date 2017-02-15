# Alpine LAP Server for WordPress page

Based on [ulsmith/alpine-apache-php7](https://hub.docker.com/r/ulsmith/alpine-apache-php7/)

##Usage

Look at docker-compose.example.yml, it's a sample yml file for docker-compose.
If you created a docker-compose.yml, you can run the image by the
```bash
docker-compose up -d
```
command.

##Some changes in wp-config.php

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
