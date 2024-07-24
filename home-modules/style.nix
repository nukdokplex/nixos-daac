{ pkgs, lib, config, ... }: {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaGreen;
    name = "catppuccin-mocha-green-cursors";
    x11.enable = true;
    gtk.enable = true;
    size = 32;
  };
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      # icon = {
      #   enable = true;
      #   accent = "green";
      #   flavor = "mocha";
      # };
      gnomeShellTheme = true;
    };
    iconTheme = {
      package = (pkgs.catppuccin-papirus-folders.override {
        flavor = config.catppuccin.flavor;
        accent = config.catppuccin.accent;
      });
      name = "Papirus-Dark";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      catppuccin.enable = true;
      name = "kvantum";
    };
  };

  # necessary evil to make pcmanfm-qt get icons
  xdg.configFile.qt5ct = {
    target = "qt5ct/qt5ct.conf";
    text = lib.generators.toINI { } {
      Appearance = {
        icon_theme = config.gtk.iconTheme.name;
      };
    };
  };

  xdg.configFile.qt6ct = {
    target = "qt6ct/qt6ct.conf";
    text = lib.generators.toINI { } {
      Appearance = {
        icon_theme = config.gtk.iconTheme.name;
      };
    };
  };
}