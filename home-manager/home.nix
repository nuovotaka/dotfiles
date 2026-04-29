{ config, pkgs, ... }:

{
  home.username = "taka_mbp";
  home.homeDirectory = "/Users/taka_mbp";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    git
    go-task
    bat
    eza
    gawk
    gnupg
    neovim
    nodejs-slim
    xz
    wget
    starship
    tree
    prettierd

    # # application
    appcleaner
    bruno
    insomnia
    karabiner-elements
    obsidian
    podman-desktop
    tableplus
    kitty
    antigravity

    # # fonts
    nerd-fonts.code-new-roman
    nerd-fonts.hack

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  fonts.fontconfig.enable = true;
  
  home.file = {
    ".gitconfig".source = ./git/.gitconfig;
    ".gitignore_global".source = ./git/.gitignore_global;
    ".zshrc".source = ./zsh/.zshrc;

    ".config/starship.toml".source = ./config/starship/starship.toml;
    ".config/kitty".source = ./config/kitty;
    ".config/nix".source = ./config/nix;
    ".config/nvim".source = ./config/nvim;
  };

  # programs.git = {
  #   enable = true;
  #   ignores = let
  #     emacs = ["*~"];
  #     mac = [".DS_Store"];
  #   in
  #     emacs ++ mac;
  #   extraConfig = {
  #     init.defaultBranch = "main";
  #   };
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/taka_mbp/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
