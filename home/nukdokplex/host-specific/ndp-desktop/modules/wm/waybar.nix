{ ... }: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 59;
        margin-left = 21;
        margin-right = 21;
        modules-left = [
          "cpu"
          "memory"
        ];
        modules-center = [
          "custom/menu"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-right = [
          "custom/spotify"
          "wireplumber#output"
          "tray"
          "hyprland/language"
          "clock"
        ];
        cpu = {
          format = " {usage}%";
          tooltip = false;
        };
        memory = {
          format = " {}%";
          tooltip = false;
        };
        "hyprland/window" = {
          format = "{class}";
          separate-outputs = false;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "󰖟";
            "2" = "󰵅";
            "3" = "";
            "4" = "󰪶";
            "5" = "󱂅";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "";
          };
          tooltip = true;
        };
        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-ru = "RU";
        };
        tray = {
          icon-size = 16;
          spacing = 16;
        };
        clock = {
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        "wireplumber#output" = {
          format = "{node_name} {icon}  {volume}%";
          format-muted = "";
          format-icons = [
            ""
            ""
            ""
          ];
          scroll-step = 5;
          max-volume = 200;
          tooltip = true;
        };
      };
    };

    style = ''
      @define-color primary #a6e3a1;
      @define-color surface0 #313244;
      @define-color surface1 #45475a;
      @define-color crust #11111b;
      @define-color base #1e1e2e;
      @define-color text #cdd6f4;

      * {
        /* font-family: JetBrainsMono-Regular, Symbols Nerd Font; */
        font-family: JetBrainsMono Nerd Font Mono;
      }

      #waybar {
        /* you can also GTK3 CSS functions! */
        background-color: @crust;
        /* border: 5px solid rgba(0,0,0,0); */
        border-radius: 0 0 18px 18px;
        border-left: 3px solid @primary;
        border-bottom: 3px solid @primary;
        border-right: 3px solid @primary;
      }

      #workspaces button {
        box-shadow: none;
        border: none;
        color: @primary;
        background-color: @surface0;
        margin: 5px 2.5px;
        /* margin: 0px 2px; */
      }

      #workspaces button:hover {
        background-color: alpha(@primary, 0.2);
        /* color: @base; */
      }

      #workspaces button.active {
        background-color: alpha(@primary, 0.3);
        /* color: @base; */
      }

      .modules-left, .modules-center, .modules-right {
        /* background-color: @surface1; */
        /* border: 2px solid red; */
        color: @text;
        background-color: @base;
        border-radius: 10px
      }

      .modules-left {
        margin: 5px 10px 8px 8px;
        padding: 0px 2.5px;
      }
      
      .modules-right {
        margin: 5px 8px 8px 10px;
        padding: 0px 2.5px;
      }

      .modules-center {
        margin: 5px 5px 8px 5px;
        padding: 0px 2.5px;
      }

      #cpu,
      #memory,
      #window,
      #tray,
      #language,
      #clock,
      #pulseaudio,
      #wireplumber,
      #custom-spotify {
        margin: 5px 2.5px;
        padding: 5px;
        border-radius: 5px;
        background-color: @surface0;
        color: @text;
      }

      #tray > widget.active {
        margin: 0px;
        padding: 0px; 
      }

      #tray {
        padding: 0px 15px;
      }
    '';
  };
}
