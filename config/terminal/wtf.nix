{ ... }:
{
  plugins.wtf = {
    enable = true;
  };
  keymaps = [
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
  ];
}
