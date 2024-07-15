{ pkgs, config, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    catppuccin.enable = true;
    catppuccin.mode = "prependImport";
    package = pkgs.waybar;

    settings = {
      mainBar = {
        layer = "bottom";
        postition = "top";
        margin-top = 10;
        margin-bottom = 0; # hyprland already added gap
        margin-left = 10;
        margin-right = 10;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "wireplumber"
          "tray"
          "hyprland/language"
        ];
        "hyprland/workspaces" = {
          all-outputs = false;
          format = "{name}";
          disable-scroll = false;
          disable-click = false;
        };
        "hyprland/window" = {
          format = "{class}";
        };
        clock = {
          format = "{:L%A, %d %B %Y - %H:%M:%S}";
          interval = 1;
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          locale = "ru_RU.UTF-8";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
        wireplumber = {
          format = "{volume}% {icon}";
          format-icons = [ "" "" "" ];
          tooltip = true;
          tooltip-format = "{node_name}";
          max-volume = 150.0;
          on-click = lib.getExe pkgs.pavucontrol;
        };
        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-ru = "RU";
        };
      };
    };

    style = ''
      @define-color primary @green;

      #waybar {
        font-family: JetBrainsMono Nerd Font Mono, monospace;
        font-size: 18px;
        background-color: @crust;
        color: @text;
        border-radius: 17px;
        border: 2px solid @primary;
        padding: 10px 10px;
      }

      #waybar.hidden {
        opacity: 0.1;
      }

      .modules-left > * > *,
      .modules-right > * > *,
      .modules-center > * > * {
        padding: 0px 6px;
        margin: 12px 6px;
        background-color: @base;
        border-radius: 7.5px;
        border: 0.5px solid @surface0;
      }

      .modules-left > :first-child > * {
        margin-left: 12px;
      }

      .modules-right > :last-child > * {
        margin-right: 12px;
      }

      #workspaces {
        padding: 0px 0px;
      }

      #workspaces > * {
        padding: 0px 3px;
        border-radius: 7px;
        margin: 0px 0px; 
      }

      #workspaces .active {
        background-color: @primary;
        color: @base;
      }

      #tray > widget > image {
        margin: 0px 6px;
      }
    '';
  };
}
