{ lib, pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    
    package = lib.mkDefault pkgs.kdePackages.sddm;

    catppuccin = {
      enable = true;
      font = "JetBrains Mono";
      fontSize = "14";
      assertQt6Sddm = true;
    };

    settings.Theme = {
      CursorTheme = "Catppuccin-Mocha-Green-Cursors";
      CursorSize = 32;
    };
  };
}
