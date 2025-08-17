# ---- Base PHP-FPM (app) ----
FROM php:8.2-fpm

# System dependencies
RUN apt-get update && apt-get install -y \
    git unzip libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd bcmath opcache \
    && rm -rf /var/lib/apt/lists/*

# Install Composer (copy from official composer image)
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Copy composer files first (layer caching)
COPY composer.json composer.lock /var/www/

# Install PHP dependencies (production only)
RUN composer install --no-interaction --prefer-dist --no-dev --optimize-autoloader -vvv || true

# Copy the rest of the application
COPY . /var/www

# Clear any prebuilt cache
RUN rm -rf bootstrap/cache/*.php

# Ensure Laravel storage/framework subdirs exist
RUN mkdir -p /var/www/storage/framework/{cache,sessions,views,testing} \
    && chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Expose Render port


EXPOSE 10000

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use entrypoint
ENTRYPOINT ["/entrypoint.sh"]# ---- Base PHP-FPM (app) ----
FROM php:8.2-fpm

# System deps
RUN apt-get update && apt-get install -y \
    git unzip libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install opcache \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Copy only composer files first
COPY composer.json composer.lock /var/www/

RUN composer install --no-interaction --prefer-dist --no-dev --no-scripts -vvv

# Copy rest of the app
COPY . /var/www

RUN composer install --no-interaction --prefer-dist --no-dev --optimize-autoloader -vvv

# Fix permissions during build (safety)
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache \
 && chmod -R 775 /var/www/storage /var/www/bootstrap/cache || true

# Force-create runtime storage folders + run server
CMD mkdir -p /var/www/storage/framework/{cache,sessions,views} \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache \
    && chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache \
    && php artisan config:clear \
    && php artisan route:clear \
    && php artisan view:clear \
    && php artisan serve --host=0.0.0.0 --port=${PORT:-10000}

EXPOSE 10000


# Run Laravel using built-in server
CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=${PORT:-10000}"]

