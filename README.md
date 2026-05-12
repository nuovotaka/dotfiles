# dotfiles

MacOS(Apple Silicon)のみに対応しています。

パッケージ管理: [Nix](https://nixos.org/)

1. Xcode Command Line Tools をインストール
2. [nix-installer](https://github.com/DeterminateSystems/nix-installer) を使って Nix をインストール
3. [Homebrew](https://brew.sh/) をインストール
4. このリポジトリをクローン
5. アプリのマニュアルインストール（dock にアプリを nix を使用して配置しているので先にインストールが必要）
6. クローンしたディレクトリで `nix run` を実行

---

## システムとパッケージの更新

```
task update
task switch
```

## マニュアルインストール

- [wezterm](https://wezterm.org/index.html)
- [1password](https://1password.com/jp)
- [github-desktop](https://github.com/apps/desktop)
- [dia](https://www.diabrowser.com/)
- [kiro](https://kiro.dev/)
- [kicad](https://www.kicad.org/)
- [blender launcher](https://github.com/Victor-IX/Blender-Launcher-V2)
- [tradingview](https://jp.tradingview.com/desktop/)
- [affinity](https://www.affinity.studio/ja_jp/download)
- [Bambu studio](https://bambulab.com/ja-jp/download/studio)
- [kindle](https://www.amazon.co.jp/gp/browse.html?ref_=sv_nav_ebook_10&_encoding=UTF8&node=26197586051&ref=kcp_fd_hz)
- [leathercraftCAD](https://coffee-craft.net/leathercraft_cad)
- [orcaslicer](https://www.orcaslicer.com/)

### その他

- [kitty icon](https://github.com/DinkDonk/kitty-icon)

---

# Neovim キーマップ一覧 (nixvim)

`<leader>` キーは **Space** に設定されています。

## � ファジーファ・インダー (Telescope)

| キー         | モード | アクション                        | 内容                         |
| :----------- | :----: | :-------------------------------- | :--------------------------- |
| `<leader>ff` |   n    | `Telescope find_files`            | ファイル検索                 |
| `<leader>fg` |   n    | `Telescope live_grep`             | プロジェクト内文字列検索     |
| `<leader>fb` |   n    | `Telescope buffers`               | バッファ検索                 |
| `<leader>fh` |   n    | `Telescope help_tags`             | ヘルプ検索                   |
| `<leader>fr` |   n    | `Telescope oldfiles`              | 最近使ったファイル           |
| `<leader>fc` |   n    | `Telescope grep_string`           | カーソル下の文字列で検索     |
| `<leader>fm` |   n    | `Telescope marks`                 | マーク一覧                   |
| `<leader>fk` |   n    | `Telescope keymaps`               | キーマップ検索               |
| `<leader>fs` |   n    | `Telescope lsp_document_symbols`  | ファイル内シンボル検索       |
| `<leader>fS` |   n    | `Telescope lsp_workspace_symbols` | ワークスペース内シンボル検索 |
| `<leader>fd` |   n    | `Telescope diagnostics`           | 診断情報検索                 |
| `<leader>ft` |   n    | `TodoTelescope`                   | Todo 検索                    |
| `<leader>fp` |   n    | `Telescope projects`              | プロジェクト検索             |

## 📁 ファイル管理・ナビゲーション

| キー         | モード | アクション       | 内容                               |
| :----------- | :----: | :--------------- | :--------------------------------- |
| `<leader>e`  |   n    | `Neotree toggle` | Neo-tree ファイルエクスプローラー  |
| `<leader>E`  |   n    | `Neotree focus`  | Neo-tree にフォーカス              |
| `-`          |   n    | `Oil`            | Oil ファイルエディタ               |
| `<leader>fm` |   n    | `Yazi`           | 高速ターミナルファイラ Yazi を起動 |
| `<C-s>`      |   n    | `ASToggle`       | **自動保存**の有効/無効を切り替え  |

## 🎯 高速ナビゲーション (Flash & Harpoon)

| キー         | モード | アクション                | 内容                       |
| :----------- | :----: | :------------------------ | :------------------------- |
| `s`          | n,x,o  | `Flash jump`              | 高速ジャンプ               |
| `S`          | n,x,o  | `Flash treesitter`        | Treesitter ノードジャンプ  |
| `r`          |   o    | `Flash remote`            | リモートジャンプ           |
| `R`          |  o,x   | `Flash treesitter_search` | Treesitter 検索ジャンプ    |
| `<C-s>`      |   c    | `Flash toggle`            | Flash 検索トグル           |
| `<leader>a`  |   n    | `Harpoon add`             | ファイルをハープーンに追加 |
| `<C-e>`      |   n    | `Harpoon menu`            | ハープーンメニュー         |
| `<C-h>`      |   n    | `Harpoon file 1`          | ハープーンファイル 1       |
| `<C-t>`      |   n    | `Harpoon file 2`          | ハープーンファイル 2       |
| `<C-n>`      |   n    | `Harpoon file 3`          | ハープーンファイル 3       |
| `<leader>hm` |   n    | `Telescope harpoon marks` | ハープーンマーク検索       |

## 📑 バッファ・タブ管理 (BufferLine)

| キー           | モード | アクション              | 内容                         |
| :------------- | :----: | :---------------------- | :--------------------------- |
| `]b` / `<S-l>` |   n    | `BufferLineCycleNext`   | **次のバッファ**（右）へ移動 |
| `[b` / `<S-h>` |   n    | `BufferLineCyclePrev`   | **前のバッファ**（左）へ移動 |
| `<leader>bd`   |   n    | `bdelete`               | 現在のバッファを閉じる       |
| `<leader>bp`   |   n    | `BufferLineTogglePin`   | バッファをピン留めする       |
| `<leader>bo`   |   n    | `BufferLineCloseOthers` | 他のバッファをすべて閉じる   |
| `<leader>bl`   |   n    | `BufferLineCloseLeft`   | 左側のバッファをすべて閉じる |
| `<leader>bP`   |   n    | `BufferLineGroupClose`  | ピン留め以外をすべて閉じる   |

## 🔍 検索・置換 (Spectre, Grug-far)

| キー         | モード | アクション            | 内容                          |
| :----------- | :----: | :-------------------- | :---------------------------- |
| `<leader>S`  |   n    | `Spectre toggle`      | プロジェクト全体検索・置換    |
| `<leader>sw` |  n,v   | `Spectre search word` | カーソル下/選択中の単語を検索 |
| `<leader>sp` |   n    | `Spectre search file` | 現在のファイル内で検索        |
| `<leader>ro` |   n    | `GrugFar`             | 高速な全体検索・置換          |

## 🛠 LSP・コード解析・診断 (Trouble)

| キー         | モード | アクション                   | 内容                               |
| :----------- | :----: | :--------------------------- | :--------------------------------- |
| `gd`         |   n    | `lsp_definitions`            | **定義**へジャンプ                 |
| `gr`         |   n    | `lsp_references`             | **参照**箇所を一覧表示             |
| `gy`         |   n    | `lsp_type_definitions`       | **型定義**へジャンプ               |
| `gI`         |   n    | `lsp_implementations`        | 実装箇所へジャンプ                 |
| `<leader>ss` |   n    | `lsp_symbols`                | ファイル内のシンボル検索           |
| `<leader>o`  |   n    | `AerialToggle`               | コード構造の **アウトライン** 表示 |
| `<leader>xx` |   n    | `Trouble diagnostics`        | 診断情報表示                       |
| `<leader>xX` |   n    | `Trouble buffer diagnostics` | バッファ診断情報表示               |
| `<leader>cs` |   n    | `Trouble symbols`            | シンボル表示                       |
| `<leader>cl` |   n    | `Trouble lsp`                | LSP 定義・参照表示                 |
| `<leader>xL` |   n    | `Trouble loclist`            | ロケーションリスト表示             |
| `<leader>xQ` |   n    | `Trouble qflist`             | クイックフィックスリスト表示       |
| `<leader>xt` |   n    | `TodoTrouble`                | Todo リストを Trouble で表示       |

## 🌿 Git 操作 (Gitsigns, Diffview, Neogit)

| キー         | モード | アクション                   | 内容                     |
| :----------- | :----: | :--------------------------- | :----------------------- |
| `<leader>gg` |   n    | `Neogit`                     | **Neogit** を起動        |
| `<leader>gc` |   n    | `Neogit commit`              | Neogit コミット          |
| `<leader>gd` |   n    | `DiffviewOpen`               | **Diffview** を開く      |
| `<leader>gh` |   n    | `DiffviewFileHistory`        | ファイル履歴表示         |
| `<leader>gl` |   n    | `Snacks.picker.git_log`      | Git コミットログを表示   |
| `<leader>gs` |   n    | `Snacks.picker.git_status`   | Git ステータスを表示     |
| `<leader>gb` |   n    | `Snacks.picker.git_branches` | Git ブランチ一覧         |
| `<leader>gB` |   n    | `Snacks.gitbrowse()`         | ブラウザで現在の行を開く |

## 🧪 テスト・デバッグ (Neotest, DAP)

| キー         | モード | アクション                   | 内容                     |
| :----------- | :----: | :--------------------------- | :----------------------- |
| `<leader>tt` |   n    | `Neotest run`                | テスト実行               |
| `<leader>tT` |   n    | `Neotest run file`           | ファイル内全テスト実行   |
| `<leader>td` |   n    | `Neotest debug`              | テストデバッグ           |
| `<leader>ts` |   n    | `Neotest summary`            | テストサマリー表示       |
| `<leader>to` |   n    | `Neotest output`             | テスト出力表示           |
| `<leader>tO` |   n    | `Neotest output panel`       | テスト出力パネル         |
| `<leader>tS` |   n    | `Neotest stop`               | テスト停止               |
| `<leader>db` |   n    | `DAP toggle breakpoint`      | ブレークポイント切り替え |
| `<leader>dB` |   n    | `DAP conditional breakpoint` | 条件付きブレークポイント |
| `<leader>dc` |   n    | `DAP continue`               | デバッグ継続             |
| `<leader>di` |   n    | `DAP step into`              | ステップイン             |
| `<leader>do` |   n    | `DAP step out`               | ステップアウト           |
| `<leader>dO` |   n    | `DAP step over`              | ステップオーバー         |
| `<leader>du` |   n    | `DAP UI toggle`              | デバッグ UI 表示切り替え |
| `<leader>de` |  n,v   | `DAP eval`                   | 式評価                   |

## 🌐 HTTP・REST (Rest.nvim)

| キー         | モード | アクション      | 内容                       |
| :----------- | :----: | :-------------- | :------------------------- |
| `<leader>rr` |   n    | `Rest run`      | カーソル下のリクエスト実行 |
| `<leader>rl` |   n    | `Rest run last` | 最後のリクエスト再実行     |

## 📝 マークダウン

| キー         | モード | アクション              | 内容                             |
| :----------- | :----: | :---------------------- | :------------------------------- |
| `<leader>mp` |   n    | `MarkdownPreview`       | マークダウンプレビュー開始       |
| `<leader>ms` |   n    | `MarkdownPreviewStop`   | マークダウンプレビュー停止       |
| `<leader>mt` |   n    | `MarkdownPreviewToggle` | マークダウンプレビュー切り替え   |
| `<leader>mr` |   n    | `RenderMarkdown toggle` | マークダウンレンダリング切り替え |

## 📦 TypeScript・Node.js (TypeScript Tools, Package Info)

| キー          | モード | アクション                    | 内容                       |
| :------------ | :----: | :---------------------------- | :------------------------- |
| `<leader>tso` |   n    | `TSToolsOrganizeImports`      | インポート整理             |
| `<leader>tss` |   n    | `TSToolsSortImports`          | インポートソート           |
| `<leader>tsr` |   n    | `TSToolsRemoveUnusedImports`  | 未使用インポート削除       |
| `<leader>tsd` |   n    | `TSToolsGoToSourceDefinition` | ソース定義へジャンプ       |
| `<leader>tsR` |   n    | `TSToolsRenameFile`           | ファイル名変更             |
| `<leader>tsf` |   n    | `TSToolsFileReferences`       | ファイル参照表示           |
| `<leader>ns`  |   n    | `PackageInfo show`            | 依存関係バージョン表示     |
| `<leader>nc`  |   n    | `PackageInfo hide`            | 依存関係バージョン非表示   |
| `<leader>nt`  |   n    | `PackageInfo toggle`          | 依存関係バージョン切り替え |
| `<leader>nu`  |   n    | `PackageInfo update`          | 依存関係更新               |
| `<leader>nd`  |   n    | `PackageInfo delete`          | 依存関係削除               |
| `<leader>ni`  |   n    | `PackageInfo install`         | 新しい依存関係インストール |
| `<leader>np`  |   n    | `PackageInfo change_version`  | 依存関係バージョン変更     |

## 🤖 AI 支援 (Codeium)

| キー    | モード | アクション       | 内容                   |
| :------ | :----: | :--------------- | :--------------------- |
| `<Tab>` |   i    | `Codeium Accept` | 提案されたコードを確定 |
| `<C-]>` |   i    | `Codeium Next`   | 次の提案へ             |
| `<C-[>` |   i    | `Codeium Prev`   | 前の提案へ             |
| `<C-x>` |   i    | `Codeium Clear`  | 提案を消去             |

## 📂 セッション・プロジェクト管理 (Persistence, Project.nvim)

| キー         | モード | アクション                         | 内容                                 |
| :----------- | :----: | :--------------------------------- | :----------------------------------- |
| `<leader>qs` |   n    | `persistence load`                 | 現在のディレクトリのセッションを復元 |
| `<leader>ql` |   n    | `persistence load { last = true }` | 最後のセッションを復元               |
| `<leader>qd` |   n    | `persistence stop`                 | 現在のセッションを保存しない         |
| `<leader>fp` |   n    | `Telescope projects`               | プロジェクト検索                     |

## 🏗 編集補助・その他

| キー         | モード | アクション                        | 内容                                 |
| :----------- | :----: | :-------------------------------- | :----------------------------------- |
| `<C-t>`      |  n, t  | `ToggleTerm`                      | **ターミナル**の表示/非表示 (Ctrl+t) |
| `<leader>m`  |   n    | `TSJToggle`                       | コードの 1 行/複数行を切り替え       |
| `<leader>s`  |   n    | `TSJSplit`                        | コードを複数行に分割                 |
| `<leader>j`  |   n    | `TSJJoin`                         | コードを 1 行に結合                  |
| `<leader>zm` |   n    | `ZenMode`                         | **集中モード** (余計な表示を消す)    |
| `<leader>Rs` |  n, v  | `SendRequest`                     | HTTP リクエストを送信 (Kulala)       |
| `<leader>wa` |   n    | `Wtf`                             | エラー箇所の AI 診断・解決           |
| `<leader>qq` |   n    | `qa`                              | Neovim を終了                        |
| `<leader>p`  |   n    | `YankyRingHistory`                | **コピー(ヤンク)履歴**を表示         |
| `<leader>:`  |   n    | `Snacks.picker.command_history()` | コマンド実行履歴を検索               |
| `<leader>n`  |   n    | `Snacks.picker.notifications()`   | 通知履歴を表示                       |

---

## 🎨 プラグイン一覧

### ファイル管理・ナビゲーション

- **Telescope** - ファジーファインダー
- **Neo-tree** - ファイルエクスプローラー
- **Harpoon** - 頻繁に使うファイルへの高速アクセス
- **Oil** - バッファライクなファイル編集
- **Yazi** - ターミナルファイルマネージャー

### UI・見た目

- **Alpha** - スタートスクリーン
- **Dressing** - UI 要素の改善
- **Indent Blankline** - インデントガイド
- **Colorizer** - カラーコードのハイライト
- **BufferLine** - タブライン
- **Noice** - コマンドライン・通知 UI 改善

### 編集効率

- **Flash** - 高速ナビゲーション
- **Mini.nvim** - 軽量プラグイン集（surround, comment, pairs, ai）
- **Spectre** - プロジェクト全体の検索・置換
- **Grug-far** - 高速なプロジェクト全体検索・置換
- **Trouble** - 診断・参照の統合表示
- **Todo-comments** - TODO コメントのハイライトと検索
- **Yanky** - ヤンク履歴管理

### Git 統合

- **Gitsigns** - Git 差分表示
- **Diffview** - Git 差分の視覚化
- **Neogit** - Magit 風の Git インターフェース

### 開発支援

- **LSP** - 言語サーバープロトコル
- **Blink.cmp** - 補完エンジン
- **Codeium** - AI コード補完
- **Conform** - フォーマッター
- **Neotest** - テストランナー統合
- **DAP** - デバッガー
- **Rest.nvim** - HTTP クライアント
- **Persistence** - セッション管理
- **Project-nvim** - プロジェクト管理

### 言語固有

- **TypeScript Tools** - TypeScript 専用 LSP
- **Package Info** - package.json 依存関係表示
- **Markdown Preview** - マークダウンプレビュー
- **Render Markdown** - マークダウンレンダリング
- **Crates** - Rust Cargo.toml 管理
