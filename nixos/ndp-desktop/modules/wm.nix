{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

  environment.systemPackages = with pkgs; [
    # hypr family packages
    hypridle
    hyprlock
    # swaylock
    hyprpaper
    hyprpicker
    hyprshot
    xdg-desktop-portal-hyprland

    dunst # notification daemon
    rofi-wayland # dmenu-compatible launcher
    waybar # status bar
    networkmanagerapplet # tray icon + configuration utility for networkmanager
    blueman # tray icon + configuration utility for bluez
    helvum # configuration utility for wireplumber
    pwvucontrol # sound control
  ];
}
