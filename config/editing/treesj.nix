{ ... }:
{
  plugins.treesj = {
    enable = true;
  };
  keymaps = [
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
  ];
}
