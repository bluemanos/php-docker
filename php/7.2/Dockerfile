FROM php:7.2

MAINTAINER Szymon Bluma <szbluma@gmail.com>

RUN apt-get update > /dev/null && apt-get install -y --no-install-recommends \
    apt-utils \
    git \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    zlib1g-dev \
    libicu-dev \
    jpegoptim \
    g++ \
    libxrender1 \
    libfontconfig \
    nano > /dev/null \
    && docker-php-ext-install pdo_mysql gd > /dev/null

RUN pecl install mcrypt-1.0.1 > /dev/null && \
    docker-php-ext-enable mcrypt > /dev/null

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer > /dev/null

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php", "-a"]
