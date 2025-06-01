{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
    # These could also go into programs.neovim.extraPackages.
    # When i am developing and notice I am missing something I usually just launch myself into a nix shell or i add it here.
    home.packages = with pkgs; [
      zig
    ];

    home.sessionVariables = {
      NVIM_APPNAME = "lazyvim";
    };

    xdg.configFile."lazyvim/init.lua" = {
      source = "${inputs.LazyVim}/init.lua";
    };

    xdg.configFile."lazyvim/lua" = {
      source = "${inputs.LazyVim}/lua";
      recursive = true;
    };

    programs.neovim = {
      enable = true;
      vimAlias = false;
      vimdiffAlias = false;
      defaultEditor = false;
    };
}
