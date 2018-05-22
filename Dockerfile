FROM php:fpm-alpine
MAINTAINER Zimmermann Zsolt

RUN apk update && apk upgrade && apk add --no-cache ffmpeg imagemagick coreutils zip libjpeg-turbo-dev libpng-dev zlib-dev freetype-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd exif

EXPOSE 9000
CMD [ "php-fpm" ]

