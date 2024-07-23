{ pkgs, pkgs-unstable, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify =
    {
      enable = true;
      spotifyPackage = pkgs.spotify;
      # theme = spicePkgs.themes.catppuccin;
      # colorScheme = "mocha";
    };
}
