{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cargo
    rust-analyzer
    cargo-make
  ];
}
