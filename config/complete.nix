# 完全なnixvim設定 - 拡張プラグイン統合版
{ pkgs, ... }:
{
  # 基本設定（settings.nixから統合）
  opts = {
    # 行番号
    number = true;
    relativenumber = true;
    
    # クリップボード
    clipboard = "unnamedplus";
    
    # インデント
    tabstop = 2;
    softtabstop = 2;
    expandtab = true;
    smartindent = true;
    shiftwidth = 2;
    breakindent = true;
    
    # 表示
    cursorline = true;
    scrolloff = 8;
    termguicolors = true;
    showmode = false;
    showtabline = 2;
    
    # 分割
    splitbelow = true;
    splitright = true;
    splitkeep = "screen";
    
    # その他
    mouse = "a";
    timeoutlen = 300;
    swapfile = false;
    foldmethod = "manual";
    foldenable = false;
    linebreak = true;
    spell = false;
    cmdheight = 0;
    fillchars = {
      eob = " ";
    };
  };

  # カラースキーム（拡張版）
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };
        custom_highlights = ''
          function(highlights)
            return {
            CursorLineNr = { fg = highlights.peach, style = {} },
            NavicText = { fg = highlights.text },
            }
          end
        '';
        flavour = "macchiato";
        no_bold = false;
        no_italic = false;
        no_underline = false;
        transparent_background = true;
        integrations = {
          cmp = true;
          notify = true;
          gitsigns = true;
          neotree = true;
          which_key = true;
          illuminate = {
            enabled = true;
            lsp = true;
          };
          navic = {
            enabled = true;
            custom_bg = "NONE";
          };
          treesitter = true;
          telescope.enabled = true;
          indent_blankline.enabled = true;
          mini = {
            enabled = true;
            indentscope_color = "rosewater";
          };
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = [ "italic" ];
              hints = [ "italic" ];
              information = [ "italic" ];
              warnings = [ "italic" ];
              ok = [ "italic" ];
            };
            underlines = {
              errors = [ "underline" ];
              hints = [ "underline" ];
              information = [ "underline" ];
              warnings = [ "underline" ];
            };
          };
        };
      };
    };
  };

  # プラグイン（拡張版）
  plugins = {
    # LSP設定（拡張版）
    lsp-lines = {
      enable = true;
    };
    lsp-format = {
      enable = true;
    };
    helm = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        html = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        nil_ls = {
          enable = true;
        };
        ts_ls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
        gopls = {
          enable = true;
        };
        terraformls = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        helm_ls = {
          enable = true;
          extraOptions = {
            settings = {
              "helm_ls" = {
                yamlls = {
                  path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
                };
              };
            };
          };
        };
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  kubernetes = "'*.yaml";
                  "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                  "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                  "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
                  "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
                  "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
                  "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                  "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                    "*docker-compose*.{yml,yaml}";
                  "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" =
                    "*flow*.{yml,yaml}";
                };
              };
            };
          };
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
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
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
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };

    # Treesitter - シンタックスハイライト（拡張版）
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
      folding.enable = false;
      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };

    treesitter-textobjects = {
      enable = true;
      settings = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "aa" = "@parameter.outer";
            "ia" = "@parameter.inner";
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "ii" = "@conditional.inner";
            "ai" = "@conditional.outer";
            "il" = "@loop.inner";
            "al" = "@loop.outer";
            "at" = "@comment.outer";
          };
        };
        move = {
          enable = true;
          goto_next_start = {
            "]m" = "@function.outer";
            "]]" = "@class.outer";
          };
          goto_next_end = {
            "]M" = "@function.outer";
            "][" = "@class.outer";
          };
          goto_previous_start = {
            "[m" = "@function.outer";
            "[[" = "@class.outer";
          };
          goto_previous_end = {
            "[M" = "@function.outer";
            "[]" = "@class.outer";
          };
        };
        swap = {
          enable = true;
          swap_next = {
            "<leader>a" = "@parameters.inner";
          };
          swap_previous = {
            "<leader>A" = "@parameter.outer";
          };
        };
      };
    };

    # Telescope - ファジーファインダー（拡張版）
    telescope = {
      enable = true;
      extensions = {
        file-browser = {
          enable = true;
        };
        fzf-native = {
          enable = true;
        };
      };
      settings = {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top";
            };
          };
          sorting_strategy = "ascending";
        };
      };
      keymaps = {
        "<leader><space>" = {
          action = "find_files";
          options = {
            desc = "Find project files";
          };
        };
        "<leader>/" = {
          action = "live_grep";
          options = {
            desc = "Grep (root dir)";
          };
        };
        "<leader>:" = {
          action = "command_history";
          options = {
            desc = "Command History";
          };
        };
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Find project files";
          };
        };
        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Find text";
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
        "<leader>fr" = {
          action = "oldfiles";
          options = {
            desc = "Recent files";
          };
        };
        "<C-p>" = {
          action = "git_files";
          options = {
            desc = "Search git files";
          };
        };
        "<leader>gc" = {
          action = "git_commits";
          options = {
            desc = "Git Commits";
          };
        };
        "<leader>gs" = {
          action = "git_status";
          options = {
            desc = "Git Status";
          };
        };
        "<leader>sh" = {
          action = "help_tags";
          options = {
            desc = "Help pages";
          };
        };
        "<leader>sk" = {
          action = "keymaps";
          options = {
            desc = "Keymaps";
          };
        };
        "<leader>sc" = {
          action = "commands";
          options = {
            desc = "Commands";
          };
        };
        "<leader>uC" = {
          action = "colorscheme";
          options = {
            desc = "Colorscheme preview";
          };
        };
      };
    };

    # Neo-tree - ファイルエクスプローラー（拡張版）
    neo-tree = {
      enable = true;
      settings = {
        sources = [
          "filesystem"
          "buffers"
          "git_status"
          "document_symbols"
        ];
        add_blank_line_at_top = false;
        filesystem = {
          bind_to_cwd = false;
          follow_current_file = {
            enabled = true;
          };
        };
        default_component_configs = {
          indent = {
            with_expanders = true;
            expander_collapsed = "󰅂";
            expander_expanded = "󰅀";
            expander_highlight = "NeoTreeExpander";
          };
          git_status = {
            symbols = {
              added = " ";
              conflict = "󰩌 ";
              deleted = "󱂥";
              ignored = " ";
              modified = " ";
              renamed = "󰑕";
              staged = "󰩍";
              unstaged = "";
              untracked = " ";
            };
          };
        };
      };
    };

    # Which-key
    which-key = {
      enable = true;
    };

    # Git統合（拡張版）
    gitsigns = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    # UI（拡張版）
    lualine = {
      enable = true;
      settings = {
        options = {
          globalstatus = true;
          extensions = [
            "fzf"
            "neo-tree"
          ];
          disabledFiletypes = {
            statusline = [
              "startup"
              "alpha"
            ];
          };
          theme = "catppuccin";
        };
        sections = {
          lualine_a = [
            {
              __unkeyed-1 = "mode";
              icon = "";
            }
          ];
          lualine_b = [
            {
              __unkeyed-1 = "branch";
              icon = "";
            }
            {
              __unkeyed-1 = "diff";
              symbols = {
                added = " ";
                modified = " ";
                removed = " ";
              };
            }
          ];
          lualine_c = [
            {
              __unkeyed-1 = "diagnostics";
              sources = [ "nvim_lsp" ];
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
                hint = "󰝶 ";
              };
            }
            {
              __unkeyed-1 = "navic";
            }
          ];
          lualine_x = [
            {
              __unkeyed-1 = "filetype";
              icon_only = true;
              separator = "";
              padding = {
                left = 1;
                right = 0;
              };
            }
            {
              __unkeyed-1 = "filename";
              path = 1;
            }
          ];
          lualine_y = [
            {
              __unkeyed-1 = "progress";
            }
          ];
          lualine_z = [
            {
              __unkeyed-1 = "location";
            }
          ];
        };
      };
    };

    bufferline = {
      enable = true;
    };

    # 補完（拡張版）
    cmp-emoji = {
      enable = true;
    };
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = {
          ghost_text = false;
        };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = {
          expand = "luasnip";
        };
        formatting = {
          fields = [
            "kind"
            "abbr"
            "menu"
          ];
        };
        sources = [
          { name = "git"; }
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          {
            name = "path";
            keywordLength = 3;
          }
          {
            name = "luasnip";
            keywordLength = 3;
          }
        ];
        window = {
          completion = {
            border = "solid";
          };
          documentation = {
            border = "solid";
          };
        };
        mapping = {
          "<C-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    cmp-cmdline.enable = false;

    # スニペット
    luasnip.enable = true;

    # エディター機能（拡張版）
    indent-blankline.enable = true;
    nvim-autopairs.enable = true;
    illuminate.enable = true;
    navic.enable = true;
    todo-comments.enable = true;
    undotree.enable = true;

    # フォーマッター・LSP支援
    conform-nvim.enable = true;
    fidget.enable = true;

    # ユーティリティ
    web-devicons.enable = true;
    toggleterm.enable = true;
    markdown-preview.enable = true;

    # Mini.nvim プラグイン群
    mini = {
      enable = true;
      modules = {
        ai = { };
        surround = { };
        comment = { };
        pairs = { };
        indentscope = { };
      };
    };

    # テーマ（catppuccinは上部のcolorschemes設定に移動）
  };

  # 追加プラグイン
  extraPlugins = with pkgs.vimPlugins; [
    ansible-vim
  ];

  # キーマップ（拡張版）
  keymaps = [
    # Neo-tree
    {
      mode = [ "n" ];
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Open/Close Neotree";
      };
    }
    # Telescope追加キーマップ
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options = {
        desc = "Document diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>Telescope file_browser<cr>";
      options = {
        desc = "File browser";
      };
    }
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>";
      options = {
        desc = "File browser";
      };
    }
    # Lazygit
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<cr>";
      options = {
        desc = "LazyGit";
      };
    }
    # Undotree
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<cr>";
      options = {
        desc = "Undotree";
      };
    }
    # ToggleTerm
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>ToggleTerm<cr>";
      options = {
        desc = "Toggle Terminal";
      };
    }
  ];

  # 追加のLua設定
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
      config = config or {}
      config.border = _border
      return vim.lsp.handlers.hover(err, result, ctx, config)
    end

    vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
      config = config or {}
      config.border = _border
      return vim.lsp.handlers.signature_help(err, result, ctx, config)
    end

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    -- Telescope設定
    require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
    }

    -- CMP設定
    luasnip = require("luasnip")
    kind_icons = {
      Text = "󰊄",
      Method = " ",
      Function = "󰡱 ",
      Constructor = " ",
      Field = " ",
      Variable = "󱀍 ",
      Class = " ",
      Interface = " ",
      Module = "󰕳 ",
      Property = " ",
      Unit = " ",
      Value = " ",
      Enum = " ",
      Keyword = " ",
      Snippet = " ",
      Color = " ",
      File = "",
      Reference = " ",
      Folder = " ",
      EnumMember = " ",
      Constant = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",
    } 

    local cmp = require'cmp'

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({'/', "?" }, {
      sources = {
        { name = 'buffer' }
      }
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
    })

    -- Diagnostic signs
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticHint", linehl = "", numhl = "" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
  '';
}