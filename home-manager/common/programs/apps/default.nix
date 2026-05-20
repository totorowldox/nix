{ pkgs, ... }: {
  imports = [ ./vscode.nix ./mpv.nix ./obs.nix ];
  home.packages = with pkgs; [ splayer ];
}
