{
  pkgs,
  lib,
  config,
  ...
}:
{
  plugins.snacks = {
    enable = true;
    autoLoad = true;
    settings = {
      dashboard = {
        sections = [
          {
            header = ''
                                                                   
                ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
                ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
                ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
                ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
                ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
                ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                                   
            '';
          }
          {
            icon = " ";
            title = "Keymaps";
            section = "keys";
            gap = 1;
            padding = 1;
          }
          {
            icon = " ";
            title = "Find Files";
            __unkeyed-1.__raw = "require('snacks').dashboard.sections.recent_files({cwd = true})";
            gap = 1;
            padding = 1;
          }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            gap = 1;
            padding = 1;
          }
          {
            pane = 1;
            icon = " ";
            desc = "Browse Repo";
            padding = 1;
            key = "b";
            action.__raw = ''
              function()
                Snacks.gitbrowse()
              end'';
          }
          (lib.mkIf config.plugins.lazy.enable { section = "startup"; })
        ];
      };
    };
  };
  keymaps = [
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
  ];
}
