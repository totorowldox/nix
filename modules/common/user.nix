{ pkgs, ... }: {

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # This is me !!!
  users.users.remo = {
    isNormalUser = true;
    description = "Remo";
    extraGroups = [ "networkmanager" "wheel" "input" "uinput" ];
    packages = with pkgs;
      [
        # user packages
      ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN6mBjCZKta7fjJ1AEzVvwOxJymlaRVnbsXomjllAkko"
    ];
  };

}
