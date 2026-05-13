{
  description = "My macOS configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
       url = "github:nix-darwin/nix-darwin";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";       # Add Stylix
  };

  outputs =
    {
       self,
       nixpkgs,
       home-manager,
       nix-darwin,
       nix-homebrew,
       nixvim,
       stylix,
    }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = ./config; 
      };

      # 共通 MCP ラッパー: env ファイル + オプションでテンプレ config コピー
      makeMcpScript = {
        name,
        envFile,
        command,
        args,
        # 以下はオプション
        templateConfig ? null,   # 例: "/Users/.../gemini/antigravity/mcp_config.json"
        targetConfig   ? null    # 例: "${HOME}/.gemini/antigravity/mcp_config.json"
      }:
        pkgs.writeShellScriptBin "run-${name}-mcp.sh" ''
          #!/usr/bin/env bash
          set -euo pipefail

          ENV_FILE="${envFile}"

          if ! command -v op >/dev/null 2>&1; then
            echo "1Password CLI 'op' が見つかりません。"
            exit 1
          fi

          if [ ! -f "$ENV_FILE" ]; then
            echo "$ENV_FILE が見つかりません。"
            echo
            echo "以下のような内容で作成してください:"
            echo
            echo '  OBSIDIAN_API_KEY="op://Vault/Item/api_key"'
            echo '  （必要に応じて他の変数も）'
            exit 1
          fi

          # 必要ならテンプレ config をコピー（初回のみ）
          ${if templateConfig != null && targetConfig != null then ''
            TEMPLATE="${templateConfig}"
            TARGET="${targetConfig}"

            if [ ! -f "$TEMPLATE" ]; then
              echo "テンプレートが見つかりません。"
              exit 1
            fi

            if [ -f "$TEMPLATE" ]; then
              mkdir -p "$(dirname "$TARGET")"
              if [ ! -f "$TARGET" ]; then
                cp "$TEMPLATE" "$TARGET"
                echo "テンプレから $TARGET を作成しました。"
              fi
            fi
          '' else ""}

          op run --env-file="$ENV_FILE" -- \
            ${command} ${builtins.concatStringsSep " " args}
        '';

      # Obsidian 用の MCP スクリプト
      obsidianMcpScript = makeMcpScript {
        name = "obsidian";
        envFile = "/Users/taka_mbp/.env.obsidian.1password";
        command = "npx";
        args = [
          "-y"
          "mcp-obsidian"
          "/Users/taka_mbp/github/obsidian/public"
        ];

        # ここでテンプレ config コピーも一緒にやる
        templateConfig = "/Users/taka_mbp/dotfiles/home-manager/gemini/antigravity/mcp_config.json";
        targetConfig   = "/Users/taka_mbp/.gemini/antigravity/mcp_config.json";
      };

    in
    {
      packages.${system}.default = nvim;

      # checks.${system}.default = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
      #   inherit nvim;
      #   name = "A nixvim configuration";
      # };

      devShells.${system}.default = pkgs.mkShellNoCC {
        shellHook = ''
          echo Welcome to a Neovim dev environment powered by Nixvim
          PS1="Nixvim: \\w \$ "
          alias vim='nvim'
        '';
        packages = [
          nvim
        ];
      };

      apps.${system}.obsidian-mcp = {
        type = "app";
        program = "${obsidianMcpScript}/bin/run-obsidian-mcp.sh";
      };

      # 将来 antigravity も:
      # apps.${system}.antigravity-mcp = {
      #   type = "app";
      #   program = "${antigravityMcpScript}/bin/run-antigravity-mcp.sh";
      # };


      darwinConfigurations."MBP16" = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self nix-homebrew nvim;
        };

        modules = [
          ./nix-darwin/configuration.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          stylix.darwinModules.stylix  # Add module Stylix
        ];
      };
    };
}
