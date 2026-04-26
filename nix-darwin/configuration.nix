{
  self,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  users.users."taka_mbp".home = "/Users/taka_mbp";

  imports = [
    ./home_manager.nix
    ./homebrew.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nix.enable = false;

  # zshの設定
  programs.zsh.enable = true;

  system.configurationRevision = self.rev or self.dirtyRev or null;
  security.pam.services.sudo_local.touchIdAuth = true;

  # firewall on
  networking.applicationFirewall.enable = true;
  
  system.defaults = {
    NSGlobalDomain = {
      "com.apple.mouse.tapBehavior" = 1;  # tap to click
      AppleInterfaceStyle = "light";
    };

    trackpad = {
      Clicking = true;      # Trackpad
    };

    dock = {
      tilesize = 20;
      orientation = "left";
      show-recents = false;
      launchanim = false;
      wvous-tl-corner = 13;
    };
  };

  # 電源設定
  power = {
    sleep = {
      allowSleepByPowerButton = false; # 電源ボタンでスリープを無効化
    #  computer = 10; # 自動スリープまでの時間（分）
    #  display = 2; # ディスプレイの自動スリープまでの時間（分）
    };
  };
  
  stylix = {
    enable = true;
    
    # 必須: 壁紙となる画像ファイルのパス
    image = ../images/wall-paper/Circles-me.jpg;
    
    # 必須: テーマ（Base16形式）を指定
    # 例: catppuccin, Gruvbox など。pkgs.base16-schemes から選べます
    base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";

    # ライトモードを強制
    polarity = "light";
    targets = {
      vscode.enable = false;    # VS Code は自分で設定したい場合
      terminal.enable = false;  # Apple純正ターミナル
      neovim.enable = false;
      kitty.enable = false;
      starship.enable = false;
    };
    # 壁紙を引き延ばして全体に指定
    imageScalingMode = "fill"; # "fill", "fit", "stretch", "center"
  };
}