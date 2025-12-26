{ lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "totorowldox";
      user.email = "totorowldox@gmail.com";

      gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";
      #gpg.format = "ssh";

      http.proxy = "http://127.0.0.1:7890";
      https.proxy = "http://127.0.0.1:7890";

      commit = { gpgsign = true; };

      user = { signingKey = "F8756BAC3A9C7CA9"; };
    };
  };
}
