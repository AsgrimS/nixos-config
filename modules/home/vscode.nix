{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      zhuangtongfa.material-theme
      jnoortheen.nix-ide
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      svelte.svelte-vscode
      jgclark.vscode-todo-highlight
      github.copilot
      github.copilot-chat
      github.vscode-pull-request-github
      rust-lang.rust-analyzer
      pkief.material-icon-theme
      tauri-apps.tauri-vscode
      ms-python.python
      ms-python.vscode-pylance
      ms-python.debugpy
      ms-azuretools.vscode-docker
    ];

    userSettings = {
      "editor.fontFamily" =
        "'FiraCode Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
      "debug.console.fontSize" = 16;
      "editor.fontSize" = 16;

      "editor.formatOnSave" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";

      # Rust
      "[rust]" = { "editor.defaultFormatter" = "rust-lang.rust-analyzer"; };
      "rust-analyzer.checkOnSave.command" = "clippy";
      "rust-analyzer.checkOnSave.enable" = true;

      # Nix
      "[nix]" = { "editor.defaultFormatter" = "jnoortheen.nix-ide"; };
      "nix.enableLanguageServer" = true;
      "nix.serverSettings" = {
        "nil" = { "formatting" = { "command" = [ "nixfmt" ]; }; };
      };

      "workbench.colorTheme" = "One Dark Pro";
      "workbench.iconTheme" = "material-icon-theme";

      "workbench.colorCustomizations" = {
        "[One Dark Pro]" = {
          "editorInlayHint.foreground" = "#868686f0";
          "editorInlayHint.background" = "#18181800";
        };
      };
    };

    # userTasks = {
    #   version = "2.0.0";
    #   tasks = [{
    #     type = "shell";
    #     label = "LazyGit";
    #     command = "lazygit";
    #     presentation = {
    #       "echo" = true;
    #       "reveal" = "always";
    #       "focus" = true;
    #       "panel" = "dedicated";
    #       "clear" = false;
    #       "close" = true;
    #     };
    #   }];
    # };

    # keybindings = [{
    #   key = "alt+g";
    #   command = "workbench.action.tasks.runTask";
    #   args = "lazygit";
    # }];
  };
}

