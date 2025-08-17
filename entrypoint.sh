#!/bin/sh
set -e

# Recreate Laravel storage paths at runtime
mkdir -p /var/www/storage/framework/{cache,sessions,views,testing}
mkdir -p /var/www/bootstrap/cache

chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache
chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Hand over to CMD
exec "$@"
