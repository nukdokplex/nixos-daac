{ vars }: {
  wayland.windowManager.hyprland.settings = {
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
  };
}
