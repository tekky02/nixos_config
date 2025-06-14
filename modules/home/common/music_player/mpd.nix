{ config, ... }:
let
  homeDirectory = config.home.homeDirectory;
in
{
  services.mpd = {
    enable = true;
    musicDirectory = "${homeDirectory}/music";
  };
}
