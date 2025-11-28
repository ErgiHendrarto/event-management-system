# Setup Guide - Event Management System

## Panduan Instalasi Lengkap

### 1. Prerequisites

Pastikan sistem Anda memiliki:
- **PHP >= 8.1** dengan extensions:
  - BCMath
  - Ctype
  - Fileinfo
  - JSON
  - Mbstring
  - OpenSSL
  - PDO
  - Tokenizer
  - XML
- **Composer** (dependency manager PHP)
- **MySQL >= 5.7** atau **PostgreSQL >= 10**
- **Node.js >= 16** dan **NPM**
- **Git**

### 2. Clone Repository

```bash
git clone https://github.com/yourusername/event-management-system.git
cd event-management-system
```

### 3. Install Dependencies

#### Backend Dependencies
```bash
composer install
```

#### Frontend Dependencies
```bash
npm install
```

### 4. Environment Setup

#### Copy Environment File
```bash
cp .env.example .env
```

#### Generate Application Key
```bash
php artisan key:generate
```

#### Configure Database

Edit file `.env` dan sesuaikan dengan database Anda:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=event_management
DB_USERNAME=root
DB_PASSWORD=your_password
```

### 5. Database Setup

#### Create Database
Buat database baru di MySQL:
```sql
CREATE DATABASE event_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

#### Run Migrations
```bash
php artisan migrate
```

#### Seed Database (Optional)
Untuk data dummy:
```bash
php artisan db:seed
```

### 6. Storage Setup

Link storage folder untuk upload files:
```bash
php artisan storage:link
```

### 7. Compile Assets

#### Development Mode
```bash
npm run dev
```

#### Production Build
```bash
npm run build
```

### 8. Run Application

#### Using PHP Built-in Server
```bash
php artisan serve
```

Aplikasi akan berjalan di: `http://localhost:8000`

#### Using Laravel Sail (Docker)
```bash
./vendor/bin/sail up
```

### 9. Access Application

- **Homepage**: http://localhost:8000
- **Login**: http://localhost:8000/login
- **Register**: http://localhost:8000/register

#### Default Admin Account
Jika Anda menjalankan seeder:
- Email: `admin@eventmanager.com`
- Password: `admin123`

## Development Tips

### Artisan Commands

```bash
# Clear cache
php artisan cache:clear
php artisan config:clear
php artisan view:clear

# Create new controller
php artisan make:controller ControllerName

# Create new model with migration
php artisan make:model ModelName -m

# Run tests
php artisan test

# Check routes
php artisan route:list
```

### Database Management

```bash
# Fresh migration (warning: deletes all data)
php artisan migrate:fresh

# Fresh migration with seeding
php artisan migrate:fresh --seed

# Rollback last migration
php artisan migrate:rollback

# Create new migration
php artisan make:migration create_table_name
```

### Code Quality

```bash
# Format code with Laravel Pint
./vendor/bin/pint

# Run PHPStan for static analysis
./vendor/bin/phpstan analyse
```

## Troubleshooting

### Permission Issues

Jika mengalami permission issues:
```bash
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
```

### .env Not Found

```bash
cp .env.example .env
php artisan key:generate
```

### Database Connection Error

1. Check MySQL service is running
2. Verify credentials in `.env`
3. Test connection: `mysql -u root -p`

### Composer Issues

```bash
# Update composer
composer self-update

# Clear composer cache
composer clear-cache

# Reinstall dependencies
rm -rf vendor
composer install
```

### NPM Issues

```bash
# Clear npm cache
npm cache clean --force

# Reinstall node_modules
rm -rf node_modules package-lock.json
npm install
```

## Production Deployment

### Environment Configuration

Update `.env` for production:
```env
APP_ENV=production
APP_DEBUG=false
APP_URL=https://yourdomain.com
```

### Optimization

```bash
# Cache configuration
php artisan config:cache

# Cache routes
php artisan route:cache

# Cache views
php artisan view:cache

# Optimize autoloader
composer install --optimize-autoloader --no-dev
```

### Security

1. Set proper file permissions
2. Use HTTPS
3. Set secure SESSION_DRIVER (redis/database)
4. Enable CSRF protection
5. Configure CORS properly
6. Use strong APP_KEY

### Deployment Checklist

- [ ] Set `APP_ENV=production`
- [ ] Set `APP_DEBUG=false`
- [ ] Configure proper database
- [ ] Set up queue workers
- [ ] Configure email service
- [ ] Set up file storage (S3/DO Spaces)
- [ ] Enable SSL certificate
- [ ] Set up backup system
- [ ] Configure monitoring
- [ ] Set up CDN for assets

## Additional Setup

### Email Configuration

Update `.env` for email:
```env
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=your_username
MAIL_PASSWORD=your_password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=noreply@yourdomain.com
MAIL_FROM_NAME="${APP_NAME}"
```

### Queue Configuration

For background jobs:
```env
QUEUE_CONNECTION=database
```

Run queue worker:
```bash
php artisan queue:work
```

### Redis Setup

For better performance:
```bash
composer require predis/predis
```

Update `.env`:
```env
CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_CONNECTION=redis
```

## Support

Jika mengalami masalah:
1. Check Laravel logs: `storage/logs/laravel.log`
2. Enable debug mode: `APP_DEBUG=true`
3. Clear all caches
4. Check server requirements

## Useful Resources

- [Laravel Documentation](https://laravel.com/docs)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Laravel Best Practices](https://github.com/alexeymezenin/laravel-best-practices)
