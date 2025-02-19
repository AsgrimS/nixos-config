{ pkgs, config, ... }: {
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

  programs.zsh.initExtra = ''
    echo
    fastfetch
    complete -C '${config.home.homeDirectory}/.nix-profile/bin/aws_completer' aws
  '';
}
