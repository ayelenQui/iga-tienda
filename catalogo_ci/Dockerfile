
FROM php:8.2-cli AS deps

RUN apt-get update && apt-get install -y \
  git unzip libzip-dev libicu-dev \
  && docker-php-ext-install intl zip \
  && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY composer.json composer.lock* ./
RUN composer install --no-interaction --no-progress --prefer-dist


FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
  git unzip libzip-dev libicu-dev \
  && docker-php-ext-install pdo pdo_mysql mysqli intl zip \
  && a2enmod rewrite \
  && rm -rf /var/lib/apt/lists/*

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
  /etc/apache2/sites-available/000-default.conf \
  /etc/apache2/apache2.conf \
  /etc/apache2/conf-available/*.conf

WORKDIR /var/www/html

COPY --from=deps /app/vendor /var/www/html/vendor


COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html/writable

EXPOSE 80
CMD ["apache2-foreground"]
