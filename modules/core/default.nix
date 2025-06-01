{ ... }:
{
  imports = [
    ./bootloader.nix
    # ./input.nix
    ./pipewire.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
  ];
}
