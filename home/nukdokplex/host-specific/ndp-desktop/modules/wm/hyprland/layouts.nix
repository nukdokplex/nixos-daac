{ vars }: {
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # you probably want this

      # force_split values
      # 0 -> split follows mouse, 
      # 1 -> always split to the left (new = left or top) 
      # 2 -> always split to the right (new = right or bottom)
      force_split = 2;
    };

    master = {
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      # new_is_master = true;
    };

    general = {
      layout = vars.mainLayout;
    };
  };
}
