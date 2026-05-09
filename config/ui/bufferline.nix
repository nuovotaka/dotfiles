{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          diagnostics = "nvim_lsp";
          mode = "buffers";

          close_icon = " ";
          buffer_close_icon = "󰱝 ";
          modified_icon = "󰔯 ";

          offsets = [
            {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            }
          ];
        };
      };
    };
  };
  keymaps = [
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
  ];
}