{ inputs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with inputs.nixpkgs; [ thunar-archive-plugin ];
  };

  programs.xfconf.enable = true;
}
