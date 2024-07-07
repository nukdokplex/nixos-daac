{ vars }: {
  wayland.windowManager.hyprland.settings = {
    general.allow_tearing = vars.screenTearing;
  };
}
