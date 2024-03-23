{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;

    extraConfig = ''
      set -ag terminal-overrides ',xterm-256color:RGB'
    '';

    plugins = with pkgs; [
      tmuxPlugins.onedark-theme
    ];
  };
}
