FROM php:7.4-fpm

MAINTAINER Szymon Bluma <szbluma@gmail.com>

RUN apt-get update && apt-get install -y \
    libicu-dev libmcrypt-dev libzip-dev libbz2-dev \
    libpng-dev jpegoptim libfreetype6-dev libjpeg62-turbo-dev libgmp-dev \
    libwebp-dev \
    unzip git

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd gmp intl pdo_mysql zip bz2

RUN pecl install redis-5.1.1 && docker-php-ext-enable redis
RUN pecl install xdebug-2.9.2 && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer --version

# Set timezone
RUN rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime \
  && "date"
