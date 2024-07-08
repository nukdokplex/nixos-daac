{ pkgs, ... }: {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaGreen;
    name = "catppuccin-mocha-green-cursors";
    x11.enable = true;
    gtk.enable = true;
    size = 32;
  };
}