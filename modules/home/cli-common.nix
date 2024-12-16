{ pkgs, ... }: {
  home.packages = with pkgs; [
    tldr
    ripgrep
    lazygit
    lazydocker
    bottom
    devbox
    fastfetch
    devenv
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
