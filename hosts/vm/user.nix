{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "whell"
      "podman"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      btop
      fish
      git
      podman-compose
    ];
  };

  programs.fish.enable = true;
}
