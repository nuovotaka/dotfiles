{ pkgs, ... }:
{
  keymaps = [
    # default keymaps
    {
      key = "<leader>p";
      mode = [ "n" ];
      action = "<cmd>YankyRingHistory<CR>";
    }
    {
      key = "<leader>qq";
      mode = [ "n" ];
      action = "<cmd>qa<CR>";
    }

    # aerial.nix keymaps
    {
      key = "<leader>o";
      mode = [ "n" ];
      action = "<cmd>AerialToggle<CR>";
    }

    # autosave.nix keymaps
    {
      key = "<C-s>";
      mode = [ "n" ];
      action = "<cmd>ASToggle<CR>";
    }

    # bufferline.nix keymaps
    {
      mode = [ "n" ];
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }
    {
      mode = [ "n" ];
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }
    {
      mode = ["n"];
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }
    {
      mode = ["n"];
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }
    {
      mode = ["n"];
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "Delete buffer";
      };
    }
    {
      mode = ["n"];
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = {
        desc = "Delete buffers to the left";
      };
    }
    {
      mode = ["n"];
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }
    {
      mode = ["n"];
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }
    {
      mode = ["n"];
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }

    # kulala.nix keymaps
    {
      key = "<leader>Rs";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>SendRequest<CR>";
    }
    {
      key = "<leader>Ra";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>SendAllRequests<CR>";
    }
    {
      key = "<leader>Rb";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>OpenScratchpad<CR>";
    }

    # lazygit.nix keymaps
    {
      key = "<leader>gg";
      mode = [ "n" ];
      action = "<cmd>LazyGit<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }

    # nix-develop.nix keymaps
    {
      key = "<leader>nd";
      mode = [ "n" ];
      action = "<cmd>NixDevelop<CR>";
    }

    # snacks.nix keymaps
    {
      key = "<leader>e";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.explorer()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>?";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>n";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.notifications()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>fb";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>ff";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gl";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_log()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gb";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_branches()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gB";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gs";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_status()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>uC";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.colorschemes()<CR>";
    }
    {
      key = "<leader>:";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
    }
    {
      # Goto Definition
      key = "gd";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
    }
    {
      # Goto Declaration
      key = "gD";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>";
    }
    {
      # References
      key = "gr";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
    }
    {
      # Goto Implementation
      key = "gI";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>";
    }
    {
      # Goto Type Definition (gy)
      key = "gy";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
    }

    # LSP Symbols
    {
      key = "<leader>ss";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
    }

    # LSP Workspace Symbols
    {
      key = "<leader>sS";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
    }

    # toggleterm.nix keymaps
    {
      key = "<C-t>";
      mode = [
        "n"
        "t"
      ];
      action = "<cmd>ToggleTerm<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }

    # treesj.nix keymaps
    {
      mode = ["n"];
      key = "<leader>m";
      action = "<cmd>TSJToggle<CR>";
    }
    {
      mode = ["n"];
      key = "<leader>s";
      action = "<cmd>TSJSplit<CR>";
    }
    {
      mode = ["n"];
      key = "<leader>j";
      action = "<cmd>TSJJoin<CR>";
    }

    # wtf.nix keymaps
    {
      key = "<leader>wa";
      mode = [
        "n"
      ];
      action = "<cmd>Wtf<CR>";
    }
    {
      key = "<leader>ws";
      mode = [
        "n"
      ];
      action = "<cmd>WtfSearch google<CR>";
    }
    {
      key = "<leader>wh";
      mode = [
        "n"
      ];
      action = "<cmd>WtfHistory<CR>";
    }
    {
      key = "<leader>wg";
      mode = [
        "n"
      ];
      action = "<cmd>WtfGrepHistory<CR>";
    }

    # yazi.nix keymaps
    {
      key = "<leader>fm";
      mode = [ "n" ];
      action = "<cmd>Yazi<CR>";
    }

    # zen-mode.nix keymaps
    {
      key = "<leader>zm";
      mode = [ "n" ];
      action = "<cmd>ZenMode<CR>";
    }
  ];
}
