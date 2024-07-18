{ pkgs, flakeInputs, ... }: {
  services.printing = {
    enable = true;
    logLevel = "debug";
    drivers = [
      flakeInputs.epson_201310w.packages.x86_64-linux.default
      pkgs.gutenprint
    ];
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Epson_L120_Series";
        location = "Home";
        deviceUri = "usb://EPSON/L120%20Series?serial=544E594B3132383744";
        model = "EPSON_L120.ppd";
      }
    ];
  };
}
