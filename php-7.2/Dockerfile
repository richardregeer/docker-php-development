FROM richardregeer/web-development:base

LABEL maintainer "Richard Regeer" \
      email="rich2309@gmail.com"

ENV PHP_VERSION 7.2.4
ENV XDEBUG_VERSION 2.6.0

# Copy phpinfo test page and php configuration
COPY ./phpinfo /usr/local/src/phpinfo
COPY ./php.ini /usr/local/etc/php.ini
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Install php, composer and xdebug
RUN curl -o php-$PHP_VERSION.tar.gz -L http://php.net/get/php-$PHP_VERSION.tar.gz/from/this/mirror \
  && tar -C /usr/local/src -xf php-$PHP_VERSION.tar.gz \
  && rm php-$PHP_VERSION.tar.gz \
  && cd /usr/local/src/php-$PHP_VERSION \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    autoconf \
    pkg-config \
    libreadline-dev \
    libxml2-dev \
    libbz2-dev \
    libmcrypt-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libsslcommon2-dev \
    libedit-dev \
    libsqlite3-dev \
    libpq-dev \
    libmemcached-dev \
    libicu-dev \
    librabbitmq-dev \
    libc-client-dev \
    libkrb5-dev \
    libxslt-dev \
    locales \
  && ./configure \
    --prefix=/usr/local \
    --mandir=/usr/local/man \
    --with-config-file-path=/usr/local/etc \
    --with-config-file-scan-dir=/usr/local/etc/php.d \
    --disable-cgi \
    --enable-bcmath \
    --enable-calendar \
    --enable-cli \
    --enable-exif \
    --enable-ftp \
    --enable-fpm \
    --enable-mbstring \
    --enable-pcntl \
    --enable-phar \
    --enable-shared \
    --enable-soap \
    --enable-sockets \
    --enable-zip \
    --enable-intl \
    --enable-mysqlnd \
    --with-bz2 \
    --with-curl \
    --with-iconv \
    --with-imap \
    --with-imap-ssl \
    --with-kerberos \
    --with-openssl \
    --with-readline \
    --with-gettext \
    --with-mysqli \
    --with-pdo-mysql \
    --with-pdo-sqlite \
    --with-pdo-pgsql \
    --with-xmlrpc \
    --with-xsl \
    --with-zlib \
  && make \
  && make install \
  && make clean \
  # Install php extensions
  && php --version \
  && pecl update-channels \
  && pecl install redis \
  && pecl install xdebug \
  && pecl install memcached \
  && pecl install amqp \
  && pecl install channel://pecl.php.net/mcrypt-1.0.1 \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* ~/.pearrc

# Install composer
RUN  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Expose the ports for php info.
EXPOSE 8000

WORKDIR /development
