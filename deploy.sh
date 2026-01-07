#!/bin/bash
# Quick deployment script for Flong Tax Service website

set -e  # Exit on any error

echo "=== Flong Tax Service - GitHub Deployment ==="
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "Error: Run this script from the site/ directory"
    echo "Usage: cd site/ && bash deploy.sh"
    exit 1
fi

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    git branch -M main
fi

# Check if remote exists
if ! git remote | grep -q "origin"; then
    echo "Adding GitHub remote..."
    git remote add origin https://github.com/wem3/flong-tax-website.git
fi

# Stage all files
echo "Staging files..."
git add .

# Commit
echo ""
read -p "Enter commit message (or press Enter for default): " commit_msg
if [ -z "$commit_msg" ]; then
    commit_msg="Update website content"
fi

git commit -m "$commit_msg"

# Push
echo "Pushing to GitHub..."
git push -u origin main

echo ""
echo "✓ Deployment complete!"
echo ""
echo "Your site will be live at:"
echo "  https://wem3.github.io/flong-tax-website/"
echo ""
echo "To use your custom domain (flongtaxservice.com):"
echo "  1. Go to: https://github.com/wem3/flong-tax-website/settings/pages"
echo "  2. Enter 'flongtaxservice.com' in the Custom domain field"
echo "  3. Update your DNS records (see DEPLOYMENT.md for details)"
echo ""
