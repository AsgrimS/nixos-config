{ config, ... }:
{
  programs = {
    nushell = {
      enable = true;

      settings = {
        show_banner = false;
        buffer_editor = "nvim";
        completions = {
          case_sensitive = false;
          quick = true; # set to false to prevent auto-selecting completions
          partial = true; # set to false to prevent partial filling of the prompt
          algorithm = "fuzzy"; # prefix or fuzzy
          external = {
            enable = true; # set to false to prevent nushell looking into $env.PATH to find more suggestions
            max_results = 100; # set to lower can improve completion performance at the cost of omitting some options
          };
        };
      };

      extraConfig = ''
        $env.config.completions.external.completer = {|spans| carapace $spans.0 nushell ...$spans | from json}

        $env.PATH = ($env.PATH | 
          split row (char esep) |
          prepend ${config.home.username}/.apps |
          append /usr/bin/env
        )
      '';

      extraLogin = ''
        echo "\n"
        fastfetch
      '';

      shellAliases = {
        n-rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos-config#desktop";
        n-update = "nix flake update -I ~/.config/nixos-config";
        n-clean = "sudo nix-collect-garbage -d";
        j = "z";
      };
    };

    starship.enable = true;

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
