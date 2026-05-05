{
  pkgs,
  ...
}:
{
  colorschemes.tokyonight = {
    enable = true;
    # 必要に応じて設定を追加
    settings = {
      style = "night"; # "storm", "night", "day" から選択
      transparent_sidebar = true;
    };
  };
}
