{ lib, ...}: {
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = lib.mkDefault true;
  networking.nftables.enable = lib.mkDefault true;
  networking.firewall.enable = lib.mkDefault true;
}