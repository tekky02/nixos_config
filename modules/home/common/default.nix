{ inputs, ... }:
{
  imports = [
    ./cli # command line tools
    ./dev # develop
    ./hyprland # window manager
    ./multimedia
    ./music_player
    ./nvim # neovim editor
    ./rofi # launcher
    ./stylix
    ./swaync/swaync.nix # notification deamon
    ./terminal # terminal
    ./waybar # status bar
    # ./aseprite/aseprite.nix           # pixel art editor
    # ./audacious.nix                   # music player
    ./browser.nix # firefox based browser
    ./cava.nix # audio visualizer
    # ./discord.nix                     # discord
    # ./flow.nix                        # terminal text editor
    # ./gaming.nix                      # packages related to gaming
    # ./ghostty.nix                     # terminal
    # ./gnome.nix                       # gnome apps
    # ./gtk.nix                         # gtk theme
    # ./lazygit.nix
    # ./micro.nix                       # nano replacement
    # ./nemo.nix                        # file manager
    # ./obsidian.nix
    # ./p10k/p10k.nix
    ./../pkgs # other packages
    # ./retroarch.nix
    # ./scripts/scripts.nix             # personal scripts
    # ./ssh.nix                         # ssh config
    # ./superfile/superfile.nix         # terminal file manager
    ./swaylock.nix # lock screen
    # ./swayosd.nix                     # brightness / volume wiget
    # ./viewnior.nix                    # image viewer
    # ./vscodium                        # vscode fork
    ./waypaper.nix # GUI wallpaper picker
    # ./xdg-mimes.nix                   # xdg config
    ./input.nix
    ./fish.nix
    ./trans.nix
  ];
}
