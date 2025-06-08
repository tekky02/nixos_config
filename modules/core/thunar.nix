{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin ];
  };

  programs.xfconf.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities
}
