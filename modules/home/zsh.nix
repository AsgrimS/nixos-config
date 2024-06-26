{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    autosuggestion = {
      enable = true;
    };
  };
}
