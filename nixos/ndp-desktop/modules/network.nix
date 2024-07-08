{ lib, ... }: {
  networking.firewall = {
    allowPing = true;
    allowedTCPPorts = [ 
      22000 # syncthing
      36500 # torrent
    ];
    allowedUDPPorts = [ 
      36500 # torrent
    ];
  };
}
