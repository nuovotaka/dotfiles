{ config, pkgs, ... }:

{
  home.username = "taka_mbp";
  home.homeDirectory = "/Users/taka_mbp";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # CLI application
    git
    go-task
    bat
    eza
    fzf
    fd
    ripgrep
    lazygit
    gnupg
    # neovim
    nodejs-slim
    wget
    starship
    tree
    prettierd

    # base
    nerd-fonts.jetbrains-mono # Font
    # Formatters
    stylua # Lua formatter
    csharpier # C# formatter
    nixfmt-rfc-style # Nix formatter
    # Linters
    golangci-lint # Go linter
    shellcheck # Shell script linter
    eslint_d # JavaScript/TypeScript linter
    # Debuggers
    netcoredbg # C# debugger
    asm-lsp # Assembly LSP
    delve # Go debugger
    gcc

    # ✅ Roslyn開発に必要なパッケージを追加
    roslyn-ls
    dotnet-sdk_8

    # ✅ 他のエラー防止用
    yaml-language-server
    ansible-lint # ansible-vim用

    # # GUI application
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

  xdg.configFile = {
    "kitty".source = ./config/kitty;
    "nix".source = ./config/nix;
  };

  xdg.configFile = {
    "wezterm".source = ./config/wezterm;
  };

  xdg.configFile."starship.toml".source = ./config/starship/starship.toml;

  home.file = {
    ".gitconfig".source = ./git/.gitconfig;
    ".gitignore_global".source = ./git/.gitignore_global;
    ".zshrc".source = ./zsh/.zshrc;
  };

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
