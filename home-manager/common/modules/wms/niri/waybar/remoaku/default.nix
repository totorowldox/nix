{ config, lib, ... }: {

  xdg.configFile."waybar/config".source = ./waybar.conf;

  programs.waybar = {
    enable = true;

    style = ''
      * {
          border: none;
          font-family: "Maple Mono NF CN";
          font-size: 13px; /* 参照笔记本配置调小字号 */
          min-height: 0;
          border-radius: 0.6rem;
      }

      #waybar {
          background: transparent;
          color: #${config.lib.stylix.colors.base05};
      }

      /* 统一通用模块样式，减少 margin 解决高度过高问题 */
      #window,
      #battery,
      #backlight,
      #pulseaudio,
      #network,
      #custom-notification,
      #memory,
      #cpu,
      #tray,
      #clock,
      #custom-launcher {
          margin: 3px 4px; /* 上下 3px 比原来的 4px 更紧凑 */
          padding: 0.2rem 0.8rem;
          background: #${config.lib.stylix.colors.base01};
          color: #${config.lib.stylix.colors.base05};
      }

      /* --- 左右边距修正，解决不对称 --- */
      #custom-launcher {
          margin-left: 0.6rem; /* 保持笔记本配置的呼吸感 */
          font-size: 18px;     /* 略微调小，防止撑开高度 */
          color: rgb(126, 186, 228);
      }

      #custom-notification {
          margin-right: 0.6rem;
      }

      /* --- Workspaces --- */
      #workspaces {
          background: #${config.lib.stylix.colors.base01};
          margin: 3px 4px;
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

      /* --- 组合模块逻辑 (音量/网络 & 亮度/电池) --- */
      #pulseaudio { margin-right: 0; border-radius: 0.6rem 0 0 0.6rem; }
      #network    { margin-left: 0;  border-radius: 0 0.6rem 0.6rem 0; }

      #backlight  { margin-right: 0; border-radius: 0.6rem 0 0 0.6rem; }
      #battery    { margin-left: 0;  border-radius: 0 0.6rem 0.6rem 0; }

      /* --- 悬浮效果 (Hover) --- */
      #network:hover,
      #pulseaudio:hover,
      #battery:hover,
      #backlight:hover,
      #custom-notification:hover {
          background: #${config.lib.stylix.colors.base02};
      }

      /* --- 特殊状态 --- */
      #clock {
          font-size: 15px;
          font-weight: bold;
      }

      window#waybar.empty #window {
          background-color: transparent;
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
    '';
  };
}
