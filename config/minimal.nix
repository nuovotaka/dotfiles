# 最小限のnixvim設定
{
  # グローバル設定
  globals.mapleader = " ";

  # 基本設定
  opts = {
    number = true;
    relativenumber = true;
    clipboard = "unnamedplus";
    tabstop = 2;
    softtabstop = 2;
    expandtab = true;
    smartindent = true;
    shiftwidth = 2;
    breakindent = true;
    cursorline = true;
    scrolloff = 8;
    mouse = "a";
    termguicolors = true;
    showmode = false;
    splitbelow = true;
    splitright = true;
  };

  # 基本的なキーマップ
  keymaps = [
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr>";
      options = {
        desc = "Save File";
      };
    }
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options = {
        desc = "Quit All";
      };
    }
  ];

  # 基本的なプラグイン
  plugins = {
    # LSP
    lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        nil_ls.enable = true;
      };
    };

    # Treesitter
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    # Telescope
    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
      };
    };

    # Neo-tree
    neo-tree = {
      enable = true;
    };

    # Which-key
    which-key = {
      enable = true;
    };
  };
}