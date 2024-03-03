{ pkgs, ...}: {
 programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 11;
      };
      selection.save_to_clipboard = true;
    };

  };
}
