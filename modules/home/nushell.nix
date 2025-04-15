{ config, ... }:
{
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        let carapace_completer = {|spans|
        carapace $spans.0 nushell ...$spans | from json
        }
        $env.config = {
         show_banner: false,
         buffer_editor: "nvim",
         completions: {
         case_sensitive: false # case-sensitive completions
         quick: true    # set to false to prevent auto-selecting completions
         partial: true    # set to false to prevent partial filling of the prompt
         algorithm: "fuzzy"    # prefix or fuzzy
         external: {
         # set to false to prevent nushell looking into $env.PATH to find more suggestions
             enable: true 
         # set to lower can improve completion performance at the cost of omitting some options
             max_results: 100 
             completer: $carapace_completer # check 'carapace_completer' 
           }
         }
        } 
        $env.PATH = ($env.PATH | 
        split row (char esep) |
        prepend ${config.home.username}/.apps |
        append /usr/bin/env
        )
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
