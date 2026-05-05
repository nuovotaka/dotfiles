{
  self,
  pkgs,
  nvim,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  system.primaryUser = "taka_mbp";
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
    };

    trackpad = {
      Clicking = true;      # Trackpad
    };

    dock = {
      tilesize = 26;
      orientation = "left";
      show-recents = false;
      launchanim = false;
      wvous-tl-corner = 13;

      persistent-apps = [
        { app = "/System/Applications/Apps.app"; }
        { app = "/Applications/Dropbox.app"; }
        { app = "/Applications/Brave Browser.app"; }
        { app = "/Applications/Dia.app"; }
        { app = "/Applications/Safari.app"; }
        { app = "/Applications/Google Chrome.app"; }
        { app = "/System/Applications/Messages.app"; }
        { app = "/System/Applications/FaceTime.app"; }
        { app = "/System/Applications/Mail.app"; }
        { app = "/System/Applications/Maps.app"; }
        { app = "/System/Applications/Photos.app"; }
        { app = "/System/Applications/Calendar.app"; }
        { app = "/System/Applications/Contacts.app"; }
        { app = "/System/Applications/Notes.app"; }
        { app = "/Applications/Raindrop.io.app"; }
        { app = "/Applications/DeepL.app"; }
        { app = "/Applications/LeathercraftCAD.app"; }
        { app = "/Applications/KiCad/KiCad.app"; }
        { app = "/Applications/Blender Launcher.app"; }
        { app = "/Applications/Orcaslicer.app"; }
        { app = "/Applications/BambuStudio.app"; }
        { app = "/Applications/Ledger Wallet.app"; }
        { app = "/Applications/Binance.app"; }
        { app = "/Applications/TradingView.app"; }
        { app = "/Applications/Obsidian.app"; }
        { app = "/Applications/Podman Desktop.app"; }
        { app = "/Applications/Bruno.app"; }
        { app = "/Applications/Github Desktop.app"; }
        { app = "/Applications/kitty.app"; }
        { app = "/Applications/Visual Studio Code.app"; }
        { app = "/Applications/Antigravity.app"; }
        { app = "/Applications/Kiro.app"; }
        # nRF connect for desktop
        { app = "/Applications/iMovie.app"; }
        { app = "/Applications/Canva.app"; }
        { app = "/Applications/Figma.app"; }
        { app = "/System/Applications/iPhone Mirroring.app"; }
        { app = "/System/Applications/App Store.app"; }
        { app = "/Applications/AppCleaner.app"; }
        { app = "/Applications/QaLL.app"; }
        { app = "/System/Applications/System Settings.app"; }
      ];
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

    # 必須: テーマ（Base16形式）を指定
    # 例: catppuccin, Gruvbox など。pkgs.base16-schemes から選べます
    base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";
  };
  
  # OS全体へのフォントの追加
  fonts.packages = with pkgs; [
    nerd-fonts.code-new-roman
    nerd-fonts.hack
  ];

  # 作成した nvim パッケージをシステム全体にインストール
  environment.systemPackages = [
    nvim
  ];

  # (任意) vim と打っても nvim が起動するようにエイリアスを設定
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}