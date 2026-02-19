# Maven Design System — Slide Grid Prompt

固定キャンバス上でスライドを構成するための空間設計ルール。映画のフレーミングに近い「構図」の体系。

## Grid Tokens

```yaml
grid:
  canvas: { width: 13.333in, height: 7.5in, aspect: "16:9", dpi: 96 }
  margin: { top: 0.5in, bottom: 0.6in, left: 0.5in, right: 0.5in }
  columns: 6
  gutter: 0.3in
  zones:
    title:   { top: 0.5in,  height: 1.2in }  # タイトル・サブタイトル
    content: { top: 1.7in,  height: 4.8in }  # 本文・グラフ・画像
    footer:  { top: 6.5in,  height: 0.5in }  # ページ番号・出典・ロゴ
  base-unit: 0.25in
  spacing: { xs: 0.125in, sm: 0.25in, md: 0.5in, lg: 0.75in, xl: 1.0in }
```

## Layout Patterns

| Intent（意図） | Pattern | Columns | Zone |
|---|---|---|---|
| 比較する | three-up | 2+2+2 | content |
| インパクト | full-bleed | 6 | all |
| データ表示 | four-up | 3+3 | content |
| 要点を伝える | text-image | 4+2 | content |
| セクション区切り | title-only | 6 center | title |
| 引用・メッセージ | quote | 6 center | content |

## Adaptation Rules（コンテンツ適応）

- テキスト量多 → カラム比 4:2 → 5:1 に拡張
- 画像複数 → text-image → three-up へ切替
- データ4点以上 → four-up を自動選択
- 画像のみ → full-bleed + オーバーレイタイトル
- 引用・単一メッセージ → quote パターン、中央揃え

## Principles（設計3原則）

1. **Semantic Clarity** — 座標ではなくトークン名（`zone.title`, `margin.top`）で構造を定義
2. **Projection Resilience** — マージンで投影時のセーフエリアを確保
3. **Content Adaptability** — 同一グリッド上でテキスト中心もダッシュボードも美しく配置
