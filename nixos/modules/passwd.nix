{

programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "remo" ];
  };
environment.etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          vivaldi-bin
          wavebox
        '';
        mode = "0755";
      };
    };
}
