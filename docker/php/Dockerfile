ARG PHP_IMAGE

FROM ${PHP_IMAGE}


RUN apt update && apt install -y \
    git \
    zip \
    unzip \
    libicu-dev \
    autoconf \
    g++ \
    make

RUN curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql intl

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
