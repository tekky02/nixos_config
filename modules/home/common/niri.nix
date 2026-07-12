{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.niri.homeModules.niri ];
  xdg.portal.enable = lib.mkForce true;
  programs.niri = {
    package = pkgs.niri;
    enable = true;

    settings = {

      prefer-no-csd = true;

      outputs."eDP-1".scale = 2.0;

      binds = with config.lib.niri.actions; {
        "Mod+Shift+Slash".action = show-hotkey-overlay;

        "Mod+Return".action = spawn "alacritty";

        "Mod+Space".action = spawn "fuzzel";
        "Mod+B".action = spawn "google-chrome-stable";

        "Mod+O".action = toggle-overview;

        "Mod+Q".action = close-window;

        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;

        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+J".action = move-window-down;
        "Mod+Ctrl+K".action = move-window-up;
        "Mod+Ctrl+L".action = move-column-right;

        "Mod+Shift+H".action = focus-monitor-left;
        "Mod+Shift+L".action = focus-monitor-right;

        "Mod+F".action = maximize-column;

        # workspaces
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;

        "XF86AudioRaiseVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1+"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1-"
        ];

      };
      layout = {
        focus-ring = {
          active = {
            color = "#779988";
          };
        };
      };

      # spawn
      spawn-at-startup = [
        { argv = [ "waybar" ]; }

      ];
    };
  };
}
