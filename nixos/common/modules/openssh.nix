{ ... }: {
  services.openssh = {
    enable = true;
    allowSFTP = true;

    settings = {
      PrintMotd = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      AllowGroups = [ "users" ];
    };

    ports = [ 33727 ];
    openFirewall = true;
  };
}