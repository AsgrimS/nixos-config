{ pkgs, config, ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";

      shell = {
        program = "${config.home.homeDirectory}/.nix-profile/bin/zsh";
        args = [ "-l" "-c" "tmux new-session -A -s main" ];
      };

      font = {
        normal = {
          family = "Fira Code Nerd Font";
        };
        size = 11;
      };

      selection.save_to_clipboard = true;

      window = {
        padding = {
          x = 5;
          y = 0;
        };
      };

      # One Dark theme
      colors = {
        primary = {
          background = "#282c34";
          foreground = "#abb2bf";
        };
        normal = {
          black = "#1e2127";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };
        bright = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#ffffff";
        };
      };
    };

  };
}
