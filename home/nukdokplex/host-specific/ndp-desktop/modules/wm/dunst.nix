{ pkgs, ... }: {
  services.dunst = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      global.dmenu = "${pkgs.rofi-wayland}/bin/rofi -dmenu -theme $HOME/.config/rofi/config/applet.rasi";
    };
  };
}