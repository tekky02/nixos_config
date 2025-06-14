{ ... }:
{
  programs.rmpc.enable = true;
  xdg.configFile."rmpc/config.ron".source = ./config.ron;
  xdg.configFile."rmpc/themes/default_theme.ron".source = ./default_theme.ron;
}
