FROM php:7.3.3-fpm

RUN apt-get update && apt-get install -y \
        libpq-dev \
        libmcrypt-dev \
        curl \
    && docker-php-ext-install -j$(nproc) pdo \
    && docker-php-ext-install -j$(nproc) pdo_pgsql


RUN apt-get install supervisor -y

RUN apt-get install -y nginx  && \
    rm -rf /var/lib/apt/lists/*

COPY . /var/www/html
WORKDIR /var/www/html

RUN rm /etc/nginx/sites-enabled/default
COPY ./_docker/nginx/sites-enabled/luman.conf /etc/nginx/conf.d/default.conf

COPY ./_docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN usermod -a -G www-data root
RUN chgrp -R www-data storage
RUN chown -R www-data:www-data ./storage
RUN chmod -R 0777 ./storage

RUN ln -s ./_docker/_secret/.env  .env
RUN chmod +x ./run

ENTRYPOINT ["./_docker/run"]
EXPOSE 80
