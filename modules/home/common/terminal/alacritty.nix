{ lib, ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_dark";
    settings = {
      env.TERM = "xterm-256color";
      window = {
        opacity = lib.mkForce 0.8;
      };
      font = {
        size = lib.mkForce 16;
        normal = {
          family = lib.mkForce "Maple Mono NF CN";
        };
      };
    };
  };
}
