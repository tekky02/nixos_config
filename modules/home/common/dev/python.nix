{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    python312Packages.ipython
  ];
}
