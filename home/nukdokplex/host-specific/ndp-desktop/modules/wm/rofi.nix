{ flakeRootPath, config, ... }: {
  xdg.configFile.rofi = {
    source = "${flakeRootPath}/assets/rofi";
    target = "${config.xdg.configHome}/rofi";
    recursive = true;
  };
}