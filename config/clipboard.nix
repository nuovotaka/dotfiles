{ pkgs, ... }:
{
    clipboard = {
      providers = {
        pbcopy.enable = true;
      };
      register = "unnamedplus";
    };
}
