{ lib, ... }: {
  networking.firewall = {
    allowPing = true;
    extraInputRules = ''
      ip saddr 192.168.1.0/24 tcp dport 22000 accept
    '';
  };
}
