{ ... } :
{
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_dark";
    settings = {
      env.TERM = "xterm-256color";
      window = {
      	opacity = 0.8;
      };
      font = {
        size = 16;
	normal = {
	  family = "Maple Mono NF CN";
	};
      };
    };
  };
}
