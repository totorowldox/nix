{lib, pkgs, ...} : {
  programs.git = {
    enable = true;
    userName  = "totorowldox";
    userEmail = "2553658033@qq.com";
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
