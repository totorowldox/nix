{lib, pkgs, ...} : {
  programs.git = {
    enable = true;
    userName  = "totorowldox";
    userEmail = "2553658033@qq.com";
    extraConfig = {
      
      gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";

      http.proxy = "127.0.0.1:7890";
      https.proxy = "127.0.0.1:7890";
      

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
