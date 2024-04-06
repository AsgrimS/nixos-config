{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    gnome.dconf-editor
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      monospace-font-name = "FiraCode Nerd Font 11";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "${config.home.homeDirectory}/.config/nixos-config/assets/mountains.jpg";
      picture-uri-dark = "${config.home.homeDirectory}/.config/nixos-config/assets/mountains.jpg";
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
}
