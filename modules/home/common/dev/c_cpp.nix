{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnumake
    gcc
    gdb
    cmake
    valgrind
    llvmPackages_20.clang-tools
  ];
}
