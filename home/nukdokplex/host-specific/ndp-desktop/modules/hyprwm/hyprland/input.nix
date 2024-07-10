{ vars }: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us,ru";
      kb_variant = "";
      kb_model = "";
      kb_options = "grp:lalt_lshift_toggle";
      kb_rules = "";

      follow_mouse = 1;

      touchpad = {
        natural_scroll = false;
      };

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      numlock_by_default = true;
    };
  };
}
