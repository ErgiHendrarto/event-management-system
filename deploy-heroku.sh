#!/bin/bash

# Heroku Deployment Script
# Event Management System

echo "🟣 Heroku Deployment Script"
echo "============================"
echo ""

# Check if Heroku CLI is installed
if ! command -v heroku &> /dev/null; then
    echo "❌ Heroku CLI not found!"
    echo "📥 Please install Heroku CLI from: https://devcenter.heroku.com/articles/heroku-cli"
    exit 1
fi

echo "✅ Heroku CLI found"
echo ""

# Login to Heroku
echo "🔐 Logging in to Heroku..."
heroku login

echo ""
read -p "Enter your app name (e.g., event-manager-yourname): " APP_NAME

echo ""
echo "📦 Creating Heroku app..."
heroku create $APP_NAME

echo ""
echo "🗄️  Adding ClearDB MySQL addon..."
heroku addons:create cleardb:ignite -a $APP_NAME

echo ""
echo "⏳ Waiting for database to provision..."
sleep 10

echo ""
echo "📊 Getting database URL..."
DB_URL=$(heroku config:get CLEARDB_DATABASE_URL -a $APP_NAME)
echo "Database URL: $DB_URL"

echo ""
echo "⚙️  Setting environment variables..."

# Generate APP_KEY
APP_KEY=$(php artisan key:generate --show)

heroku config:set APP_NAME="Event Management System" -a $APP_NAME
heroku config:set APP_ENV=production -a $APP_NAME
heroku config:set APP_KEY=$APP_KEY -a $APP_NAME
heroku config:set APP_DEBUG=false -a $APP_NAME
heroku config:set APP_URL=https://$APP_NAME.herokuapp.com -a $APP_NAME

# Parse database URL and set variables
echo ""
echo "⚠️  Please configure database manually:"
echo "1. Parse this URL: $DB_URL"
echo "2. Set database config in Heroku dashboard"
echo ""
read -p "Press Enter after configuring database..."

echo ""
echo "📝 Creating Procfile..."
echo "web: vendor/bin/heroku-php-apache2 public/" > Procfile

echo ""
echo "💾 Committing changes..."
git add Procfile
git commit -m "Add Heroku Procfile"

echo ""
echo "🚀 Deploying to Heroku..."
git push heroku main

echo ""
echo "⏳ Running migrations..."
heroku run php artisan migrate --force -a $APP_NAME

echo ""
echo "🔗 Creating storage link..."
heroku run php artisan storage:link -a $APP_NAME

echo ""
echo "✅ Deployment Complete!"
echo ""
echo "🌐 Your application is now live at:"
echo "   https://$APP_NAME.herokuapp.com"
echo ""
echo "Useful commands:"
echo "  heroku logs --tail -a $APP_NAME  # View logs"
echo "  heroku open -a $APP_NAME         # Open in browser"
echo "  heroku run bash -a $APP_NAME     # SSH into dyno"
echo ""
