{ pkgs, ... }:
{
  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons
      fcitx5-gtk # Fcitx5 gtk in module and glib based dbus client library
      fcitx5-material-color
      fcitx5-pinyin-zhwiki
      fcitx5-pinyin-moegirl
    ];

    fcitx5.settings = {
      addons = {
        classicui.globalSection = {
          Theme = "Material-Color-deepPurple";
          DarkTheme = "Material-Color-deepPurple";
          Font = "Maple Mono NF CN 20";
          MenuFont = "Maple Mono NF CN 20";
          TrayFont = "Maple Mono NF CN 20";
          # TrayOutlineColor = "#aa007f";
          # EnableFractionalScale = "True";
        };
        pinyin.globalSection = {
          PageSize = 9;
          CloudPinyinEnabled = "True";
          CloudPinyinIndex = 2;
        };
        cloudpinyin.globalSection = {
          Backend = "Baidu";
        };
      };
      inputMethod = {
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "keyboard-us";
        };
        "Groups/0/Items/0".Name = "keyboard-us";
        "Groups/0/Items/1".Name = "pinyin";
        GroupOrder."0" = "Default";
      };
    };
  };
}
