# カラースキーム設定
{
  plugins = {
    catppuccin = {
      enable = true;
      settings = {
        flavour = "macchiato"; # "latte", "frappe", "macchiato", "mocha"
        transparent_background = true;
        integrations = {
          cmp = true;
          gitsigns = true;
          neotree = true;
          treesitter = true;
          telescope = {
            enabled = true;
          };
          which_key = true;
          indent_blankline = {
            enabled = true;
          };
          native_lsp = {
            enabled = true;
            virtual_text = {
              errors = [ "italic" ];
              hints = [ "italic" ];
              warnings = [ "italic" ];
              information = [ "italic" ];
            };
            underlines = {
              errors = [ "underline" ];
              hints = [ "underline" ];
              warnings = [ "underline" ];
              information = [ "underline" ];
            };
          };
        };
      };
    };
  };
}