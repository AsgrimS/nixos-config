{ pkgs, ... }: {
  home.packages = with pkgs; [
    tldr
    ripgrep
    lazygit
    lazydocker
    bottom
    devbox
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
