{ pkgs, config, lib, ... }:
{
  imports = [
    # ./rustaceanvim.nix
    ./dbee.nix
    ./crates.nix
    ./keymaps.nix
    ./treesitter.nix
    ./toggleterm.nix
    ./themes.nix
    ./lazygit.nix
    ./bufferline.nix
    ./snacks.nix
    ./gitsigns.nix
    ./whichkey.nix
    ./hlchunk.nix
    ./yanky.nix
    ./autopairs.nix
    ./blink-cmp.nix
    ./tmux-navigator.nix
    ./smear-cursor.nix
    ./lsp/conform.nix
    ./lsp/fidget.nix
    ./lsp/lsp.nix
    ./nix-develop.nix
    ./aerial.nix
    ./autosave.nix
    ./notify.nix
    ./barbecue.nix
    ./noice.nix
    ./neoscroll.nix
    ./zen-mode.nix
    ./yazi.nix
    ./wtf.nix
    ./ts-comments.nix
    ./timerly.nix
    ./treesj.nix
    ./web-devicons.nix
    ./clipboard.nix
  ];

  # リーダーキーの設定
  globals.mapleader = " ";

  extraPlugins = with pkgs.vimPlugins; [
    blink-ripgrep-nvim
  ];

  # 基本的なVimオプション
  opts = {
    number = true;
    colorcolumn = "80";
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    wrap = false;
    swapfile = false;
    backup = false;
    undofile = true;
    hlsearch = false;
    incsearch = true;
    termguicolors = true;
    scrolloff = 8;
    signcolumn = "yes";
    updatetime = 50;
    foldlevelstart = 99;
  };
}
