{lib, pkgs, ...} : {
  programs.git = {
    enable = true;
    userName  = "totorowldox";
    userEmail = "totorowldox@gmail.com";
    extraConfig = {
      
      gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";

      #gpg = {
      #  format = "ssh";
      #};
      #"gpg \"ssh\"" = {
      #  program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      #};
      
      #commit = {
      #  gpgsign = true;
      #};

      #user = {
      #  signingKey = "<your key>";
      #};
    };
  };
}
