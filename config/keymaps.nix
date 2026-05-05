{ pkgs, ... }:
{
  keymaps = [
    # --- デフォルト・基本操作 ---
    {
      key = "<leader>p";
      mode = [ "n" ];
      action = "<cmd>YankyRingHistory<CR>"; # ヤンク（コピー）履歴を表示
    }
    {
      key = "<leader>qq";
      mode = [ "n" ];
      action = "<cmd>qa<CR>"; # 全てのバッファを閉じてNeovimを終了
    }

    # --- aerial.nix (コード構造ののアウトライン表示) ---
    {
      key = "<leader>o";
      mode = [ "n" ];
      action = "<cmd>AerialToggle<CR>"; # クラスや関数のシンボル一覧（アウトライン）をトグル
    }

    # --- autosave.nix (自動保存) ---
    {
      key = "<C-s>";
      mode = [ "n" ];
      action = "<cmd>ASToggle<CR>"; # 自動保存機能の有効/無効を切り替え
    }

    # --- bufferline.nix (上部タブ・バッファ管理) ---
    {
      mode = [ "n" ];
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = { desc = "次のバッファへ移動"; };
    }
    {
      mode = [ "n" ];
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = { desc = "前のバッファへ移動"; };
    }
    {
      mode = ["n"];
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = { desc = "次のバッファへ移動 (Shift+l)"; };
    }
    {
      mode = ["n"];
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = { desc = "前のバッファへ移動 (Shift+h)"; };
    }
    {
      mode = ["n"];
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = { desc = "現在のバッファを削除"; };
    }
    {
      mode = ["n"];
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = { desc = "左側のバッファをすべて閉じる"; };
    }
    {
      mode = ["n"];
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = { desc = "他のバッファをすべて閉じる"; };
    }
    {
      mode = ["n"];
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = { desc = "バッファのピン留めを切り替え"; };
    }
    {
      mode = ["n"];
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = { desc = "ピン留めされていないバッファをすべて閉じる"; };
    }

    # --- kulala.nix (HTTPクライアント/REST APIテスト) ---
    {
      key = "<leader>Rs";
      mode = [ "n" "v" ];
      action = "<cmd>SendRequest<CR>"; # 現在のHTTPリクエストを送信
    }
    {
      key = "<leader>Ra";
      mode = [ "n" "v" ];
      action = "<cmd>SendAllRequests<CR>"; # ファイル内の全リクエストを送信
    }
    {
      key = "<leader>Rb";
      mode = [ "n" "v" ];
      action = "<cmd>OpenScratchpad<CR>"; # クラスパット（下書き）を開く
    }

    # --- lazygit.nix (Git TUI) ---
    {
      key = "<leader>gg";
      mode = [ "n" ];
      action = "<cmd>LazyGit<CR>"; # LazyGitの画面を起動
      options = { silent = true; noremap = true; };
    }

    # --- nix-develop.nix (Nix環境連携) ---
    {
      key = "<leader>nd";
      mode = [ "n" ];
      action = "<cmd>NixDevelop<CR>"; # nix develop シェル環境を起動
    }

    # --- snacks.nix (多機能ユーティリティ/ファイラ/ピッカー) ---
    {
      key = "<leader>e";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.explorer()<CR>"; # ファイルエクスプローラーを開く
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>?";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.grep()<CR>"; # プロジェクト内をGrep検索 (Live Grep)
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>n";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.notifications()<CR>"; # 通知履歴を表示
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>fb";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.buffers()<CR>"; # 開いているバッファを検索・選択
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>ff";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.files()<CR>"; # ファイル名で検索
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>gl";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_log()<CR>"; # Gitのコミットログを表示
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>gb";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_branches()<CR>"; # Gitブランチを検索・切替
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>gB";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.gitbrowse()<CR>"; # ブラウザで現在の行をGitHubなどで開く
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>gs";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_status()<CR>"; # Gitのステータス（変更ファイル）を表示
      options = { silent = true; noremap = true; };
    }
    {
      key = "<leader>uC";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.colorschemes()<CR>"; # カラースキームを選択・変更
    }
    {
      key = "<leader>:";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.command_history()<CR>"; # コマンド履歴を検索
    }
    {
      key = "gd";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>"; # 定義へジャンプ
    }
    {
      key = "gD";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>"; # 宣言へジャンプ
    }
    {
      key = "gr";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_references()<CR>"; # 参照箇所を一覧表示
    }
    {
      key = "gI";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>"; # 実装箇所へジャンプ
    }
    {
      key = "gy";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>"; # 型定義へジャンプ
    }
    {
      key = "<leader>ss";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>"; # 現在のファイルのLSPシンボルを検索
    }
    {
      key = "<leader>sS";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>"; # ワークスペース全体のLSPシンボルを検索
    }

    # --- toggleterm.nix (ターミナル) ---
    {
      key = "<C-t>";
      mode = [ "n" "t" ];
      action = "<cmd>ToggleTerm<CR>"; # ターミナルの表示/非表示を切り替え
      options = { silent = true; noremap = true; };
    }

    # --- treesj.nix (コードの結合/分割) ---
    {
      mode = ["n"];
      key = "<leader>m";
      action = "<cmd>TSJToggle<CR>"; # コードの1行/複数行をトグル
    }
    {
      mode = ["n"];
      key = "<leader>s";
      action = "<cmd>TSJSplit<CR>"; # コードを複数行に分割
    }
    {
      mode = ["n"];
      key = "<leader>j";
      action = "<cmd>TSJJoin<CR>"; # コードを1行に結合
    }

    # --- wtf.nix (診断エラーの検索/解決) ---
    {
      key = "<leader>wa";
      mode = [ "n" ];
      action = "<cmd>Wtf<CR>"; # 現在のエラーをAI等で診断
    }
    {
      key = "<leader>ws";
      mode = [ "n" ];
      action = "<cmd>WtfSearch google<CR>"; # エラー内容をGoogleで検索
    }
    {
      key = "<leader>wh";
      mode = [ "n" ];
      action = "<cmd>WtfHistory<CR>"; # 診断履歴を表示
    }
    {
      key = "<leader>wg";
      mode = [ "n" ];
      action = "<cmd>WtfGrepHistory<CR>"; # Grep履歴を表示
    }

    # --- yazi.nix (高速ターミナルファイラ) ---
    {
      key = "<leader>fm";
      mode = [ "n" ];
      action = "<cmd>Yazi<CR>"; # Yaziファイラを起動
    }

    # --- zen-mode.nix (集中モード) ---
    {
      key = "<leader>zm";
      mode = [ "n" ];
      action = "<cmd>ZenMode<CR>"; # 執筆/コーディング集中モードの切り替え
    }
  ];
}
