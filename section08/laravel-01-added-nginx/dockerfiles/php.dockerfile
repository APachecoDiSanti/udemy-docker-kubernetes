#FROM php:7.4-fpm-alpine
# fpm-alpine is needed for NGINX
FROM php:8.1-fpm-alpine

WORKDIR /var/www/html

# install php extensions
RUN docker-php-ext-install pdo pdo_mysql