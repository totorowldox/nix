{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        arrterian.nix-env-selector
        brettm12345.nixfmt-vscode
        mkhl.direnv
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.remote-explorer

        vscodevim.vim
        yzhang.markdown-all-in-one
      ];
      userSettings = {
        "[nix]" = { "editor.defaultFormatter" = "brettm12345.nixfmt-vscode"; };
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "remote.SSH.configFile" = "~/.ssh/config_local";
      };
    };
  };
}
