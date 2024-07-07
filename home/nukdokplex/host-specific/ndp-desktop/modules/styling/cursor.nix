{ pkgs, ... }: {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaGreen;
    x11.enable = true;
    gtk.enable = true;
    name = "Catppuccin-Mocha-Green-Cursors";
    size = 32;
  };
}