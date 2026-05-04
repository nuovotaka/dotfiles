# 基本的なプラグイン設定
{
  plugins = {
    # LSP設定
    lsp = {
      enable = true;
      servers = {
        # Nix言語サーバー
        nil_ls = {
          enable = true;
        };
        
        # Lua言語サーバー
        lua_ls = {
          enable = true;
        };
        
        # TypeScript/JavaScript
        ts_ls = {
          enable = true;
        };
        
        # Python
        pyright = {
          enable = true;
        };
        
        # Go
        gopls = {
          enable = true;
        };
        
        # JSON
        jsonls = {
          enable = true;
        };
        
        # YAML
        yamlls = {
          enable = true;
        };
        
        # HTML
        html = {
          enable = true;
        };
        
        # Markdown
        marksman = {
          enable = true;
        };
      };
      
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
        };
      };
    };

    # Treesitter - シンタックスハイライト
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
        };
        indent = {
          enable = true;
        };
        ensure_installed = [
          "bash"
          "c"
          "cpp"
          "css"
          "go"
          "html"
          "javascript"
          "json"
          "lua"
          "markdown"
          "nix"
          "python"
          "rust"
          "typescript"
          "yaml"
        ];
      };
    };

    # Telescope - ファジーファインダー
    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Find Files";
          };
        };
        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Live Grep";
          };
        };
        "<leader>fb" = {
          action = "buffers";
          options = {
            desc = "Find Buffers";
          };
        };
        "<leader>fh" = {
          action = "help_tags";
          options = {
            desc = "Help Tags";
          };
        };
      };
    };

    # Neo-tree - ファイルエクスプローラー
    neo-tree = {
      enable = true;
    };

    # Which-key - キーバインドヘルプ
    which-key = {
      enable = true;
    };

    # Git統合
    gitsigns = {
      enable = true;
    };

    # ステータスライン
    lualine = {
      enable = true;
    };

    # バッファライン
    bufferline = {
      enable = true;
    };

    # 補完
    cmp = {
      enable = true;
      settings = {
        snippet = {
          expand = "luasnip";
        };
        mapping = {
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };

    # 補完ソース
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };

    # スニペット
    luasnip = {
      enable = true;
    };

    # インデントガイド
    indent-blankline = {
      enable = true;
    };

    # 自動ペア
    nvim-autopairs = {
      enable = true;
    };
  };
}