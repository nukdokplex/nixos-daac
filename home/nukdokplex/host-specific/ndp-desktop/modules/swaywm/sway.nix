{ config, lib, pkgs, flakeRootPath, ... }:
{
  xdg.configFile."wallpaper0.png" = {
    enable = true;
    source = flakeRootPath + /assets/wallpapers/wallpaper0.png;
    target = "sway/wallpaper0.png";
  };

  home.packages = with pkgs; [
    swaylock
    swaybg
    wlogout
    shotman

    # applets
    blueman
    networkmanagerapplet

    # polkit
    mate.mate-polkit
  ];

  services.swaync.enable = true;
  services.swaync.package = pkgs.swaynotificationcenter;

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    systemd.enable = true;
    catppuccin.enable = true;

    config =
      let
        mainMod = "Mod4";

        bar = lib.getExe pkgs.waybar;

        webBrowser = lib.getExe pkgs.chromium;
        terminal = lib.getExe pkgs.alacritty;
        fileManager = lib.getExe pkgs.kdePackages.dolphin;
        launcher = "sh ${config.xdg.configHome}/rofi/bin/launcher.sh";
        lock = lib.getExe pkgs.swaylock;
        logout = lib.getExe pkgs.wlogout;

        screenshot = lib.getExe pkgs.shotman;
        screenshot_screen = "${screenshot} --capture output";
        screenshot_region = "${screenshot} --capture region";
      in
      {
        assigns = {
          
        };

        startup = [
          { command = "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1"; }
          { command = lib.getExe' pkgs.blueman "blueman-applet"; }
          { command = lib.getExe' pkgs.networkmanagerapplet "nm-applet"; }
          { command = "swaymsg \"workspace 1; exec ${terminal}\""; }
          { command = "swaymsg \"workspace 1; exec ${webBrowser}\""; }
          { command = "swaymsg \"workspace 2; exec ${lib.getExe pkgs.telegram-desktop}}\""; }
          { command = "swaymsg \"workspace 2; exec ${lib.getExe pkgs.vesktop}}\""; }
          { command = "swaymsg \"workspace 3; exec ${lib.getExe pkgs.vscodium}}\""; }
          { command = "swaymsg \"workspace 4; exec ${fileManager}}\""; }
          { command = "swaymsg \"workspace 5; exec ${lib.getExe pkgs.logseq}}\""; }
          { command = "swaymsg \"workspace 7; exec ${lib.getExe pkgs.keepassxc}}\""; }
          { command = "swaymsg \"workspace 10; exec spotify\""; }
        ];

        defaultWorkspace = "workspace number 1";
        focus = {
          followMouse = "always";
          newWindow = "focus";
        };

        bars = [{ command = bar; }];

        gaps = {
          inner = 5;
          outer = 5;
        };

        # Drag floating windows by holding down $mod and left mouse button.
        # Resize them with right mouse button + $mod.
        # Despite the name, also works for non-floating windows.
        # Change normal to inverse to use left mouse button for resizing and right
        # mouse button for dragging.
        floating.modifier = "${mainMod} normal";

        input."*" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:alt_shift_toggle";
        };

        output."HDMI-A-1" = {
          bg = "/home/nukdokplex/.config/sway/wallpaper0.png fill";
        };

        keybindings = {
          # Apps
          "${mainMod}+Q" = "exec ${terminal}";
          "${mainMod}+E" = "exec ${fileManager}";
          "${mainMod}+W" = "exec ${webBrowser}";
          "${mainMod}+R" = "exec ${launcher}";
          "PRINT" = "exec ${screenshot_screen}";
          "${mainMod}+PRINT" = "exec ${screenshot_region}";

          # Manage session
          "${mainMod}+Shift+F11" = "exec ${lock}";
          "${mainMod}+Shift+F12" = "exec ${logout}";

          # Basic window management
          "${mainMod}+F" = "fullscreen toggle";
          "${mainMod}+V" = "floating toggle";
          "${mainMod}+C" = "kill";
          "${mainMod}+Shift+C" = "reload";

          # Move focus with mainMod + arrow keys
          "${mainMod}+Left" = "focus left";
          "${mainMod}+Down" = "focus down";
          "${mainMod}+Up" = "focus up";
          "${mainMod}+Right" = "focus right";

          # Move focus with mainMod + hjkl keys (vim/ADM-3A terminal)
          "${mainMod}+H" = "focus left";
          "${mainMod}+J" = "focus down";
          "${mainMod}+K" = "focus up";
          "${mainMod}+L" = "focus right";

          # Move window with mainMod SHIFT + arrow keys
          "${mainMod}+Shift+Left" = "move left";
          "${mainMod}+Shift+Down" = "move down";
          "${mainMod}+Shift+Up" = "move up";
          "${mainMod}+Shift+Right" = "move right";

          # Move window with mainMod SHIFT + hjkl keys
          "${mainMod}+Shift+H" = "move left";
          "${mainMod}+Shift+J" = "move down";
          "${mainMod}+Shift+K" = "move up";
          "${mainMod}+Shift+L" = "move right";

          # Switch workspaces with mainMod + [0-9]
          "${mainMod}+1" = "workspace number 1";
          "${mainMod}+2" = "workspace number 2";
          "${mainMod}+3" = "workspace number 3";
          "${mainMod}+4" = "workspace number 4";
          "${mainMod}+5" = "workspace number 5";
          "${mainMod}+6" = "workspace number 6";
          "${mainMod}+7" = "workspace number 7";
          "${mainMod}+8" = "workspace number 8";
          "${mainMod}+9" = "workspace number 9";
          "${mainMod}+0" = "workspace number 10";
          "${mainMod}+KP_1" = "workspace number 1";
          "${mainMod}+KP_2" = "workspace number 2";
          "${mainMod}+KP_3" = "workspace number 3";
          "${mainMod}+KP_4" = "workspace number 4";
          "${mainMod}+KP_5" = "workspace number 5";
          "${mainMod}+KP_6" = "workspace number 6";
          "${mainMod}+KP_7" = "workspace number 7";
          "${mainMod}+KP_8" = "workspace number 8";
          "${mainMod}+KP_9" = "workspace number 9";
          "${mainMod}+KP_0" = "workspace number 10";
          "${mainMod}+KP_End" = "workspace number 1";
          "${mainMod}+KP_Down" = "workspace number 2";
          "${mainMod}+KP_Next" = "workspace number 3";
          "${mainMod}+KP_Left" = "workspace number 4";
          "${mainMod}+KP_Begin" = "workspace number 5";
          "${mainMod}+KP_Right" = "workspace number 6";
          "${mainMod}+KP_Home" = "workspace number 7";
          "${mainMod}+KP_Up" = "workspace number 8";
          "${mainMod}+KP_Prior" = "workspace number 9";
          "${mainMod}+KP_Insert" = "workspace number 10";

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "${mainMod}+Shift+1" = "move container to workspace number 1; workspace 1";
          "${mainMod}+Shift+2" = "move container to workspace number 2; workspace 2";
          "${mainMod}+Shift+3" = "move container to workspace number 3; workspace 3";
          "${mainMod}+Shift+4" = "move container to workspace number 4; workspace 4";
          "${mainMod}+Shift+5" = "move container to workspace number 5; workspace 5";
          "${mainMod}+Shift+6" = "move container to workspace number 6; workspace 6";
          "${mainMod}+Shift+7" = "move container to workspace number 7; workspace 7";
          "${mainMod}+Shift+8" = "move container to workspace number 8; workspace 8";
          "${mainMod}+Shift+9" = "move container to workspace number 9; workspace 9";
          "${mainMod}+Shift+0" = "move container to workspace number 10; workspace 10";
          "${mainMod}+Shift+KP_1" = "move container to workspace number 1; workspace 1";
          "${mainMod}+Shift+KP_2" = "move container to workspace number 2; workspace 2";
          "${mainMod}+Shift+KP_3" = "move container to workspace number 3; workspace 3";
          "${mainMod}+Shift+KP_4" = "move container to workspace number 4; workspace 4";
          "${mainMod}+Shift+KP_5" = "move container to workspace number 5; workspace 5";
          "${mainMod}+Shift+KP_6" = "move container to workspace number 6; workspace 6";
          "${mainMod}+Shift+KP_7" = "move container to workspace number 7; workspace 7";
          "${mainMod}+Shift+KP_8" = "move container to workspace number 8; workspace 8";
          "${mainMod}+Shift+KP_9" = "move container to workspace number 9; workspace 9";
          "${mainMod}+Shift+KP_0" = "move container to workspace number 10; workspace 10";
          "${mainMod}+Shift+KP_End" = "move container to workspace number 1; workspace 1";
          "${mainMod}+Shift+KP_Down" = "move container to workspace number 2; workspace 2";
          "${mainMod}+Shift+KP_Next" = "move container to workspace number 3; workspace 3";
          "${mainMod}+Shift+KP_Left" = "move container to workspace number 4; workspace 4";
          "${mainMod}+Shift+KP_Begin" = "move container to workspace number 5; workspace 5";
          "${mainMod}+Shift+KP_Right" = "move container to workspace number 6; workspace 6";
          "${mainMod}+Shift+KP_Home" = "move container to workspace number 7; workspace 7";
          "${mainMod}+Shift+KP_Up" = "move container to workspace number 8; workspace 8";
          "${mainMod}+Shift+KP_Prior" = "move container to workspace number 9; workspace 9";
          "${mainMod}+Shift+KP_Insert" = "move container to workspace number 10; workspace 10";

          # Move workspace to another output.
          "${mainMod}+Control+Shift+Left" = "move workspace to output left";
          "${mainMod}+Control+Shift+Down" = "move workspace to output down";
          "${mainMod}+Control+Shift+Up" = "move workspace to output up";
          "${mainMod}+Control+Shift+Right" = "move workspace to output right";

          # Move workspace to another output.
          "${mainMod}+Control+Shift+H" = "move workspace to output left";
          "${mainMod}+Control+Shift+J" = "move workspace to output down";
          "${mainMod}+Control+Shift+K" = "move workspace to output up";
          "${mainMod}+Control+Shift+L" = "move workspace to output right";

          # Scratchpad show and move
          "${mainMod}+S" = "scratchpad show";
          "${mainMod}+Shift+S" = "move scratchpad";

          "Ctrl+Mod1+M" = "mode move";
          "Ctrl+Mod1+R" = "mode resize";
        };

        modes = {
          move = {
            Escape = "mode default";
            Left = "move left";
            Down = "move down";
            Up = "move up";
            Right = "move right";
            H = "move left";
            J = "move down";
            K = "move up";
            L = "move right";
            S = "move scratchpad";
            "1" = "move container to workspace number 1; workspace 1";
            "2" = "move container to workspace number 2; workspace 2";
            "3" = "move container to workspace number 3; workspace 3";
            "4" = "move container to workspace number 4; workspace 4";
            "5" = "move container to workspace number 5; workspace 5";
            "6" = "move container to workspace number 6; workspace 6";
            "7" = "move container to workspace number 7; workspace 7";
            "8" = "move container to workspace number 8; workspace 8";
            "9" = "move container to workspace number 9; workspace 9";
            "0" = "move container to workspace number 10; workspace 10";
            "KP_1" = "move container to workspace number 1; workspace 1";
            "KP_2" = "move container to workspace number 2; workspace 2";
            "KP_3" = "move container to workspace number 3; workspace 3";
            "KP_4" = "move container to workspace number 4; workspace 4";
            "KP_5" = "move container to workspace number 5; workspace 5";
            "KP_6" = "move container to workspace number 6; workspace 6";
            "KP_7" = "move container to workspace number 7; workspace 7";
            "KP_8" = "move container to workspace number 8; workspace 8";
            "KP_9" = "move container to workspace number 9; workspace 9";
            "KP_0" = "move container to workspace number 10; workspace 10";
            "KP_End" = "move container to workspace number 1; workspace 1";
            "KP_Down" = "move container to workspace number 2; workspace 2";
            "KP_Next" = "move container to workspace number 3; workspace 3";
            "KP_Left" = "move container to workspace number 4; workspace 4";
            "KP_Begin" = "move container to workspace number 5; workspace 5";
            "KP_Right" = "move container to workspace number 6; workspace 6";
            "KP_Home" = "move container to workspace number 7; workspace 7";
            "KP_Up" = "move container to workspace number 8; workspace 8";
            "KP_Prior" = "move container to workspace number 9; workspace 9";
            "KP_Insert" = "move container to workspace number 10; workspace 10";
          };
          resize = {
            Escape = "mode default";
            Left = "resize shrink width 10 px";
            Down = "resize grow height 10 px";
            Up = "resize shrink height 10 px";
            Right = "resize grow width 10 px";
          };
        };

        window.titlebar = false;
        floating.titlebar = false;

        colors.background = "$base";

        colors.focused = {
          background = "$base";
          border = "\$${config.catppuccin.accent}";
          childBorder = "\$${config.catppuccin.accent}";
          indicator = "\$${config.catppuccin.accent}";
          text = "$text";
        };

        colors.focusedInactive = {
          background = "$base";
          border = "$text";
          childBorder = "$text";
          indicator = "$text";
          text = "$text";
        };

        colors.unfocused = {
          background = "$base";
          border = "$text";
          childBorder = "$text";
          indicator = "$text";
          text = "$text";
        };
      };
  };
}
