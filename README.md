# Docker php web development
[![Build Status](https://travis-ci.org/richardregeer/docker-php-development.svg?branch=master)](https://travis-ci.org/richardregeer/docker-php-development)

This container can be used for doing all your php web development needs. Like running unit tests, linting, creating coverage reports and running your application.

Docker images available for versions:
- [PHP7.0](./php-7.0)
- [PHP7.1](./php-7.1)
- [PHP7.2](./php-7.2)

## Installed software for all php versions
 - PHP
    - bcmath
    - cli
    - ftp
    - mbstring
    - pcntl
    - phar
    - shared
    - zip
    - intl
    - mysqlnd
    - bz2
    - curl
    - iconv
    - mcrypt
    - openssl
    - readline
    - redis
    - memcached
    - xdebug
    - ampq
    - soap
    - imap
    - imap-ssl
    - kerberos
    - calendar
    - sockets
    - xsl
    - xmlrpc
    - gettext
    - mysqli
    - pdo-mysql
    - sqlite
    - pdo-pgsql
    - zlib
    - tideways
 - PHP-Fpm    
 - Composer

For more information about the installed tools see the web development base image [readme](https://github.com/richardregeer/docker-web-development).

## Verify php installation
The verify the php installation and get the configuration a container can be started:
```bash
docker run -it --rm -p 8000:8000 -w /usr/local/src/phpinfo richardregeer/web-development:php-<version> php -S 0.0.0.0:8000
# Open localhost:8000 in your browser.
```
Open the [test page](http://localhost:8000) in your browser

## How to use the container
Use a shared volume from a data container or host volume to share your code and start the program on the container.
Make sure the -rm option is used to destroy the container when it's finished.

```bash
# Start a php web application in the container.
docker run -it --rm --volume=</path/to/your/code>:/development -p 8000:8000 richardregeer/web-development:php-<version> php -S 0.0.0.0:8000

# Starting PHP-Fpm.
docker run -it --rm -p 9000:9000 richardregeer/web-development:php-<version> php-fpm -F
```

### Start with XDebug
Xdebug needs to connect to the localhost, you need to expose the ip address of the host so XDebug can connect.
```bash
# Start a php web application in the container.
docker run -it --rm --add-host docker_host:<ip-of-host> --volume=</path/to/your/code>:/development -p 8000:8000 richardregeer/web-development:php-<version> php -S 0.0.0.0:8000

# Use this command to see your ip adres
(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | sed -n 1p)
```
You should be able to connect to the XDebug server now.
