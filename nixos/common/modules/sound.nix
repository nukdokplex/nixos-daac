{ lib, ... }: {
  # disable pulseaudio sound server
  hardware.pulseaudio.enable = lib.mkDefault false;
  
  # use pipewire sound server
  services.pipewire = lib.mkDefault {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };
}