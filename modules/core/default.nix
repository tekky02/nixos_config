{ ... }:
{
  imports = [
    ./bootloader.nix
    ./pipewire.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
  ];
}
