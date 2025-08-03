{ pkgs, config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./graphic.nix
    ./../../modules/core
  ];

  networking.hostName = "nixos-dek"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  services = {
    # ASUS ROG
    supergfxd.enable = true;
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };
}
