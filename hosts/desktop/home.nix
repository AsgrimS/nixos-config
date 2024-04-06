{ config, pkgs, ... }:

{
  home.username = "asgrim";
  home.homeDirectory = "/home/asgrim";

  imports = [
    ../../modules/home/bundles/terminal.nix
    ../../modules/home/gnome-ext.nix
  ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executabl
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    brave
  ];

  programs.git = {
    enable = true;
    userName = "AsgrimS";
    userEmail = "jan.semik@gmail.com";
  };

  programs.zsh.shellAliases = {
    update = "sudo nixos-rebuild switch --flake ~/.config/nixos-config#desktop";
    j = "z";
  };


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
