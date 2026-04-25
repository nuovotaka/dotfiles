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
  programs.zsh.enable = true;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  security.pam.services.sudo_local.touchIdAuth = true;
}