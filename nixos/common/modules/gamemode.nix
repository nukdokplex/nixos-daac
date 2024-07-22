{ lib, ... }: {
  programs.gamemode.enable = lib.mkDefault true;
  users.extraGroups.gamemode.members = [ "nukdokplex" ];
}