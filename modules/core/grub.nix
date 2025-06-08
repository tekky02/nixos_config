{ host, ... }:
{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    timeout = 10;
  };

  boot.loader.grub2-theme =
    let
      resolution = if host == "desktop" then "3840x2160" else "2560x1440";
    in
    {
      enable = true;
      theme = "stylish";
      footer = true;
      customResolution = resolution;
    };
}
