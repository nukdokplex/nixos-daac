{ pkgs, options, ... }: {
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      icon = {
        enable = true;
        accent = "green";
        flavor = "mocha";
      };
      gnomeShellTheme = true;
    };
    # theme = {
    #   package = pkgs.catppuccin-gtk.override { 
    #     variant = "mocha"; 
    #     accents = [ "green" ];
    #     tweaks = [];4
    #     size = "standard";
    #   };
    #   name = "Catppuccin-Mocha-Standard-Green-Dark";
    # };
    # iconTheme = {
    #   package = pkgs.catppuccin-papirus-folders.override {
    #     flavor = "mocha";
    #     accent = "green";
    #   };
    #   name = "Papirus-Dark";
    # };
  };
}
