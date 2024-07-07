{ lib, pkgs, ... }: {
  programs.zsh.enable = lib.mkDefault true;

  users.defaultUserShell = lib.mkForce pkgs.zsh;
}