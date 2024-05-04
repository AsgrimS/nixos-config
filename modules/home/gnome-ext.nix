{ pkgs, ... }: rec {
  imports = [
    ./gnome.nix
  ];

  home.packages = with pkgs.gnomeExtensions; [
    dash-to-panel
    appindicator
  ];

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) home.packages;
    "org/gnome/shell".disabled-extensions = [ ];

    "org/gnome/shell/extensions/dash-to-panel" = {
      panel-positions = ''{"0":"TOP","1":"TOP","2":"TOP"}'';
      panel-sizes = ''{"0":"34","1":"34","2":"34"}'';
      trans-use-custom-opacity = true;
      trans-use-dynamic-opacity = true;
      intellihide = true;
    };
  };
}
