{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua-language-server
    stylua
    nil
    nixfmt-rfc-style
  ];
}
