{ lib, pkgs, config, ... }:
let
  # apps
  terminal = lib.getExe pkgs.alacritty;
  fileManager = lib.getExe pkgs.xfce.thunar;
  webBrowser = lib.getExe pkgs.chromium;
  spotify = "spotify";
  textEditor = lib.getExe pkgs.vscodium;
  discordApp = lib.getExe pkgs.vesktop;
  telegramApp = lib.getExe pkgs.telegram-desktop;
  logseq = lib.getExe pkgs.logseq;
  passwordManager = lib.getExe' pkgs.keepassxc "keepassxc";
  screenshot = "${lib.getExe pkgs.hyprshot} --clipboard-only -o ${config.xdg.userDirs.pictures}/Screenshots";
  screenshotScreen = "${screenshot} -m active -m output";
  screenshotWindow = "${screenshot} -m active -m window";
  screenshotRegion = "${screenshot} -m region";
  colorPicker = "${lib.getExe pkgs.hyprpicker} --autocopy --format=hex --render-inactive";

  polkit = "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1";

  # rofi
  launcher = "${lib.getExe pkgs.rofi-wayland} -show drun -theme ${config.home.homeDirectory}/${config.xdg.configFile.rofi-launcher.target}";
  powermenu = "sh ${config.home.homeDirectory}/${config.xdg.configFile.rofi-powermenu-script.target}";

  mainMod = "SUPER";

  mainLayout = "dwindle";

  screenTearing = false; # enabling this can cause game performance issues
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    catppuccin.enable = true;

    settings = {
      # autostarts
      exec-once = [
        "${polkit}"
        "[workspace 1 silent] ${terminal}"
        "[workspace 1 silent] ${webBrowser}"
        "[workspace 2 silent] ${telegramApp}"
        "[workspace 2 silent] ${discordApp}"
        "[workspace 3 silent] ${textEditor}"
        "[workspace 4 silent] ${fileManager}"
        "[workspace 5 silent] ${logseq}"
        "[workspace 7 silent] ${passwordManager}"
        "[workspace 10 silent] ${spotify}"
      ];

      # inputs
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
      gestures.workspace_swipe = false;

      # layouts
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


      # general
      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;
        "col.active_border" = "$accent";
        "col.inactive_border" = "$text";
        layout = mainLayout;
        allow_tearing = screenTearing;
      };

      monitor = ",preferred,auto,auto";

      # binds
      bind = [
        "${mainMod}, Q, exec, ${terminal}"
        "${mainMod}, C, killactive"
        "${mainMod} SHIFT, C, exec, hyprctl reload"
        "${mainMod}, M, exit"
        "${mainMod}, E, exec, ${fileManager}"
        "${mainMod}, W, exec, ${webBrowser}"
        "${mainMod}, R, exec, ${launcher}"
        "${mainMod}, P, pseudo"
        "${mainMod}, Z, togglesplit"
        "${mainMod}, V, togglefloating"
        "${mainMod}, F, fullscreen"
        "${mainMod} SHIFT, F, fakefullscreen"
        "${mainMod}, PRINT, exec, ${screenshotRegion}"
        ", PRINT, exec, ${screenshotScreen}"
        "${mainMod} SHIFT, P, exec, ${colorPicker}"

        # Move focus with mainMod + arrow keys
        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"

        # Moving windows
        "${mainMod} SHIFT, left,  swapwindow, l"
        "${mainMod} SHIFT, right, swapwindow, r"
        "${mainMod} SHIFT, up,    swapwindow, u"
        "${mainMod} SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "${mainMod} CTRL, left, resizeactive, -60 0"
        "${mainMod} CTRL, right, resizeactive, 60 0"
        "${mainMod} CTRL, up, resizeactive, 0 -60"
        "${mainMod} CTRL, down, resizeactive, 0 60"

        # Switch workspaces with mainMod + [0-9]
        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 10"

        # Switch workspaces with mainMod + numpad [0-9]
        "${mainMod}, KP_End, workspace, 1"
        "${mainMod}, KP_Down, workspace, 2"
        "${mainMod}, KP_Next, workspace, 3"
        "${mainMod}, KP_Left, workspace, 4"
        "${mainMod}, KP_Begin, workspace, 5"
        "${mainMod}, KP_Right, workspace, 6"
        "${mainMod}, KP_Home, workspace, 7"
        "${mainMod}, KP_Up, workspace, 8"
        "${mainMod}, KP_Prior, workspace, 9"
        "${mainMod}, KP_Insert, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + Numpad [0-9]
        "${mainMod} SHIFT, KP_End, movetoworkspace, 1"
        "${mainMod} SHIFT, KP_Down, movetoworkspace, 2"
        "${mainMod} SHIFT, KP_Next, movetoworkspace, 3"
        "${mainMod} SHIFT, KP_Left, movetoworkspace, 4"
        "${mainMod} SHIFT, KP_Begin, movetoworkspace, 5"
        "${mainMod} SHIFT, KP_Right, movetoworkspace, 6"
        "${mainMod} SHIFT, KP_Home, movetoworkspace, 7"
        "${mainMod} SHIFT, KP_Up, movetoworkspace, 8"
        "${mainMod} SHIFT, KP_Prior, movetoworkspace, 9"
        "${mainMod} SHIFT, KP_Insert, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"

        # rofi powermenu
        "CTRL + ALT, Delete, exec, ${powermenu}"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      # window rules
      windowrulev2 = [
        # xwaylandvideobridge
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

        # firefox picture-in-picture
        "float, class:(firefox), title:^(Picture-in-Picture)$"
        "pin, class:(firefox), title:^(Picture-in-Picture)$"
        "bordercolor rgba(ff0000ff), class:(firefox), title:^(Picture-in-Picture)$"
        "float, class:(firefox), title:^(Картинка в картинке)$"
        "pin, class:(firefox), title:^(Картинка в картинке)$"
        "bordercolor rgba(ff0000ff), class:(firefox), title:^(Картинка в картинкеx)$"

        # apps that open twice appear in wrong workspace
        "workspace 2 silent, class:(vesktop)"
        "workspace 3 silent, class:(VSCodium)"


        # network manager applet
        "float, class:(nm-connection-editor)"

        # pcmanfm-qt
        "float, class:(pcmanfm-qt), title:(Копирование файлов)"

        # steam tweaks
        "stayfocused, title:^()$,class:^(steam)$"
        "minsize 1 1, title:^()$,class:^(steam)$"
      ];

      # appearance
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
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1" # use with .2s duration
        ];

        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          # "layers, 1, 2, md3_decel, slide"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          # "workspaces, 1, 2.5, softAcDecel, slide"
          # "workspaces, 1, 7, menu_decel, slidefade 15%"
          # "specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

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
    systemd.variables = [
      "GDK_BACKEND"
      "QT_QPA_PLATFORM"
      # "SDL_VIDEODRIVER"
      # "CLUTTER_BACKEND"
      "DISPLAY"
      "WAYLAND_DISPLAY"
      "DESKTOP_SESSION"
      "WLR_DRM_NO_ATOMIC"
    ];
  };
}
