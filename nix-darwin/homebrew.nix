{
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    user = "taka_mbp";
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    user = "taka_mbp";

    global.autoUpdate = false;  # デフォルト true
    onActivation = {
      upgrade = true;  # デフォルト false
      autoUpdate = false;  # デフォルト false
      # cleanup = "zap";  # Homebrew からの移行完了後に設定
    };

    brews = [
     # brew install west
      "west"
    ];

    casks = [
      # brew install --cask binance
      "binance"
      "brave-browser"
      "google-chrome"
      "deepl"
      "dropbox"
      "figma"
      "ledger-wallet"
      "popclip"
      "raindropio"
      "visual-studio-code"
      "whalebird"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      "Color Picker" = 641027709;
      "Craft" = 1487937127;
      "LINE" = 539883307;
      "NFT Creator" = 1602374609;
      "QaLL" = 480452005;
      "QREncoder" = 452695239;
      "The Unarchiver" = 425424353;
      "Xcode" = 497799835;
      "フリーフォント（商用オープンタイプフォント550種" = 647697434;
    };

    vscode = [
      "ajshort.include-autocomplete"
      "akamud.vscode-caniuse"
      "astro-build.astro-vscode"
      "blackmist.linkcheckmd"
      "blanu.vscode-styled-jsx"
      "bradlc.vscode-tailwindcss"
      "christian-kohler.path-intellisense"
      "codelios.dartsass"
      "codezombiech.gitignore"
      "csstools.postcss"
      "dart-code.dart-code"
      "dart-code.flutter"
      "dbaeumer.vscode-eslint"
      "dbankier.vscode-gist"
      "dsznajder.es7-react-js-snippets"
      "eamodio.gitlens"
      "esbenp.prettier-vscode"
      "ex-codes.pine-script-syntax-highlighter"
      "file-icons.file-icons"
      "formulahendry.auto-close-tag"
      "formulahendry.auto-rename-tag"
      "gerane.theme-flatlandmonokai"
      "github.github-vscode-theme"
      "github.vscode-pull-request-github"
      "gitpod.gitpod-desktop"
      "htmlhint.vscode-htmlhint"
      "humao.rest-client"
      "huntertran.auto-markdown-toc"
      "jock.svg"
      "joedevivo.vscode-circuitpython"
      "jrebocho.vscode-random"
      "kakumei.ts-debug"
      "learn-game-development.js-syntax-extension"
      "llvm-vs-code-extensions.vscode-clangd"
      "mhutchie.git-graph"
      "moshfeu.compare-folders"
      "ms-azuretools.vscode-containers"
      "ms-azuretools.vscode-docker"
      "ms-ceintl.vscode-language-pack-ja"
      "ms-python.debugpy"
      "ms-python.isort"
      "ms-python.python"
      "ms-python.vscode-pylance"
      "ms-vscode-remote.remote-containers"
      "ms-vscode-remote.remote-ssh"
      "ms-vscode-remote.remote-ssh-edit"
      "ms-vscode.cmake-tools"
      "ms-vscode.cpp-devtools"
      "ms-vscode.cpptools"
      "ms-vscode.cpptools-extension-pack"
      "ms-vscode.cpptools-themes"
      "ms-vscode.remote-explorer"
      "nordic-semiconductor.nrf-devicetree"
      "nordic-semiconductor.nrf-kconfig"
      "oderwat.indent-rainbow"
      "pdconsec.vscode-print"
      "pflannery.vscode-versionlens"
      "ritwickdey.liveserver"
      "rust-lang.rust-analyzer"
      "shardulm94.trailing-spaces"
      "sibiraj-s.vscode-scss-formatter"
      "skyran.js-jsx-snippets"
      "spadin.zmk-tools"
      "streetsidesoftware.code-spell-checker"
      "stripe.markdoc-language-support"
      "stylelint.vscode-stylelint"
      "svelte.svelte-vscode"
      "teguholica.newfilefolder"
      "trond-snekvik.devicetree"
      "tyriar.lorem-ipsum"
      "unifiedjs.vscode-mdx"
      "yusukehirao.vscode-markuplint"
    ];

    taps = [
      # brew tap petere/postgresql
      # "petere/postgresql"

      # URL を指定する書き方も可能（架空の URL なのでコメントアウト）
      # brew tap user/tap-repo https://user@bitbucket.org/user/homebrew-tap-repo.git
      # {
      #   name = "user/tap-repo";
      #   clone_target = "https://user@bitbucket.org/user/homebrew-tap-repo.git";
      # }
    ];
  };
}
