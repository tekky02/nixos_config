{ ... }:
{
  imports = [
    ./bootloader.nix
    # ./input.nix
    ./pipewire.nix
    ./podman.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
  ];
}
