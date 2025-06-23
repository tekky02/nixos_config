{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin ];
  };

  # enable preference changes
  programs.xfconf.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities
}
