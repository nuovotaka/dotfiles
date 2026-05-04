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
     }:
    {
      darwinConfigurations."MBP16" = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self nix-homebrew nixvim;
        };

        modules = [
          ./nix-darwin/configuration.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          nixvim.nixDarwinModules.nixvim
          stylix.darwinModules.stylix  # Add module Stylix
        ];
      };
    };
}
