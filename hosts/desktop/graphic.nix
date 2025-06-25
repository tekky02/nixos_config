{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
