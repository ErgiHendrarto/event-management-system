# 🚀 Quick Deployment Reference

Cheat sheet untuk upload dan hosting project ini.

## 📤 Upload ke GitHub (5 menit)

### Cara Otomatis (Recommended)
```bash
# Jalankan script
./setup-github.sh

# Ikuti instruksi di layar
```

### Cara Manual
```bash
# 1. Initialize Git
git init
git add .
git commit -m "Initial commit"

# 2. Create repo di GitHub: https://github.com/new

# 3. Push (ganti YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/event-management-system.git
git branch -M main
git push -u origin main
```

**✅ Done!** Repo: `https://github.com/YOUR_USERNAME/event-management-system`

---

## 🌐 Live Hosting

### 🥇 Option 1: Railway (RECOMMENDED - Paling Mudah)

**Why Railway?**
- ✅ Gratis $5 credit/bulan
- ✅ MySQL included
- ✅ Auto-deploy dari GitHub
- ✅ HTTPS otomatis
- ✅ Paling mudah setup

**Deploy:**
```bash
# Cara otomatis
./deploy-railway.sh

# Cara manual
railway login
railway init
railway up
```

**Live in 5 minutes:** `https://your-app.railway.app`

**Dashboard:** https://railway.app/dashboard

---

### 🥈 Option 2: Heroku (Free Tier)

**Why Heroku?**
- ✅ Populer & banyak tutorial
- ✅ Free tier available
- ⚠️ Perlu ClearDB addon untuk MySQL

**Deploy:**
```bash
# Cara otomatis
./deploy-heroku.sh

# Cara manual
heroku login
heroku create your-app-name
heroku addons:create cleardb:ignite
git push heroku main
heroku run php artisan migrate --force
```

**Live in 10 minutes:** `https://your-app.herokuapp.com`

---

### 🥉 Option 3: DigitalOcean (Production-Grade)

**Why DigitalOcean?**
- ✅ $200 free credit (60 days)
- ✅ Full control
- ✅ Custom domain easy
- ⚠️ Butuh setup server

**Deploy:** Follow [GITHUB_DEPLOYMENT.md](GITHUB_DEPLOYMENT.md#-deploy-ke-digitalocean)

**Cost:** $6/month (setelah credit habis)

---

## 🎯 Recommended Path untuk Portfolio

### Path 1: Demo Cepat (Railway)
```
Extract → Install → GitHub → Railway → DONE!
Total time: ~30 minutes
```

### Path 2: Production Ready (DigitalOcean)
```
Extract → Install → GitHub → DigitalOcean → Custom Domain
Total time: ~2 hours
```

### Path 3: Best of Both
```
1. Deploy ke Railway untuk quick demo
2. Deploy ke DigitalOcean untuk production
3. Use Railway for portfolio
4. Use DigitalOcean for real users
```

---

## 📋 Step-by-Step Checklist

### Phase 1: Local Setup (10 min)
- [ ] Extract project
- [ ] Run `composer install`
- [ ] Run `npm install`
- [ ] Copy `.env.example` to `.env`
- [ ] Set up database
- [ ] Run `php artisan migrate`
- [ ] Test locally: `php artisan serve`

### Phase 2: GitHub (5 min)
- [ ] Create GitHub account (if needed)
- [ ] Run `./setup-github.sh` or manual push
- [ ] Verify files on GitHub
- [ ] Add repository description
- [ ] Add topics/tags

### Phase 3: Deployment (10-30 min)
- [ ] Choose hosting (Railway recommended)
- [ ] Run deployment script
- [ ] Configure environment variables
- [ ] Run migrations
- [ ] Test live URL
- [ ] Verify all features work

### Phase 4: Polish (15 min)
- [ ] Add custom domain (optional)
- [ ] Setup SSL/HTTPS
- [ ] Update GitHub README with live URL
- [ ] Take screenshots
- [ ] Test on mobile

### Phase 5: Portfolio (30 min)
- [ ] Add to portfolio website
- [ ] Write project description
- [ ] Add screenshots/demo video
- [ ] Update resume
- [ ] Share on LinkedIn

**Total Time: 1-2 hours** (from zero to live + portfolio ready)

---

## 🆘 Quick Troubleshooting

### Problem: "Permission denied" for scripts
```bash
chmod +x setup-github.sh deploy-railway.sh deploy-heroku.sh
```

### Problem: "Database connection failed"
```bash
# Check .env file
# Verify database credentials
php artisan config:clear
```

### Problem: "Storage link not found"
```bash
php artisan storage:link
```

### Problem: "500 error after deploy"
```bash
# Check logs
railway logs  # untuk Railway
heroku logs --tail  # untuk Heroku

# Clear cache
php artisan cache:clear
php artisan config:clear
```

---

## 📞 Need Help?

**Full Documentation:**
- [GITHUB_DEPLOYMENT.md](GITHUB_DEPLOYMENT.md) - Complete deployment guide
- [QUICK_START.md](QUICK_START.md) - Local setup guide
- [INDEX.md](INDEX.md) - Documentation index

**External Resources:**
- Railway Docs: https://docs.railway.app
- Heroku Docs: https://devcenter.heroku.com
- GitHub Guides: https://guides.github.com

---

## 🎉 Success URLs

After deployment, update these everywhere:

```markdown
📊 **GitHub**: https://github.com/YOUR_USERNAME/event-management-system
🌐 **Live Demo**: https://your-app.railway.app
📝 **Documentation**: https://github.com/YOUR_USERNAME/event-management-system#readme
```

Use these URLs in:
- [ ] Portfolio website
- [ ] Resume
- [ ] LinkedIn profile
- [ ] Cover letters
- [ ] GitHub profile README

---

## 💡 Pro Tips

1. **Always test locally first** before deploying
2. **Use Railway for quick demos** to show recruiters
3. **Keep GitHub README updated** with screenshots
4. **Add badges** to make it look professional
5. **Document your process** - recruiters love this!

---

## 🏆 Final Checklist

Ready to show recruiters?

- [ ] Application works locally
- [ ] Code on GitHub
- [ ] Live demo accessible
- [ ] HTTPS enabled
- [ ] All features working
- [ ] Mobile responsive tested
- [ ] Screenshots taken
- [ ] Demo video recorded (optional)
- [ ] Added to portfolio
- [ ] Shared on LinkedIn

**You're ready to impress recruiters!** 🚀

---

**Quick Commands:**

```bash
# GitHub upload
./setup-github.sh

# Deploy to Railway
./deploy-railway.sh

# Deploy to Heroku  
./deploy-heroku.sh

# Check everything works
php artisan serve    # Local test
git status          # Git check
railway status      # Railway check
```

---

**FASTEST PATH TO LIVE:**

```bash
# 1. Upload to GitHub
./setup-github.sh

# 2. Deploy to Railway
./deploy-railway.sh

# 3. Done! You're live in ~15 minutes! 🎉
```
