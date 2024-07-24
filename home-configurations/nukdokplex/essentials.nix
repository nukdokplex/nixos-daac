{ pkgs, assetsDirectory, config, ... }: rec {
  # idling and locking
  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;

    settings = {
      general = {
        lock_cmd = "pidof swaylock || swaylock"; # avoid starting multiple hyprlock instances
        unlock_cmd = "killall swaylock";
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 300; # 5min
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
        }
        {
          timeout = 330; # 5.5min
          on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
        }
      ];
    };
  };
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;
    catppuccin.enable = true;
  };

  # notifications
  services.swaync = {
    enable = true;
  };

  # wallpapers
  xdg.configFile."wallpaper0.png" = {
    source = "${assetsDirectory}/wallpapers/wallpaper0.png";
    target = "hypr/hyprpaper/wallpaper0.png";
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      enable = true;
      splash = false;

      # don't use config.* in this case because config.* is not evaluated yet and causes error
      # use "rec" keyword instead and re-use setting
      preload = [
        "${config.xdg.configHome}/${xdg.configFile."wallpaper0.png".target}"
      ]; 

      wallpaper = "${config.xdg.configHome}/${xdg.configFile."wallpaper0.png".target}";
    };
  };

  # applets
  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;

  # essential packages
  home.packages = with pkgs; [
    hyprshot
    hyprpicker
    mate.mate-polkit
    xfce.thunar
    pavucontrol
  ];
}
