{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
		# enable lingering for this user
		# see https://www.freedesktop.org/software/systemd/man/latest/loginctl.html#:~:text=Enable%2Fdisable%20user%20lingering%20for,to%20run%20long%2Drunning%20services.
		linger = true;
    extraGroups = [
      "wheel"
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
