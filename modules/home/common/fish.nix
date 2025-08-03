{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      {
        name = "grc";
        src = grc.src;
      }
    ];
  };
}
