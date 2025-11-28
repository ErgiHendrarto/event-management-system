#!/bin/bash

# Quick GitHub Setup Script
# Event Management System

echo "📤 GitHub Upload Script"
echo "======================="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git not found! Please install Git first."
    exit 1
fi

echo "✅ Git found"
echo ""

# Check if already initialized
if [ -d .git ]; then
    echo "⚠️  Git repository already initialized"
else
    echo "🔧 Initializing Git repository..."
    git init
    git branch -M main
fi

echo ""
read -p "Enter your GitHub username: " GITHUB_USER
read -p "Enter repository name (default: event-management-system): " REPO_NAME
REPO_NAME=${REPO_NAME:-event-management-system}

echo ""
echo "📋 Repository will be created at:"
echo "   https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""
read -p "Continue? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "❌ Cancelled"
    exit 1
fi

echo ""
echo "💾 Adding files to Git..."
git add .

echo ""
echo "📝 Creating initial commit..."
git commit -m "Initial commit: Event Management System

Features:
- Event CRUD operations
- User registration system
- QR code ticketing
- Role-based access control
- Responsive design with Tailwind CSS
- Admin dashboard with analytics
- Advanced search and filters

Tech Stack:
- Laravel 10
- PHP 8.1+
- MySQL
- Tailwind CSS
- Font Awesome"

echo ""
echo "🔗 Adding remote repository..."
git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git

echo ""
echo "⚠️  IMPORTANT: Before pushing, please:"
echo "1. Go to https://github.com/new"
echo "2. Create a new repository named: $REPO_NAME"
echo "3. Set it as PUBLIC"
echo "4. Do NOT initialize with README, .gitignore, or license"
echo ""
read -p "Press Enter after creating the repository..."

echo ""
echo "🚀 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Upload Complete!"
echo ""
echo "📊 Your repository:"
echo "   https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""
echo "Next steps:"
echo "1. Visit your repository"
echo "2. Add topics: laravel, php, mysql, tailwindcss, event-management"
echo "3. Edit About section"
echo "4. Add live demo URL after deployment"
echo ""
echo "Deploy options:"
echo "  ./deploy-railway.sh  # Deploy to Railway (recommended)"
echo "  ./deploy-heroku.sh   # Deploy to Heroku"
echo ""
