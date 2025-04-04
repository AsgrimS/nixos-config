{ pkgs, config, ... }:
{

  home.packages = with pkgs; [
    dconf-editor
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
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      workspaces-only-on-primary = true;
      edge-tiling = true;
      experimental-features = [
        "scale-monitor-framebuffer"
        "xwayland-native-scaling"
        # "variable-refresh-rate"
      ];
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
    "org/gnome/desktop/session" = {
      idle-delay = 600; # 10 minutes
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
      power-button-action = "interactive";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
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
