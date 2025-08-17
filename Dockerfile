# ---- Base PHP-FPM (app) ----
FROM php:8.2-fpm

# System deps
RUN apt-get update && apt-get install -y \
    git unzip libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install opcache \
    && rm -rf /var/lib/apt/lists/*

# Install Composer (copy from official composer image)
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Copy only composer files first for better caching
COPY composer.json composer.lock /var/www/

# Clear any stale bootstrap caches before install
RUN rm -rf bootstrap/cache/*.php

# Install dependencies (production only, no dev)
RUN composer install --no-interaction --prefer-dist --no-dev --no-scripts -vvv

# Now copy the rest of the app
COPY . /var/www

# After copying code, clear stale caches again (important!)
RUN rm -rf bootstrap/cache/*.php

# Re-run composer scripts to generate optimized autoloads
RUN composer install --no-interaction --prefer-dist --no-dev --optimize-autoloader -vvv


# Run artisan setup tasks
RUN php artisan config:clear \
 && php artisan config:cache \
 && php artisan route:cache \
 && php artisan view:cache \
 && php artisan storage:link || true

# Permissions for Laravel
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache \
 && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# EXPOSE 9000
# # CMD ["php-fpm"]
# CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=10000"]


# expose web port (helps docs, not strictly required)
# EXPOSE 10000

# # ensure CMD uses Render's $PORT env (falls back to 10000 locally)
# CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=${PORT:-10000}"]


EXPOSE 10000
CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=${PORT:-10000}"]


