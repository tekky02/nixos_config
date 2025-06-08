{ ... }:
{
  imports = [
    ./bootloader.nix
    ./grub.nix
    ./pipewire.nix
    ./podman.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./thunar.nix
  ];
}
