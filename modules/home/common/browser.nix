{ inputs, pkgs, ... }:
{
  home.packages = (with pkgs; [ firefox ]);

  programs."google-chrome" = {
    enable = true;
  };
}
