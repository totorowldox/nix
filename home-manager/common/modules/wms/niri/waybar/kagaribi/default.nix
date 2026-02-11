{ config, lib, ... }:

{
  xdg.configFile."waybar/config".source = ./waybar.conf;
  # [TODO] Modify batter blink animation for stylix
  programs.waybar = {
    enable = true;

    style = ''
      * {
          border: none;
          font-family: "Maple Mono NF CN";
          font-size: 13px;
          min-height: 0;
          border-radius: 0.6rem;
      }

      #waybar {
          background: transparent;
          color: #${config.lib.stylix.colors.base05};
          margin: 0;
          padding: 0;
      }

      #window {
          margin: 4px;
          padding-left: 0.8rem;
          padding-right: 0.8rem;
          color: #${config.lib.stylix.colors.base05};
          background: #${config.lib.stylix.colors.base01};
      }

      window#waybar.empty #window {
          background-color: transparent;
      }

      #workspaces {
          background: #${config.lib.stylix.colors.base01};
          margin: 4px;
          font-size: 15px;
          border-radius: 0.6rem;
      }

      #workspaces button {
          margin: 3px;
          padding: 0 6px;
          color: #${config.lib.stylix.colors.base04};
          background: #${config.lib.stylix.colors.base00};
      }

      #workspaces button.active {
          color: #${config.lib.stylix.colors.base05};
          background: #${config.lib.stylix.colors.base02};
          font-weight: bold;
      }

      #workspaces button:hover {
          color: #${config.lib.stylix.colors.base01};
          background: #${config.lib.stylix.colors.base04};
      }

      #battery,
      #backlight,
      #pulseaudio,
      #network,
      #custom-notification {
          margin: 4px;
          padding: 0.3rem 0.8rem;
          background: #${config.lib.stylix.colors.base01};
          color: #${config.lib.stylix.colors.base05};
      }

      #pulseaudio {
          margin-right: 0;
          border-radius: 0.6rem 0 0 0.6rem;
      }

      #network {
          margin-left: 0;
          margin-right: 4px;
          border-radius: 0 0.6rem 0.6rem 0;
      }

      #backlight {
          margin-right: 0;
          border-radius: 0.6rem 0 0 0.6rem;
      }

      #battery {
          margin-left: 0;
          border-radius: 0 0.6rem 0.6rem 0;
      }

      #network:hover,
      #pulseaudio:hover,
      #battery:hover,
      #backlight:hover,
      #custom-notification:hover {
          background: #${config.lib.stylix.colors.base02};
      }

      #battery.charging,
      #battery.plugged {
          color: #${config.lib.stylix.colors.base05};
      }

      #battery.critical:not(.charging) {
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      @keyframes blink {
          to {
              background-color: #${config.lib.stylix.colors.base08};
              color: #${config.lib.stylix.colors.base0C};
          }
      }

      #clock {
          margin: 4px;
          padding-left: 1rem;
          padding-right: 1rem;
          border-radius: 0.6rem;
          font-size: 15px;
          font-weight: bold;
          color: #${config.lib.stylix.colors.base05};
          background: #${config.lib.stylix.colors.base01};
      }

      #memory,
      #cpu,
      #tray {
          margin: 4px;
          padding-left: 0.8rem;
          padding-right: 0.8rem;
          color: #${config.lib.stylix.colors.base05};
          background: #${config.lib.stylix.colors.base01};
      }

      #custom-launcher {
          font-size: 20px;
          margin: 4px;
          margin-left: 0.6rem;
          padding-left: 0.8rem;
          padding-right: 0.8rem;
          border-radius: 0.6rem;
          color: rgb(126, 186, 228);
          background: #${config.lib.stylix.colors.base01};
      }

      #custom-notification {
          margin: 4px;
          margin-right: 0.6rem;
          padding-left: 0.8rem;
          padding-right: 0.8rem;
          border-radius: 0.6rem;
          background: #${config.lib.stylix.colors.base01};
      }
    '';
  };
}
