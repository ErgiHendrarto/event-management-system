# 🚀 GitHub Upload & Live Hosting Guide

Panduan lengkap untuk upload project ke GitHub dan hosting secara live.

## 📋 Table of Contents
1. [Upload ke GitHub](#-upload-ke-github)
2. [Hosting Options](#-hosting-options)
3. [Deploy ke Heroku (Recommended)](#-deploy-ke-heroku-gratis)
4. [Deploy ke Railway](#-deploy-ke-railway-mudah--gratis)
5. [Deploy ke DigitalOcean](#-deploy-ke-digitalocean)
6. [Deploy ke Vercel/Netlify (Static)](#-deploy-static-version)
7. [Custom Domain Setup](#-custom-domain-setup)

---

## 📤 Upload ke GitHub

### Step 1: Persiapan Project

```bash
# Extract project
tar -xzf event-management-system.tar.gz
cd event-management-system

# Initialize Git
git init

# Pastikan .gitignore sudah ada
cat .gitignore
```

### Step 2: Create GitHub Repository

1. Buka https://github.com
2. Click tombol **"+"** di kanan atas → **"New repository"**
3. Isi detail:
   - **Repository name**: `event-management-system`
   - **Description**: `Modern event management system with Laravel & Tailwind CSS`
   - **Visibility**: Public (agar bisa di-share di portfolio)
   - **JANGAN** centang "Initialize with README" (kita sudah punya)
4. Click **"Create repository"**

### Step 3: Push ke GitHub

```bash
# Add all files
git add .

# Commit
git commit -m "Initial commit: Event Management System"

# Add remote (ganti YOUR_USERNAME dengan username GitHub Anda)
git remote add origin https://github.com/YOUR_USERNAME/event-management-system.git

# Push
git branch -M main
git push -u origin main
```

### Step 4: Update Repository Details

Di GitHub repository page:
1. Click **"Settings"**
2. Edit **"About"** section (gear icon di kanan)
3. Tambahkan:
   - **Description**: "Modern event management system built with Laravel and Tailwind CSS"
   - **Website**: (akan diisi setelah deploy)
   - **Topics**: `laravel`, `php`, `mysql`, `tailwindcss`, `event-management`, `qr-code`, `portfolio-project`

---

## 🌐 Hosting Options

### Comparison Table

| Platform | Free Tier | Database | Ease | Best For |
|----------|-----------|----------|------|----------|
| **Heroku** | Yes (limited) | PostgreSQL | ⭐⭐⭐⭐ | Quick demo |
| **Railway** | $5 credit/month | MySQL/PostgreSQL | ⭐⭐⭐⭐⭐ | Best overall |
| **DigitalOcean** | $200 credit | Any | ⭐⭐⭐ | Production |
| **Render** | Yes | PostgreSQL | ⭐⭐⭐⭐ | Alternative |

**Rekomendasi: Railway** (paling mudah dan gratis untuk mulai)

---

## 🚂 Deploy ke Railway (MUDAH & GRATIS)

Railway adalah pilihan terbaik untuk Laravel - setup otomatis dan gratis $5 credit setiap bulan!

### Step 1: Sign Up Railway

1. Buka https://railway.app
2. Click **"Login"** atau **"Start a New Project"**
3. Sign up dengan **GitHub account** (recommended)

### Step 2: Deploy Project

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login (akan buka browser)
railway login

# Initialize project
railway init

# Select: "Empty Project"
# Project name: event-management-system

# Link ke GitHub repo (optional tapi recommended)
railway link
```

### Step 3: Add MySQL Database

Di Railway Dashboard:
1. Click **"+ New"** → **"Database"** → **"MySQL"**
2. Database akan auto-provision
3. Railway akan auto-set environment variables

### Step 4: Configure Environment

Di Railway Dashboard:
1. Click project → **"Variables"** tab
2. Add variables:

```env
APP_NAME="Event Management System"
APP_ENV=production
APP_KEY=base64:xxx  # Generate dengan: php artisan key:generate --show
APP_DEBUG=false
APP_URL=https://your-app.railway.app

# Database - Railway auto-set ini, tapi verify:
DB_CONNECTION=mysql
DB_HOST=${{MYSQLHOST}}
DB_PORT=${{MYSQLPORT}}
DB_DATABASE=${{MYSQLDATABASE}}
DB_USERNAME=${{MYSQLUSER}}
DB_PASSWORD=${{MYSQLPASSWORD}}
```

### Step 5: Create Procfile & nixpacks.toml

```bash
# Create Procfile di root project
cat > Procfile << 'EOF'
web: vendor/bin/heroku-php-apache2 public/
EOF

# Create nixpacks.toml
cat > nixpacks.toml << 'EOF'
[phases.setup]
nixPkgs = ["php82", "php82Packages.composer"]

[phases.build]
cmds = ["composer install --no-dev --optimize-autoloader"]

[phases.deploy]
cmds = ["php artisan migrate --force", "php artisan storage:link"]

[start]
cmd = "php artisan serve --host=0.0.0.0 --port=${PORT:-8000}"
EOF
```

### Step 6: Deploy

```bash
# Commit changes
git add .
git commit -m "Add Railway config"
git push

# Deploy via Railway
railway up

# Atau set auto-deploy dari GitHub:
# Di Railway dashboard → Settings → Enable "Auto Deploy"
```

### Step 7: Run Migrations

```bash
# Via Railway CLI
railway run php artisan migrate --force

# Via Railway dashboard
# Click project → "Settings" → "Deploy" → Run command
```

**✅ Done!** Project Anda live di: `https://your-app.railway.app`

---

## 🟣 Deploy ke Heroku (GRATIS)

Heroku masih populer meski free tier terbatas.

### Step 1: Install Heroku CLI

```bash
# Windows (via Chocolatey)
choco install heroku-cli

# Mac
brew tap heroku/brew && brew install heroku

# Linux
curl https://cli-assets.heroku.com/install.sh | sh
```

### Step 2: Login & Create App

```bash
# Login
heroku login

# Create app (nama harus unique)
heroku create event-manager-yourname

# Add MySQL addon (ClearDB)
heroku addons:create cleardb:ignite

# Get database URL
heroku config:get CLEARDB_DATABASE_URL
```

### Step 3: Configure Environment

```bash
# Set APP_KEY
heroku config:set APP_KEY=$(php artisan key:generate --show)

# Set environment
heroku config:set APP_ENV=production
heroku config:set APP_DEBUG=false
heroku config:set APP_URL=https://your-app.herokuapp.com

# Parse CLEARDB_DATABASE_URL dan set manual:
# Format: mysql://username:password@host/database?reconnect=true
heroku config:set DB_CONNECTION=mysql
heroku config:set DB_HOST=xxx
heroku config:set DB_PORT=3306
heroku config:set DB_DATABASE=xxx
heroku config:set DB_USERNAME=xxx
heroku config:set DB_PASSWORD=xxx
```

### Step 4: Create Procfile

```bash
echo "web: vendor/bin/heroku-php-apache2 public/" > Procfile
```

### Step 5: Update composer.json

Tambahkan di `scripts` section:

```json
"post-install-cmd": [
    "php artisan clear-compiled",
    "chmod -R 777 storage",
    "php artisan optimize"
],
"post-autoload-dump": [
    "Illuminate\\Foundation\\ComposerScripts::postAutoloadDump",
    "@php artisan package:discover --ansi"
]
```

### Step 6: Deploy

```bash
# Commit semua changes
git add .
git commit -m "Prepare for Heroku deployment"

# Push to Heroku
git push heroku main

# Run migrations
heroku run php artisan migrate --force

# Open app
heroku open
```

---

## 🔧 Deploy ke DigitalOcean (Production-Ready)

Untuk production-grade hosting.

### Step 1: Create Droplet

1. Buka https://www.digitalocean.com
2. Create account (dapat $200 credit untuk 60 hari!)
3. Click **"Create"** → **"Droplets"**
4. Choose:
   - **Image**: Ubuntu 22.04 LTS
   - **Plan**: Basic ($6/month atau gunakan credit)
   - **CPU**: Regular, $6/month
   - **Datacenter**: Singapore (terdekat dengan Indonesia)
   - **Authentication**: SSH Key (recommended) atau Password

### Step 2: Setup Server

```bash
# SSH ke server
ssh root@your_droplet_ip

# Update system
apt update && apt upgrade -y

# Install LEMP Stack
apt install nginx mysql-server php8.1-fpm php8.1-mysql php8.1-mbstring php8.1-xml php8.1-curl php8.1-zip php8.1-gd unzip git -y

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install Node.js & NPM
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs
```

### Step 3: Setup MySQL

```bash
# Secure MySQL
mysql_secure_installation

# Create database
mysql -u root -p

CREATE DATABASE event_management;
CREATE USER 'eventuser'@'localhost' IDENTIFIED BY 'strong_password_here';
GRANT ALL PRIVILEGES ON event_management.* TO 'eventuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### Step 4: Deploy Application

```bash
# Clone repository
cd /var/www
git clone https://github.com/YOUR_USERNAME/event-management-system.git
cd event-management-system

# Install dependencies
composer install --no-dev --optimize-autoloader
npm install
npm run build

# Setup environment
cp .env.example .env
nano .env  # Edit dengan database credentials

# Generate key
php artisan key:generate

# Run migrations
php artisan migrate --force

# Setup permissions
chown -R www-data:www-data /var/www/event-management-system
chmod -R 755 /var/www/event-management-system
chmod -R 775 /var/www/event-management-system/storage
chmod -R 775 /var/www/event-management-system/bootstrap/cache

# Storage link
php artisan storage:link
```

### Step 5: Configure Nginx

```bash
# Create Nginx config
nano /etc/nginx/sites-available/event-management

# Paste configuration:
```

```nginx
server {
    listen 80;
    server_name your_domain.com;
    root /var/www/event-management-system/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

```bash
# Enable site
ln -s /etc/nginx/sites-available/event-management /etc/nginx/sites-enabled/

# Test configuration
nginx -t

# Restart Nginx
systemctl restart nginx
```

### Step 6: Setup SSL (HTTPS)

```bash
# Install Certbot
apt install certbot python3-certbot-nginx -y

# Get SSL certificate
certbot --nginx -d your_domain.com

# Auto-renewal is enabled by default
```

**✅ Done!** Project live di: `https://your_domain.com`

---

## 🎨 Deploy Static Version

Jika Anda ingin showcase UI tanpa backend (untuk demo cepat):

### Option 1: Netlify

```bash
# Build static HTML
npm run build

# Create static export (manual)
# Copy public assets dan compiled views
```

### Option 2: GitHub Pages

```bash
# Create gh-pages branch
git checkout -b gh-pages

# Build dan commit
npm run build
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages

# Enable di GitHub Settings → Pages
```

---

## 🌐 Custom Domain Setup

### Setelah Deploy:

1. **Beli Domain** (optional)
   - Namecheap.com (~$10/year)
   - GoDaddy.com
   - Cloudflare (~$8/year)
   - Niagahoster.co.id (untuk .id domain)

2. **Point Domain ke Server**

   **For Railway/Heroku:**
   ```
   Type: CNAME
   Name: @
   Value: your-app.railway.app
   ```

   **For DigitalOcean:**
   ```
   Type: A
   Name: @
   Value: your_droplet_ip
   ```

3. **Update APP_URL**
   ```bash
   # Railway/Heroku
   railway/heroku config:set APP_URL=https://yourdomain.com
   
   # DigitalOcean
   # Edit .env file
   ```

---

## 📸 Update GitHub dengan Live Demo

Setelah deploy, update GitHub README:

```bash
# Edit README.md
nano README.md

# Tambahkan badges dan live demo link di atas:
```

```markdown
# Event Management System

[![Live Demo](https://img.shields.io/badge/demo-online-success)](https://your-app.railway.app)
[![GitHub](https://img.shields.io/badge/github-repository-blue)](https://github.com/YOUR_USERNAME/event-management-system)

🔗 **Live Demo**: https://your-app.railway.app

---

[Rest of README...]
```

```bash
# Commit dan push
git add README.md
git commit -m "Add live demo link"
git push origin main
```

---

## ✅ Post-Deployment Checklist

- [ ] Application running smoothly
- [ ] Database migrations successful
- [ ] Storage/uploads working
- [ ] Email notifications configured (optional)
- [ ] SSL certificate active (HTTPS)
- [ ] Custom domain configured (if applicable)
- [ ] GitHub README updated with live demo link
- [ ] Screenshots added to repository
- [ ] Project added to portfolio website
- [ ] Shared on LinkedIn/social media

---

## 🆘 Troubleshooting

### Error: "Application key not set"
```bash
php artisan key:generate --force
```

### Error: "Storage link not working"
```bash
php artisan storage:link
chmod -R 775 storage
```

### Error: "Database connection failed"
- Check database credentials di .env
- Verify database is running
- Test connection manually

### Error: "500 Server Error"
```bash
# Check logs
tail -f storage/logs/laravel.log

# Clear cache
php artisan cache:clear
php artisan config:clear
php artisan view:clear
```

---

## 🎯 Recommended Workflow

1. **Development**: Local machine
2. **Version Control**: GitHub
3. **Staging**: Railway (free)
4. **Production**: DigitalOcean (with custom domain)

---

## 📞 Need Help?

- Railway Docs: https://docs.railway.app
- Heroku Docs: https://devcenter.heroku.com
- DigitalOcean Docs: https://docs.digitalocean.com
- Laravel Deployment: https://laravel.com/docs/deployment

---

**Selamat! Project Anda sekarang live dan bisa di-share ke recruiters!** 🎉
