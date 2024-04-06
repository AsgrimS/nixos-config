{ pkgs, ... }: {
  home.packages = with pkgs; [
    tldr
    ripgrep
    lazygit
    lazydocker
    bottom
    devbox
    fastfetch
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
