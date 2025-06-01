{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nixd                              # nix lsp
    nixfmt-rfc-style                  # nix formatter

    # C / C++
    gcc
    gdb
    cmake
    valgrind
    llvmPackages_20.clang-tools

    # Python
    python3
    python312Packages.ipython
  ];
}
