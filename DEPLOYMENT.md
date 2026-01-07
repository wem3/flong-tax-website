# Deployment Instructions for Flong Tax Service Website

## Prerequisites
- Python 3 installed
- Git installed
- GitHub account with access to https://github.com/wem3/flong-tax-website

## Step 1: Generate the Site

```bash
# Install dependencies
pip3 install -r requirements.txt

# Run the scraper
python3 scrape_and_build.py
```

This will create a `site/` directory with:
- index.html (main page)
- style.css (styling)
- images/ (downloaded images)

## Step 2: Review the Generated Site

```bash
cd site/
# Open index.html in your browser to preview
```

## Step 3: Push to GitHub

```bash
# If you're starting fresh (in the site/ directory):
git init
git add .
git commit -m "Initial site from Wix migration"
git branch -M main
git remote add origin https://github.com/wem3/flong-tax-website.git
git push -u origin main

# Or if the repo already has content:
cd site/
git init
git add .
git commit -m "Add website files"
git remote add origin https://github.com/wem3/flong-tax-website.git
git pull origin main --allow-unrelated-histories
git push origin main
```

## Step 4: Enable GitHub Pages

1. Go to https://github.com/wem3/flong-tax-website/settings/pages
2. Under "Source", select "Deploy from a branch"
3. Select branch: "main"
4. Select folder: "/ (root)"
5. Click "Save"

Your site will be live at: https://wem3.github.io/flong-tax-website/

## Step 5: Configure Custom Domain

### In GitHub:
1. Go to https://github.com/wem3/flong-tax-website/settings/pages
2. Under "Custom domain", enter: flongtaxservice.com
3. Click "Save"
4. Check "Enforce HTTPS" once DNS propagates

### In Your Domain Registrar:
Add these DNS records (exact process varies by registrar):

**For apex domain (flongtaxservice.com):**
- Type: A
- Name: @ (or leave blank)
- Value: 185.199.108.153
- TTL: 3600

Add three more A records with these IPs:
- 185.199.109.153
- 185.199.110.153
- 185.199.111.153

**For www subdomain:**
- Type: CNAME
- Name: www
- Value: wem3.github.io
- TTL: 3600

DNS propagation can take 24-48 hours, but usually happens within a few hours.

## Step 6: Verify

After DNS propagates:
- Visit https://flongtaxservice.com
- Verify the site loads correctly
- Check that HTTPS is working

## Updating the Site

To make changes:
1. Edit the HTML/CSS files locally
2. Commit and push:
   ```bash
   git add .
   git commit -m "Description of changes"
   git push origin main
   ```
3. Changes will appear on the live site within a few minutes

## Troubleshooting

**Site not loading after enabling GitHub Pages:**
- Wait 5-10 minutes for initial build
- Check https://github.com/wem3/flong-tax-website/settings/pages for build status

**Custom domain not working:**
- Verify DNS records with: `dig flongtaxservice.com`
- Check GitHub Pages status for errors
- DNS changes can take up to 48 hours

**Images not loading:**
- Ensure images/ directory was pushed to GitHub
- Check browser console for errors
- Verify image paths in index.html are correct

## Need to Re-scrape?

If Wix content changes before the site goes down:
```bash
python3 scrape_and_build.py
cd site/
git add .
git commit -m "Updated content from Wix"
git push origin main
```
