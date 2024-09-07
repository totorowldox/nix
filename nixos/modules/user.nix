{pkgs, ...} : {

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # This is me !!!
  users.users.remo = {
    isNormalUser = true;
    description = "Remo";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [
    	# user packages
    ];
  };
  
}
