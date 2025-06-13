{ ... }:
{
  imports = [
    ./cli # command line tools
    ./dev # develop
    ./hyprland # window manager
    ./waybar # status bar
    ./terminal # terminal
    ./music_player
    # ./aseprite/aseprite.nix           # pixel art editor
    # ./audacious.nix                   # music player
    ./browser.nix # firefox based browser
    ./cava.nix # audio visualizer
    # ./discord.nix                     # discord
    # ./flow.nix                        # terminal text editor
    # ./gaming.nix                      # packages related to gaming
    # ./ghostty.nix                     # terminal
    ./git.nix # version control
    # ./gnome.nix                       # gnome apps
    # ./gtk.nix                         # gtk theme
    # ./lazygit.nix
    # ./micro.nix                       # nano replacement
    # ./nemo.nix                        # file manager
    ./nvim.nix # neovim editor
    # ./obsidian.nix
    # ./p10k/p10k.nix
    ./../pkgs # other packages
    # ./retroarch.nix
    ./rofi # launcher
    # ./scripts/scripts.nix             # personal scripts
    # ./ssh.nix                         # ssh config
    # ./superfile/superfile.nix         # terminal file manager
    ./swaylock.nix # lock screen
    # ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix # notification deamon
    # ./viewnior.nix                    # image viewer
    # ./vscodium                        # vscode fork
    ./waypaper.nix # GUI wallpaper picker
    # ./xdg-mimes.nix                   # xdg config
    ./input.nix
    ./fish.nix
    ./trans.nix
  ];
}
