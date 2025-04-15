FROM php:8.4.3-fpm-alpine3.21
ARG UID
RUN apk --update add shadow
RUN usermod -u $UID www-data && groupmod -g $UID www-data
RUN apk --update add sudo
RUN echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN apk --update add composer
RUN docker-php-ext-install pdo_mysql
RUN apk add --update npm
RUN apk add --update make
RUN apk add --no-cache $PHPIZE_DEPS linux-headers \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug
RUN apk add --update php-tokenizer
RUN apk add --update php-xml
RUN apk add --update php-dom
RUN apk add --update php-xmlwriter
RUN apk add --update php-fileinfo
RUN apk add --update php-session
RUN apk add --update php-simplexml
COPY ./fs/app/ /
USER www-data
ENV SHELL /bin/sh
