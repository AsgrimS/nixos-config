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
    awscli2
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
