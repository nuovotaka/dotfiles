# Nixvim 設定 - 拡張プラグイン統合版

## 📁 ファイル構成

- `default.nix` - メインエントリーポイント
- `complete.nix` - **拡張プラグイン統合済み**の完全な設定
- `plugins.nix` - 基本プラグイン設定（参考用）
- `settings.nix` - 基本設定（complete.nix に統合済み）
- `plugins-enhanced.nix` - 拡張プラグイン設定（参考用）

## 🚀 統合された機能

### 🎨 **テーマ・UI**

- **Catppuccin** - モダンなカラーテーマ（透明背景、カスタムハイライト）
- **Lualine** - 高機能ステータスライン（Git、診断情報、ナビゲーション）
- **Bufferline** - タブ風バッファ表示
- **Web-devicons** - ファイルアイコン

### 🔍 **検索・ナビゲーション**

- **Telescope** - 強力なファジーファインダー
  - ファイル検索、テキスト検索、Git 統合
  - ファイルブラウザー、コマンド履歴
  - 診断情報、ヘルプ、キーマップ検索
- **Neo-tree** - ファイルエクスプローラー
  - Git 状態表示、シンボル表示
  - 美しいアイコンとインデント
- **Which-key** - キーバインドヘルプ

### 💻 **LSP・開発支援**

- **LSP** - 多言語対応
  - Nix, Lua, TypeScript, Python, Go, Terraform
  - JSON, YAML, HTML, Markdown
  - Kubernetes, Docker Compose, Ansible 対応
- **Treesitter** - シンタックスハイライト・テキストオブジェクト
- **LSP-lines** - 診断情報の詳細表示
- **Conform** - コードフォーマッター
- **Fidget** - LSP 進捗表示

### ✨ **補完・スニペット**

- **CMP** - 高機能補完システム
  - LSP、バッファ、パス、スニペット補完
  - 絵文字補完、Git 補完
  - コマンドライン補完
- **LuaSnip** - スニペットエンジン
- **Autopairs** - 自動ペア補完

### 🔧 **エディター機能**

- **Indent-blankline** - インデントガイド
- **Illuminate** - 同じ単語のハイライト
- **Navic** - ナビゲーションバー
- **Todo-comments** - TODO コメントのハイライト
- **Undotree** - アンドゥ履歴の可視化
- **Mini.nvim** - 軽量プラグイン群
  - AI 補完、Surround、コメント、ペア、インデントスコープ

### 🌿 **Git 統合**

- **Gitsigns** - Git 変更の表示
- **Lazygit** - Git GUI

### 🛠️ **ユーティリティ**

- **ToggleTerm** - ターミナル統合
- **Markdown Preview** - マークダウンプレビュー

## ⌨️ **主要キーマップ**

### ファイル・検索

- `<leader><space>` - ファイル検索
- `<leader>/` - テキスト検索
- `<leader>ff` - ファイル検索
- `<leader>fg` - テキスト検索
- `<leader>fb` - バッファ検索
- `<leader>fr` - 最近のファイル
- `<C-p>` - Git ファイル検索

### エディター

- `<leader>e` - Neo-tree 切り替え
- `<leader>u` - Undotree 表示
- `<leader>t` - ターミナル切り替え

### Git

- `<leader>gg` - LazyGit 起動
- `<leader>gc` - Git コミット履歴
- `<leader>gs` - Git ステータス

### LSP

- `gd` - 定義へジャンプ
- `gr` - 参照検索
- `K` - ホバー情報
- `<leader>cr` - リネーム
- `<leader>cd` - 診断情報
- `[d` / `]d` - 診断ナビゲーション

### 補完

- `<C-j>` / `<C-k>` - 補完項目選択
- `<C-Space>` - 補完開始
- `<CR>` - 補完確定
- `<C-e>` - 補完キャンセル

## 🔧 **設定の特徴**

1. **統合性** - 全てのプラグインが連携して動作
2. **パフォーマンス** - 最適化された設定
3. **美観** - 統一されたテーマとアイコン
4. **実用性** - 実際の開発で使える機能
5. **拡張性** - 簡単にカスタマイズ可能

## 📝 **使用方法**

```nix
# flake.nixまたはconfiguration.nixで
{
  imports = [ ./config ];
}
```

この設定により、モダンで高機能な Neovim 環境が構築されます。
