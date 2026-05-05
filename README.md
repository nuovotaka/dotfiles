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

## キーマップ

## Neovim キーマップ一覧 (nixvim)

`<leader>` キーは **Space** に設定されています。

## 📁 ファイル操作・ファイラ

| キー         | モード | アクション              | 内容                               |
| :----------- | :----: | :---------------------- | :--------------------------------- |
| `<leader>e`  |   n    | `Snacks.explorer()`     | ファイルエクスプローラーを開く     |
| `<leader>fm` |   n    | `Yazi`                  | 高速ターミナルファイラ Yazi を起動 |
| `<leader>ff` |   n    | `Snacks.picker.files()` | ファイル名で検索                   |
| `<C-s>`      |   n    | `ASToggle`              | **自動保存**の有効/無効を切り替え  |

## 📑 バッファ・タブ管理 (BufferLine)

| キー           | モード | アクション                | 内容                         |
| :------------- | :----: | :------------------------ | :--------------------------- |
| `]b` / `<S-l>` |   n    | `BufferLineCycleNext`     | **次のバッファ**（右）へ移動 |
| `[b` / `<S-h>` |   n    | `BufferLineCyclePrev`     | **前のバッファ**（左）へ移動 |
| `<leader>bd`   |   n    | `bdelete`                 | 現在のバッファを閉じる       |
| `<leader>bp`   |   n    | `BufferLineTogglePin`     | バッファをピン留めする       |
| `<leader>bo`   |   n    | `BufferLineCloseOthers`   | 他のバッファをすべて閉じる   |
| `<leader>bl`   |   n    | `BufferLineCloseLeft`     | 左側のバッファをすべて閉じる |
| `<leader>bP`   |   n    | `BufferLineGroupClose`    | ピン留め以外をすべて閉じる   |
| `<leader>fb`   |   n    | `Snacks.picker.buffers()` | 開いているバッファを検索     |

## 🔍 検索・履歴

| キー        | モード | アクション                        | 内容                           |
| :---------- | :----: | :-------------------------------- | :----------------------------- |
| `<leader>?` |   n    | `Snacks.picker.grep()`            | プロジェクト内を **Grep 検索** |
| `<leader>p` |   n    | `YankyRingHistory`                | **コピー(ヤンク)履歴**を表示   |
| `<leader>:` |   n    | `Snacks.picker.command_history()` | コマンド実行履歴を検索         |
| `<leader>n` |   n    | `Snacks.picker.notifications()`   | 通知履歴を表示                 |

## 🛠 LSP・コード解析

| キー         | モード | アクション             | 内容                               |
| :----------- | :----: | :--------------------- | :--------------------------------- |
| `gd`         |   n    | `lsp_definitions`      | **定義**へジャンプ                 |
| `gr`         |   n    | `lsp_references`       | **参照**箇所を一覧表示             |
| `gy`         |   n    | `lsp_type_definitions` | **型定義**へジャンプ               |
| `gI`         |   n    | `lsp_implementations`  | 実装箇所へジャンプ                 |
| `<leader>ss` |   n    | `lsp_symbols`          | ファイル内のシンボル検索           |
| `<leader>o`  |   n    | `AerialToggle`         | コード構造の **アウトライン** 表示 |

## 🌿 Git 操作

| キー         | モード | アクション                   | 内容                     |
| :----------- | :----: | :--------------------------- | :----------------------- |
| `<leader>gg` |   n    | `LazyGit`                    | **LazyGit** を起動       |
| `<leader>gl` |   n    | `Snacks.picker.git_log`      | Git コミットログを表示   |
| `<leader>gs` |   n    | `Snacks.picker.git_status`   | Git ステータスを表示     |
| `<leader>gb` |   n    | `Snacks.picker.git_branches` | Git ブランチ一覧         |
| `<leader>gB` |   n    | `Snacks.gitbrowse()`         | ブラウザで現在の行を開く |

## 🏗 編集補助・その他

| キー         | モード | アクション    | 内容                                 |
| :----------- | :----: | :------------ | :----------------------------------- |
| `<C-t>`      |  n, t  | `ToggleTerm`  | **ターミナル**の表示/非表示 (Ctrl+t) |
| `<leader>m`  |   n    | `TSJToggle`   | コードの 1 行/複数行を切り替え       |
| `<leader>s`  |   n    | `TSJSplit`    | コードを複数行に分割                 |
| `<leader>j`  |   n    | `TSJJoin`     | コードを 1 行に結合                  |
| `<leader>zm` |   n    | `ZenMode`     | **集中モード** (余計な表示を消す)    |
| `<leader>Rs` |  n, v  | `SendRequest` | HTTP リクエストを送信 (Kulala)       |
| `<leader>wa` |   n    | `Wtf`         | エラー箇所の AI 診断・解決           |
| `<leader>qq` |   n    | `qa`          | Neovim を終了                        |
