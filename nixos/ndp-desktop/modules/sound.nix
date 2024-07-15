{ pkgs, ... }: {
  # hardware.pulseaudio = {
  #   enable = true;
  #   support32Bit = true;
  # };

  # services.pipewire.enable = false;

  # hardware.pulseaudio.configFile = pkgs.runCommand "default.pa" { } ''
  #   sed 's/module-udev-detect$/module-udev-detect tsched=0/' \
  #     ${pkgs.pulseaudio}/etc/pulse/default.pa > $out
  # '';

  # users.extraUsers.nukdokplex.extraGroups = [ "audio" ];
}
