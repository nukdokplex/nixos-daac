{ pkgs, config, ... }: {
  programs.waybar = {
    enable = true;
    catppuccin.enable = true;
    catppuccin.mode = "prependImport";
    package = pkgs.waybar;

    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";
        margin-top = 7;
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "sway/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "wireplumber"
          "tray"
          "sway/language"
        ];
        "sway/workspaces" = {
          all-outputs = false;
          format = "{name}";
          disable-scroll = false;
          disable-click = false;
        };
        "sway/window" = {
          format = "{app_id}:{shell}";
        };
        "clock" = {
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
          # actions = {
          #   on-click-right = "mode";
          #   on-click-forward = "tz_up";
          #   on-click-backward = "tz_down";
          #   on-scroll-up = "shift_up";
          #   on-scroll-down = "shift_down";
          # };
        };
        "wireplumber" = {
          format = "{volume}% {icon}";
          format-icons = [ "" "" "" ];
          tooltip = true;
          tooltip-format = "{node_name}";
          max-volume = 150.0;
        };
        "sway/language" = {
          format = "{short}";
        };
      };
    };

    style = ''
      @define-color primary @${config.catppuccin.accent};

      #waybar {
        font-family: JetBrainsMono Nerd Font Mono, monospace;
        font-size: 1em;
        background-color: transparent;
        color: @text;
      }

      #waybar.hidden {
        opacity: 0.1;
      }

      .modules-left > * > *,
      .modules-right > * > *,
      .modules-center > * > * {
        padding: 0.4em 0.4em;
        margin: 0em 0.4em;
        background-color: @base;
        border-radius: 0.8em;
        /* border: 0.1em solid @primary;  */
      }

      .modules-left > :first-child > * {
        margin-left: 1em;
      }

      .modules-right > :last-child > * {
        margin-right: 1em;
      }

      #workspaces > * {
        padding: 0em;
        border-radius: 0em;
        margin: 0em 0.2em; 
      }

      #workspaces > .focused {
        background-color: @primary;
        color: @base;
      }
    '';
  };
}
