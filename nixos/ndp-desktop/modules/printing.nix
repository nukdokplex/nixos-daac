{ pkgs, ... }: {
  services.printing = {
    enable = true;
    # drivers = with pkgs; [ epson_201207w ];
  };

  # hardware.printers = {
  #   ensurePrinters = [
  #     {
  #       name = "Epson_L120";
  #       location = "Home";
  #       deviceUri = "usb://EPSON/L120%20Series?serial=544E594B3132383744";
  #       model = "EPSON_L110.ppd";
  #     }
  #   ];
  # };
}
