{ vars }: {
  wayland.windowManager.hyprland.catppuccin.enable = true;
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 10;
      gaps_out = 20;

      border_size = 3;
      "col.active_border" = "$accent";
      "col.inactive_border" = "$text";
    };

    decoration = {
      rounding = 15;

      blur = {
        enabled = true;
        size = 5;
        passes = 4;
        new_optimizations = true;
      };

      drop_shadow = false;
      shadow_range = 15;
      shadow_render_power = 3;
      "col.shadow" = "rgba(000000ee)";

      dim_inactive = false;
      dim_strength = 0.2;
    };

    animations = {
      enabled = true;

      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "myBezier2, 0.65, 0, 0.35, 1"
        "slow,0,0.85,0.3,1"
        "overshot,0.7,0.6,0.1,1.1"
        "bounce,1,1.6,0.1,0.85"
        "slingshot,1,-1,0.15,1.25"
        "nice,0,6.9,0.5,-4.20"
      ];

      animation = [
        "windows,1,5,default,popin"
        "border,1,20,default"
        "fade,1,5,default"
        "workspaces,1,5,default,slide"
      ];
    };
  };
}
