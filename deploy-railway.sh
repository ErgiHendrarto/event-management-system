#!/bin/bash

# Railway Deployment Script
# Event Management System

echo "🚀 Railway Deployment Script"
echo "=============================="
echo ""

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI not found!"
    echo "📥 Installing Railway CLI..."
    npm install -g @railway/cli
fi

echo "✅ Railway CLI found"
echo ""

# Login to Railway
echo "🔐 Logging in to Railway..."
railway login

echo ""
echo "📦 Initializing project..."
railway init

echo ""
echo "🗄️  Creating MySQL database..."
echo "Please add MySQL database manually from Railway dashboard:"
echo "1. Go to https://railway.app/dashboard"
echo "2. Select your project"
echo "3. Click '+ New' → 'Database' → 'MySQL'"
echo ""
read -p "Press Enter after adding the database..."

echo ""
echo "⚙️  Setting environment variables..."

# Generate APP_KEY
APP_KEY=$(php artisan key:generate --show)

railway variables set APP_NAME="Event Management System"
railway variables set APP_ENV=production
railway variables set APP_KEY=$APP_KEY
railway variables set APP_DEBUG=false

echo ""
echo "📝 Creating nixpacks.toml..."
cat > nixpacks.toml << 'EOF'
[phases.setup]
nixPkgs = ["php82", "php82Packages.composer"]

[phases.build]
cmds = ["composer install --no-dev --optimize-autoloader"]

[phases.deploy]
cmds = ["php artisan migrate --force", "php artisan storage:link", "php artisan config:cache", "php artisan route:cache"]

[start]
cmd = "php artisan serve --host=0.0.0.0 --port=${PORT:-8000}"
EOF

echo ""
echo "📝 Creating Procfile..."
echo "web: vendor/bin/heroku-php-apache2 public/" > Procfile

echo ""
echo "💾 Committing changes..."
git add nixpacks.toml Procfile
git commit -m "Add Railway deployment configuration"

echo ""
echo "🚀 Deploying to Railway..."
railway up

echo ""
echo "⏳ Running migrations..."
railway run php artisan migrate --force

echo ""
echo "✅ Deployment Complete!"
echo ""
echo "🌐 Your application is now live!"
echo "📊 View deployment: railway open"
echo "📝 View logs: railway logs"
echo ""
echo "Next steps:"
echo "1. Get your app URL: railway domain"
echo "2. Update APP_URL in Railway variables"
echo "3. Test your application"
echo ""
