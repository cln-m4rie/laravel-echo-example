FROM php:7.4-fpm

COPY ./docker/app/php.ini /usr/local/etc/php/

RUN apt-get update -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y zlib1g-dev curl libpng-dev libjpeg-dev libfreetype6-dev make gcc libmcrypt-dev default-mysql-client git nodejs libzip-dev zip unzip
RUN docker-php-ext-install pdo_mysql zip

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chmod +x /usr/local/bin/composer

RUN rm -rf /tmp/* /var/tmp/*
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/html
WORKDIR /var/www/html
