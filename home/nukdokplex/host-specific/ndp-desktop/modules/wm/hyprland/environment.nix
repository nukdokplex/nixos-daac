{ vars }: {
  wayland.windowManager.hyprland.settings = {
    env = [
      # GTK 
      "GDK_BACKEND,wayland,x11"
      "QT_QPA_PLATFORM,wayland;xcb"

      # "SDL_VIDEODRIVER,x11"
      # "CLUTTER_BACKEND,x11"

      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"

      "DESKTOP_SESSION,hyprland"

      "WLR_DRM_NO_ATOMIC,1"
    ];
  };

  wayland.windowManager.hyprland.systemd.variables = [
    "GDK_BACKEND"
    "QT_QPA_PLATFORM"
    # "SDL_VIDEODRIVER"
    # "CLUTTER_BACKEND"
    "DISPLAY"
    "WAYLAND_DISPLAY"
    "DESKTOP_SESSION"
    "WLR_DRM_NO_ATOMIC"
  ];
}
