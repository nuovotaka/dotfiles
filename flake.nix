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
    in
    {
      packages.${system}.default = nvim;

      checks.${system}.default = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
        inherit nvim;
        name = "A nixvim configuration";
      };

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
