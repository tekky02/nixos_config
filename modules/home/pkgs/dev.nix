{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nixd # nix lsp
    nixfmt-rfc-style # nix formatter
  ];
}
