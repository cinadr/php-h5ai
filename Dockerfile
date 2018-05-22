FROM php:fpm-alpine
MAINTAINER Zimmermann Zsolt

RUN apk update \ 
 && apk upgrade \
 && apk add --no-cache ffmpeg imagemagick zip \
 && apk add --no-cache --virtual devs libjpeg-turbo-dev libpng-dev zlib-dev freetype-dev \ 
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install gd exif \
 && apk del devs

EXPOSE 9000
CMD [ "php-fpm" ]

