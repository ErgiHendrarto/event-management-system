# Quick Start Guide

## ⚡ 5-Minute Setup

Panduan singkat untuk segera menjalankan aplikasi ini di local environment.

### Prerequisites Checklist

- [ ] PHP 8.1 or higher installed
- [ ] Composer installed
- [ ] MySQL installed and running
- [ ] Node.js & NPM installed

### Installation Steps

```bash
# 1. Extract project
tar -xzf event-management-system.tar.gz
cd event-management-system

# 2. Install dependencies
composer install
npm install

# 3. Setup environment
cp .env.example .env
php artisan key:generate

# 4. Configure database in .env
# Edit DB_DATABASE, DB_USERNAME, DB_PASSWORD

# 5. Create database
mysql -u root -p
CREATE DATABASE event_management;
exit;

# 6. Run migrations
php artisan migrate

# 7. (Optional) Seed demo data
php artisan db:seed

# 8. Link storage
php artisan storage:link

# 9. Compile assets
npm run dev

# 10. Start server
php artisan serve
```

### Access the Application

Open browser: `http://localhost:8000`

### Demo Accounts

After seeding:
- **Admin**: admin@eventmanager.com / admin123
- **User**: user@example.com / user123

## 🎨 Customization Quick Tips

### Change Brand Colors

Edit `resources/views/layouts/app.blade.php`:
```css
.gradient-bg {
    background: linear-gradient(135deg, #YOUR_COLOR_1 0%, #YOUR_COLOR_2 100%);
}
```

### Change App Name

Edit `.env`:
```
APP_NAME="Your Event Platform"
```

### Add Your Logo

Replace logo icon in navbar:
```html
<i class="fas fa-calendar-alt"></i>
<!-- Change to your icon -->
```

## 📸 Quick Screenshots Guide

### Screenshots Needed for Portfolio:

1. **Homepage** - Hero section dengan search bar
2. **Events Page** - Grid of events dengan filters
3. **Event Detail** - Single event view dengan registration button
4. **Dashboard** - Admin dashboard dengan statistics
5. **My Events** - User's registered events
6. **Ticket View** - QR code ticket
7. **Mobile View** - Responsive design

### How to Take Good Screenshots:

```bash
# Use browser dev tools
# Set viewport to:
# - Desktop: 1920x1080
# - Tablet: 768x1024
# - Mobile: 375x667

# Use tools like:
# - Awesome Screenshot (Chrome Extension)
# - Nimbus Screenshot
# - or built-in browser screenshot
```

## 🚀 Quick Deploy to Heroku

```bash
# 1. Install Heroku CLI
# 2. Login to Heroku
heroku login

# 3. Create app
heroku create your-app-name

# 4. Add MySQL addon
heroku addons:create cleardb:ignite

# 5. Set environment
heroku config:set APP_KEY=$(php artisan key:generate --show)
heroku config:set APP_ENV=production
heroku config:set APP_DEBUG=false

# 6. Deploy
git push heroku main

# 7. Run migrations
heroku run php artisan migrate

# 8. Open app
heroku open
```

## 🎯 Portfolio Integration Checklist

- [ ] Deploy to live server
- [ ] Add project to GitHub
- [ ] Create comprehensive README
- [ ] Take high-quality screenshots
- [ ] Record demo video (optional)
- [ ] Write project case study
- [ ] Add to portfolio website
- [ ] Update resume
- [ ] Share on LinkedIn
- [ ] Add to GitHub pinned repos

## 💡 Feature Demo Flow

### For Recruiters/Interviewers:

1. **Start at Homepage** (20 seconds)
   - Show hero section
   - Demonstrate search functionality
   - Highlight category filters

2. **Browse Events** (30 seconds)
   - Show event cards
   - Apply filters
   - Demonstrate sorting

3. **Event Details** (40 seconds)
   - Show detailed event page
   - Registration process
   - Share functionality

4. **Dashboard** (30 seconds)
   - Admin statistics
   - Event management
   - Analytics charts

5. **Ticketing** (30 seconds)
   - Show QR code
   - Ticket details
   - Check-in simulation

**Total Demo Time: ~2.5 minutes**

## 🔧 Common Issues & Quick Fixes

### Issue: "Class not found"
```bash
composer dump-autoload
```

### Issue: "Permission denied"
```bash
chmod -R 775 storage bootstrap/cache
```

### Issue: "Mix manifest not found"
```bash
npm run dev
```

### Issue: "Database connection failed"
```bash
# Check MySQL is running
# Verify credentials in .env
php artisan config:clear
```

### Issue: "Storage link not working"
```bash
php artisan storage:link
```

## 📝 Interview Talking Points

### Architecture
- "Built with MVC pattern using Laravel framework"
- "Implemented repository pattern for data access"
- "Used Eloquent ORM for database relationships"

### Security
- "Implemented CSRF protection for all forms"
- "Added XSS prevention through input sanitization"
- "Used role-based access control for authorization"

### UI/UX
- "Designed mobile-first responsive interface"
- "Implemented smooth animations and transitions"
- "Created intuitive user flow for event registration"

### Features
- "Integrated QR code generation for digital tickets"
- "Built real-time analytics dashboard"
- "Implemented advanced search with multiple filters"

### Testing
- "Added unit tests for models and services"
- "Implemented feature tests for user flows"
- "Achieved 80%+ code coverage"

## 🎓 What You Learned

This project demonstrates:

✅ Full-stack web development
✅ Database design and relationships  
✅ RESTful API architecture
✅ Authentication & authorization
✅ File upload handling
✅ Email integration
✅ QR code generation
✅ Responsive design
✅ Modern CSS frameworks
✅ Version control (Git)
✅ Deployment practices
✅ Documentation writing

## 📞 Get Help

Stuck? Check these resources:
- `SETUP_GUIDE.md` - Detailed installation guide
- `FEATURES.md` - All features explained
- `PROJECT_SUMMARY.md` - Project overview
- Laravel Docs: https://laravel.com/docs
- Tailwind Docs: https://tailwindcss.com/docs

---

**Good luck with your portfolio! 🎉**

*Remember: The best portfolio projects are the ones you can explain confidently and demonstrate live!*
