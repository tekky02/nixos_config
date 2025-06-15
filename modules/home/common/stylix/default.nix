{ config, inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    image = ../../../../assets/wallpapers/Frieren.jpeg;
    # image = "${config.home.homeDirectory}/Pictures/wallpapers/miku/1311796.png";
  };
}
