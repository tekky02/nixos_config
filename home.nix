{ config, pkgs, ... }:

{
  home.username = "tekky";
  home.homeDirectory = "/home/tekky";
  
  # user packages
  home.packages = with pkgs; [
    # hyprland related
    waybar
    swaybg
    swaylock

    # file
    # thunar

    neofetch
    nnn

    # utils
    ripgrep
    eza
    fzf
    btop
    bat
    zoxide
    dysk

    # misc
    tree
    gnutar

    # terminal & shell
    alacritty
    kitty
    fish
    neovim

    wofi

    firefox
  ];

  programs.kitty.enable = true;
  wayland.windowManager.hyprland.enable = true;

  programs.git = {
    enable = true;
    userName = "tekky02";
    userEmail = "tekkykk02@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 16;
        normal = {
          family = "Maple Mono NF CN";
        };
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  wayland.windowManager.hyprland.settings = {
    "monitor" = ",highres,auto,auto";

    "exec-once" = "waybar";

    "$terminal" = "alacritty";
    "$fileManager" = "nnn";
    "$menu" = "wofi --show drun";
    "$browser" = "firefox";
    
    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, Q, killactive"
      "$mainMod, B, exec, $browser"
      "$mainMod, SPACE, exec, $menu"
      "$mainMod, L, exec, swaylock"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, exec, togglefloating"
      "$mainMod SHIFT, M, exec, exit"
      "$mainMod SHIFT, F, fullscreen"

      # mouse
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ]
    ++ (
      builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
          "$mainMod, code:1${toString i}, workspace, ${toString ws}"
          "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
        ]
      )
      9)
    );

    bindm = [
      "$mainMod, mouse:272, movewidow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };

  home.stateVersion = "25.05";
}
