{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi-wayland ];
  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/theme.rasi".source = ./theme.rasi;
}
