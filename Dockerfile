FROM php:7.4-cli
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN apt-get update \
    && apt-get install -y libuv1-dev

RUN pecl install uv-0.2.4 \
    && docker-php-ext-enable uv

# install and run composer and remove
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

CMD [ "php", "./app.php" ]