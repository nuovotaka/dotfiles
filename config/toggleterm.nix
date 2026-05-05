{ pkgs, ... }:
{
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts = {
        border = "curved";
        height = 30;
        width = 130;
      };
      open_mapping = "[[<c-t>]]";
      autochdir = true;
      auto_scroll = true;
      close_on_exit = true;
      insert_mappings = true;
      shell = "nu";
    };
  };
}
