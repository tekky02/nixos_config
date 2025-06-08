{ inputs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with inputs.nixpkgs.xfce; [ thunar-archive-plugin ];
  };

  programs.xfconf.enable = true;
}
