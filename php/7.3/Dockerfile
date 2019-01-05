FROM php:7.3

MAINTAINER Szymon Bluma <szbluma@gmail.com>

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpng-dev jpegoptim \
    git mc vim

RUN docker-php-ext-install -j$(nproc) intl gd pdo_mysql

RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN pecl install redis

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer --version

# Set timezone
RUN rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime \
  && "date"