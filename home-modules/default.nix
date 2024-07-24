{ ezModules, lib, ... }: {
  imports = [
    ./alacritty.nix
    ./chromium.nix
    ./gaming.nix
    ./nheko.nix
    ./rofi.nix
    ./spicetify.nix
    ./style.nix
    ./syncthing.nix
    ./vscodium.nix
  ];
}
