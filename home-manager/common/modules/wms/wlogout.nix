{ config, pkgs, vars, ... }: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "${vars.flakePath}/scripts/lockscreen.sh";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "niri msg action quit";
        text = "Logout";
        keybind = "o";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "${vars.flakePath}/scripts/suspend.sh";
        text = "Suspend";
        keybind = "p";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = let iconDir = "${pkgs.wlogout}/share/wlogout/icons";
    in ''
      * {
          background-image: none;
          box-shadow: none;
      }

      window {
          background: rgba(12, 12, 12, 0.9);
      }

      button {
          color: #${config.lib.stylix.colors.base01};
          font-family: "Maple Mono NF CN";
          font-size: 28px;
          background-color: #${config.lib.stylix.colors.base00};

          border-radius: 0px;
          border-style: none;
          border-width: 0px;
          
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
      }

      button:focus {
          background-color: #${config.lib.stylix.colors.base02};
          outline-style: solid;
      }

      #lock {
          background-image: image(url("${iconDir}/lock.png"), url("/usr/local/share/wlogout/icons/lock.png"));
      }

      #logout {
          background-image: image(url("${iconDir}/logout.png"), url("/usr/local/share/wlogout/icons/logout.png"));
      }

      #suspend {
          background-image: image(url("${iconDir}/suspend.png"), url("/usr/local/share/wlogout/icons/suspend.png"));
      }

      #hibernate {
          background-image: image(url("${iconDir}/hibernate.png"), url("/usr/local/share/wlogout/icons/hibernate.png"));
      }

      #shutdown {
          background-image: image(url("${iconDir}/shutdown.png"), url("/usr/local/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
          background-image: image(url("${iconDir}/reboot.png"), url("/usr/local/share/wlogout/icons/reboot.png"));
      }

      #lock #logout #suspend #hibernate #shutdown #reboot {
          background-color: #${config.lib.stylix.colors.base01};
      }

      label {
          color: #${config.lib.stylix.colors.base05};
      }
    '';
  };
}
