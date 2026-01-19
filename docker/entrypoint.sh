#!/bin/sh
set -e

cd /var/www/html

# Ensure storage directories exist with proper permissions
mkdir -p storage/framework/{sessions,views,cache}
mkdir -p storage/logs
mkdir -p bootstrap/cache

# Set permissions before running artisan commands
# PHP-FPM runs as www-data, so make storage writable
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

# Generate app key if not set
if [ -z "$APP_KEY" ]; then
    php artisan key:generate --force
fi

# Create storage symlink if it doesn't exist
if [ ! -L "public/storage" ]; then
    php artisan storage:link || true
fi

# Wait for MySQL to be ready
echo "Waiting for MySQL..."
MAX_RETRIES=30
RETRY_COUNT=0
while ! mysql -h "$DB_HOST" -u "$DB_USERNAME" -p"$DB_PASSWORD" --skip-ssl -e "SELECT 1" > /dev/null 2>&1; do
    RETRY_COUNT=$((RETRY_COUNT + 1))
    if [ $RETRY_COUNT -ge $MAX_RETRIES ]; then
        echo "Error: MySQL not available after $MAX_RETRIES attempts"
        exit 1
    fi
    echo "MySQL not ready, waiting... ($RETRY_COUNT/$MAX_RETRIES)"
    sleep 2
done
echo "MySQL is ready!"

# Import SQL dump if exists and not already imported (before migrations)
SQL_DUMP="/var/www/html/cellmart-laravel.sql"
IMPORT_MARKER="/var/www/html/storage/.sql_imported"

if [ -f "$SQL_DUMP" ] && [ ! -f "$IMPORT_MARKER" ]; then
    echo "Importing SQL dump..."
    if mysql -h "$DB_HOST" -u "$DB_USERNAME" -p"$DB_PASSWORD" --skip-ssl "$DB_DATABASE" < "$SQL_DUMP" 2>&1; then
        touch "$IMPORT_MARKER"
        echo "SQL dump imported successfully"
    else
        echo "Warning: SQL dump import had errors (tables may already exist)"
        # Still mark as imported to prevent infinite retries
        touch "$IMPORT_MARKER"
    fi

    # Fix image URLs: change Images/ to images/ for Linux case sensitivity
    echo "Fixing image URLs in database..."
    mysql -h "$DB_HOST" -u "$DB_USERNAME" -p"$DB_PASSWORD" --skip-ssl "$DB_DATABASE" -e "UPDATE products SET image = REPLACE(image, 'Images/', 'images/');" 2>/dev/null || true
    mysql -h "$DB_HOST" -u "$DB_USERNAME" -p"$DB_PASSWORD" --skip-ssl "$DB_DATABASE" -e "UPDATE orders SET products = REPLACE(products, 'Images/', 'images/');" 2>/dev/null || true
    mysql -h "$DB_HOST" -u "$DB_USERNAME" -p"$DB_PASSWORD" --skip-ssl "$DB_DATABASE" -e "UPDATE accepted_orders SET products = REPLACE(products, 'Images/', 'images/');" 2>/dev/null || true
    echo "Image URLs fixed"
fi

# Run migrations (will skip if tables already exist from dump)
php artisan migrate --force

# Cache configuration for production
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Ensure permissions are set after caching
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

echo "Application initialized successfully"

# Execute the main command (supervisord)
exec "$@"
