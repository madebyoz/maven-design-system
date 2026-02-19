#!/bin/bash
# ============================================
# Maven Design System — Cloudflare Pages Deploy
# ============================================

PROJECT_NAME="maven-design-system"

echo "🏁 Maven Design System → Cloudflare Pages"
echo "==========================================="
echo ""

# Check wrangler
if ! command -v wrangler &> /dev/null; then
  echo "⚠️  Wrangler not found. Installing..."
  npm install -g wrangler
  echo ""
fi

# Check login
echo "📋 Checking Cloudflare auth..."
wrangler whoami 2>/dev/null
if [ $? -ne 0 ]; then
  echo ""
  echo "🔑 Please login first:"
  wrangler login
fi

echo ""
echo "🚀 Deploying to Cloudflare Pages..."
echo ""

# Deploy (create project on first run, update on subsequent)
wrangler pages deploy . \
  --project-name="$PROJECT_NAME" \
  --branch=main

echo ""
echo "✅ Done! Your site should be live at:"
echo "   https://${PROJECT_NAME}.pages.dev"
echo ""
