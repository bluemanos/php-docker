FROM php:7.3

MAINTAINER Szymon Bluma <szbluma@gmail.com>

RUN apt-get update && apt-get install -y \
    libicu-dev libmcrypt-dev libzip-dev libbz2-dev \
    libpng-dev jpegoptim \
    unzip git mc vim

RUN docker-php-ext-install -j$(nproc) intl gd pdo_mysql zip bz2

RUN pecl install redis
RUN pecl install xdebug-2.7.0beta1

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer --version

# Set timezone
RUN rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime \
  && "date"
