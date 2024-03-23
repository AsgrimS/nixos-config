{ pkgs, config, ... }: {
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
}
