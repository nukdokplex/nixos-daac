{ lib, ... }: {
  hardware.bluetooth = {
    enable = lib.mkDefault true;
    powerOnBoot = lib.mkDefault true;
    settings = {
      General = {
        Experimental = lib.mkDefault true;
      };
    };
  };
}
