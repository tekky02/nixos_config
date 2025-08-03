{
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # Define on which hard driver you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
}
