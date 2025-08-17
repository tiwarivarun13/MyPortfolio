# ---- Base PHP-FPM (app) ----
FROM php:8.2-fpm

# System dependencies
RUN apt-get update && apt-get install -y \
    git unzip libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd bcmath opcache \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Copy composer files first
COPY composer.json composer.lock /var/www/

# Install PHP dependencies (no dev)
RUN composer install --no-interaction --prefer-dist --no-dev --optimize-autoloader -vvv

# Copy the rest of the app
COPY . /var/www

# Clear prebuilt cache to avoid stale configs
RUN rm -rf bootstrap/cache/*.php

# Expose Render port
EXPOSE 10000

# Run Laravel using built-in PHP server
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=10000"]
