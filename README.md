# Maven Design System — Deploy to Cloudflare Pages

## Quick Deploy (3 steps)

```bash
# 1. このフォルダに移動
cd maven-design-system

# 2. Wranglerがなければインストール
npm install -g wrangler

# 3. デプロイ実行
wrangler pages deploy . --project-name=maven-design-system --branch=main
```

初回実行時にプロジェクトが自動作成されます。

## Or use the script

```bash
chmod +x deploy.sh
./deploy.sh
```

## Result

デプロイ後のURL:
**https://maven-design-system.pages.dev**

## Custom Domain

カスタムドメインを設定する場合:
1. Cloudflare Dashboard → Pages → maven-design-system
2. Custom domains → Set up a custom domain
3. `design.ppt0.ai` などを設定
