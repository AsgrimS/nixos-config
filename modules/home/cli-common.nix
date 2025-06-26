{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tldr
    ripgrep
    lazygit
    lazydocker
    bottom
    fastfetch
    devenv
    awscli2
  ];
}
