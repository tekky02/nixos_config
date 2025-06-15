{ host, ... }:
let
  browser = "firefox";
  terminal = "kitty";
  exec_once_extra = if host == "laptop" then [ "poweralertd &" ] else [ ];
in
{
  wayland.windowManager.hyprland = {
    settings = {
      # autostart
      exec-once = [
        # "hash dbus-update-activation-environment 2>/dev/null"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar &"
        "swaync &"
        # "hyprctl setcursor Bibata-Modern-Ice 32 &"
        "swww-daemon &"
        # "hyprlock"

        # "${terminal} --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false"
        # "[workspace 1 silent] ${browser}"
        # "[workspace 2 silent] ${terminal}"
      ] ++ exec_once_extra;

      input = {
        # kb_layout = "us,fr";
        kb_options = "grp:alt_caps_toggle";
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 0;
        float_switch_override_focus = 0;
        mouse_refocus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 12;
        border_size = 2;
        "col.active_border" = "rgb(98971A) rgb(CC241D) 45deg";
        "col.inactive_border" = "0x00000000";
        # border_part_of_window = false;
        no_border_on_floating = false;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      dwindle = {
        force_split = 2;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 10;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          brightness = 1;
          contrast = 1.4;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = true;

          ignore_window = true;
          offset = "0 2";
          range = 20;
          render_power = 3;
          color = "rgba(00000055)";
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "fade_curve, 0, 0.55, 0.45, 1"
        ];

        animation = [
          # name, enable, speed, curve, style

          # Windows
          "windowsIn,   0, 4, easeOutCubic,  popin 20%" # window open
          "windowsOut,  1, 7, default,  popin 80%" # window close.
          "windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn,      1, 3,   fade_curve" # fade in (open) -> layers and windows
          "fadeOut,     1, 3,   fade_curve" # fade out (close) -> layers and windows
          "fadeSwitch,  0, 1,   easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow,  1, 10,  easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim,     1, 4,   fluent_decel" # the easing of the dimming of inactive windows
          # "border,      1, 2.7, easeOutCirc"  # for animating the border's color switch speed
          # "borderangle, 1, 30,  fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 6, default" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      binds = {
        movefocus_cycles_fullscreen = true;
      };

      bind =
        let
          workspace_binds = (
            builtins.concatLists (
              builtins.genList (
                i:
                let
                  ws = i + 1;
                in
                [
                  "$mainMod, code:1${toString i}, workspace, ${toString ws}"
                  "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              ) 9
            )
          );
          rog_laptop_binds = [
            # ROG G15 Strix (2021) Specific binds
            ",156, exec, rog-control-center" # ASUS Armory crate key
            ",211, exec, asusctl profile -n; pkill -SIGRTMIN+8 waybar" # Fan Profile key switch between power profiles
            ",121, exec, pamixer -t" # Speaker Mute FN+F1
            ",122, exec, pamixer -d 5" # Volume lower key
            ",123, exec, pamixer -i 5" # Volume Higher key
            ",256, exec, pamixer --default-source -t" # Mic mute key
            ",232, exec, brightnessctl set 10%-" # Screen brightness down FN+F7
            ",233, exec, brightnessctl set 10%+" # Screen brightness up FN+F8
            ",237, exec, brightnessctl -d asus::kbd_backlight set 33%-" # Keyboard brightness down FN+F2
            ",238, exec, brightnessctl -d asus::kbd_backlight set 33%+" # Keyboard brightnes up FN+F3
            ",210, exec, asusctl led-mode -n" # Switch keyboard RGB profile FN+F4
          ];
        in
        workspace_binds
        ++ rog_laptop_binds
        ++ [
          # show keybinds list
          "$mainMod, F1, exec, show-keybinds"

          # keybindings
          "$mainMod, Return, exec, ${terminal}"
          # "ALT, Return, exec, [float; size 1111 700] ${terminal}"
          "$mainMod SHIFT, Return, exec, [fullscreen] ${terminal}"
          "$mainMod, B, exec, firefox"
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, Q, exit,"
          "$mainMod, F, fullscreen, 0"
          "$mainMod SHIFT, F, fullscreen, 1" # fullscreen with bar
          "$mainMod, Space, exec, rofi -show drun || pkill rofi"
          # "$mainMod SHIFT, D, exec, webcord --enable-features=UseOzonePlatform --ozone-platform=wayland"
          # "$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
          "$mainMod, Escape, exec, swaylock"
          # "ALT, Escape, exec, hyprlock"
          "$mainMod SHIFT, Escape, exec, power-menu"
          "$mainMod, P, pseudo,"
          "$mainMod, X, togglesplit,"
          "$mainMod, T, exec, toggle-oppacity"
          # "$mainMod, E, exec, nemo"
          # "ALT, E, exec, hyprctl dispatch exec '[float; size 1111 700] nemo'"
          "$mainMod SHIFT, B, exec, toggle-waybar"
          # "$mainMod, C ,exec, hyprpicker -a"
          # "$mainMod, W,exec, wallpaper-picker"
          # "$mainMod SHIFT, W,exec, hyprctl dispatch exec '[float; size 925 615] waypaper'"
          # "$mainMod, N, exec, swaync-client -t -sw"
          # "CTRL SHIFT, Escape, exec, hyprctl dispatch exec '[workspace 9] missioncenter'"
          # "$mainMod, equal, exec, woomer"
          # "$mainMod SHIFT, W, exec, vm-start"

          # screenshot
          ",Print, exec, screenshot --copy"
          "$mainMod, Print, exec, screenshot --save"
          "$mainMod SHIFT, Print, exec, screenshot --swappy"

          # switch focus
          "$mainMod, left,  movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up,    movefocus, u"
          "$mainMod, down,  movefocus, d"
          "$mainMod, h, movefocus, l"
          "$mainMod, j, movefocus, d"
          "$mainMod, k, movefocus, u"
          "$mainMod, l, movefocus, r"

          "$mainMod, left,  alterzorder, top"
          "$mainMod, right, alterzorder, top"
          "$mainMod, up,    alterzorder, top"
          "$mainMod, down,  alterzorder, top"
          "$mainMod, h, alterzorder, top"
          "$mainMod, j, alterzorder, top"
          "$mainMod, k, alterzorder, top"
          "$mainMod, l, alterzorder, top"

          # "CTRL ALT, up, exec, hyprctl dispatch focuswindow floating"
          # "CTRL ALT, down, exec, hyprctl dispatch focuswindow tiled"

          # window control
          "$mainMod SHIFT, left, movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, up, movewindow, u"
          "$mainMod SHIFT, down, movewindow, d"
          "$mainMod SHIFT, h, movewindow, l"
          "$mainMod SHIFT, j, movewindow, d"
          "$mainMod SHIFT, k, movewindow, u"
          "$mainMod SHIFT, l, movewindow, r"

          "$mainMod CTRL, left, resizeactive, -80 0"
          "$mainMod CTRL, right, resizeactive, 80 0"
          "$mainMod CTRL, up, resizeactive, 0 -80"
          "$mainMod CTRL, down, resizeactive, 0 80"
          "$mainMod CTRL, h, resizeactive, -80 0"
          "$mainMod CTRL, j, resizeactive, 0 80"
          "$mainMod CTRL, k, resizeactive, 0 -80"
          "$mainMod CTRL, l, resizeactive, 80 0"

          "$mainMod ALT, left, moveactive,  -80 0"
          "$mainMod ALT, right, moveactive, 80 0"
          "$mainMod ALT, up, moveactive, 0 -80"
          "$mainMod ALT, down, moveactive, 0 80"
          "$mainMod ALT, h, moveactive,  -80 0"
          "$mainMod ALT, j, moveactive, 0 80"
          "$mainMod ALT, k, moveactive, 0 -80"
          "$mainMod ALT, l, moveactive, 80 0"

          "$mainMod, mouse_down, workspace, e-1"
          "$mainMod, mouse_up, workspace, e+1"

          # clipboard manager
          # "$mainMod, V, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;} listview {columns: 1;}' | cliphist decode | wl-copy"
        ];

      # # binds active in lockscreen
      # bindl = [
      #   # laptop brigthness
      #   ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      #   ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      #   "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
      #   "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"
      # ];

      # # binds that repeat when held
      # binde = [
      #   ",XF86AudioRaiseVolume,exec, pamixer -i 2"
      #   ",XF86AudioLowerVolume,exec, pamixer -d 2"
      # ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
        "opacity 0.8 0.8,class:^(alacritty)$"
        "opacity 0.95 0.95,class:^(firefox)$"
        "float,title:^(图片查看器)$"
        "center,title:^(图片查看器)$"
      ];

      # No gaps when only
      workspace = [
        "w[t1], gapsout:0, gapsin:0"
        "w[tg1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
    };

    extraConfig =
      let
        scale_main = if host == "desktop" then 1.875 else 1.5;
        scale = if host == "desktop" then 1.875 else 1.5;
      in
      "
monitor = DP-1, highres, auto, ${toString scale_main}
monitor = HDMI-A-1, preferred, auto, ${toString scale}

xwayland {
force_zero_scaling = true
}";
  };
}
