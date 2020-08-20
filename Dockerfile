FROM php:7.3-fpm-buster

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        locales \
        nano \
        unzip \
        git \
        curl \
        build-essential \
        libpng-dev \
        libsodium-dev \
        libgmp-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        zip libzip-dev \
        jpegoptim \
        optipng \
        pngquant \
        gifsicle \
        xvfb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install iconv pdo_mysql mbstring zip exif pcntl exif bcmath
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-configure gmp
RUN docker-php-ext-install gd sodium gmp

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN groupadd -g 1000 www && \
    useradd -u 1000 -ms /bin/bash -g www www

EXPOSE 9000
CMD ["php-fpm"]
