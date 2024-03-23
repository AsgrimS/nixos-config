{ config, pkgs, ... }:

{
  home.username = "asgrim";
  home.homeDirectory = "/home/asgrim";

  imports = [
    ../../modules/home/alacritty.nix
    ../../modules/home/tmux.nix
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
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    brave
    ripgrep
    lazygit
    lazydocker
    bottom
    mise
    gnome.dconf-editor
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/.config/.nixos#default";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    autosuggestion = {
      enable = true;
    };
  };



  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "AsgrimS";
    userEmail = "jan.semik@gmail.com";
  };

  programs.starship = {
    enable = true;
  };

  fonts.fontconfig.enable = true;

  dconf.settings = {
    #"org/gnome/desktop/background" = {
    #  picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
    #};
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      monospace-font-name = "FiraCode Nerd Font 11";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
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
