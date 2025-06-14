{ ... }:
{
  imports = [
    ./hyprland # window manager
    ./waybar # status bar
    ./terminal # terminal
    ./music_player
    # ./aseprite/aseprite.nix           # pixel art editor
    # ./audacious.nix                   # music player
    ./bat.nix # better cat command
    ./browser.nix # firefox based browser
    ./btop.nix # resouces monitor
    ./cava.nix # audio visualizer
    # ./discord.nix                     # discord
    ./fastfetch.nix # fetch tool
    # ./flow.nix                        # terminal text editor
    ./fzf.nix # fuzzy finder
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
    ./rofi.nix # launcher
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
    ./zoxide.nix
    ./fish.nix
    ./trans.nix
  ];
}
