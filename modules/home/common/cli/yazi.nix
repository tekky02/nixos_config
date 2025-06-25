{ ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    settings = {
      opener = {
        edit = [
          {
            run = ''
              nvim "$@"
            '';
            block = true;
            for = "unix";
          }
        ];
      };
    };
  };
}
