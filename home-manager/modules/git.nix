{lib, pkgs, ...} : {
  programs.git = {
    enable = true;
    userName  = "totorowldox";
    userEmail = "totorowldox@gmail.com";
    extraConfig = {
      
      gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";

      http.proxy = "127.0.0.1:7890";
      https.proxy = "127.0.0.1:7890";
      
      commit = {
        gpgsign = true;
      };

      user = {
        signingKey = "F8756BAC3A9C7CA9";
      };
    };
  };
}
