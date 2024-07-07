{ flakeRootPath, config, ... }: {
  # copy wallpaper
  xdg.configFile."wallpaper0.png" = {
    source = flakeRootPath + /assets/wallpapers/wallpaper0.png;
    target = "hypr/hyprpaper/wallpaper0.png";
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      enable = true;
      splash = false;

      preload = [
        "${config.xdg.configHome}/hypr/hyprpaper/wallpaper0.png"
      ];

      wallpaper = ",${config.xdg.configHome}/hypr/hyprpaper/wallpaper0.png";
    };
  };
}
