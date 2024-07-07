{ pkgs, ...}: {
  users.users.nukdokplex = {
    isNormalUser = true;
    description = "NukDokPlex";
    extraGroups = ["wheel" "networkmanager" "input" "vboxsf"];
    packages = with pkgs; [];
  };
}