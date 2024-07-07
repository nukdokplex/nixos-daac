{ lib, pkgs, ...}: {
  # this module adds necessary font packages

  fonts.packages = with pkgs;[
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "JetBrainsMono" ]; })
  ];
}