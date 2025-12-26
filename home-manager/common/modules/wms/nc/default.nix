{ config, ... }: {
  # [TODO] Adapt css to stylix
  home.file.".config/swaync/style.css".text = ''
    * {
      all: unset;
      font-size: 18px;
      font-family: "Maple Mono NF CN","Noto Sans Mono CJK SC","Noto Sans Mono CJK JP";
      transition: 200ms;
    }

    trough highlight {
      background: ${config.lib.stylix.colors.withHashtag.base05};
    }

    scale trough {
      margin: 0rem 1rem;
      background-color: ${config.lib.stylix.colors.withHashtag.base02};
      min-height: 8px;
      min-width: 70px;
    }

    slider {
      background-color: ${config.lib.stylix.colors.withHashtag.base0D};
    }

    .floating-notifications.background .notification-row .notification-background {
      box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base02};
      border-radius: 12.6px;
      margin: 18px;
      background-color: ${config.lib.stylix.colors.withHashtag.base00};
      color: ${config.lib.stylix.colors.withHashtag.base05};
      padding: 0;
    }

    .floating-notifications.background .notification-row .notification-background .notification {
      padding: 7px;
      border-radius: 12.6px;
    }

    .floating-notifications.background .notification-row .notification-background .notification.critical {
      box-shadow: inset 0 0 7px 0 ${config.lib.stylix.colors.withHashtag.base08};
    }

    .floating-notifications.background .notification-row .notification-background .notification .notification-content {
      margin: 7px;
    }

    .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
      color: ${config.lib.stylix.colors.withHashtag.base04};
    }

    .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
      min-height: 3.4em;
    }

    .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action {
      border-radius: 7px;
      color: ${config.lib.stylix.colors.withHashtag.base05};
      background-color: ${config.lib.stylix.colors.withHashtag.base02};
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      margin: 7px;
    }

    .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      background-color: ${config.lib.stylix.colors.withHashtag.base02};
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      background-color: ${config.lib.stylix.colors.withHashtag.base05};
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .floating-notifications.background .notification-row .notification-background .close-button {
      margin: 7px;
      padding: 2px;
      border-radius: 6.3px;
      color: ${config.lib.stylix.colors.withHashtag.base00};
      background-color: ${config.lib.stylix.colors.withHashtag.base08};
    }

    .floating-notifications.background .notification-row .notification-background .close-button:hover {
      background-color: ${config.lib.stylix.colors.withHashtag.base09};
      color: ${config.lib.stylix.colors.withHashtag.base00};
    }

    .floating-notifications.background .notification-row .notification-background .close-button:active {
      background-color: ${config.lib.stylix.colors.withHashtag.base08};
      color: ${config.lib.stylix.colors.withHashtag.base00};
    }

    .control-center {
      box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base02};
      border-radius: 12.6px;
      margin: 18px;
      background-color: ${config.lib.stylix.colors.withHashtag.base00};
      color: ${config.lib.stylix.colors.withHashtag.base05};
      padding: 14px;
    }

    .control-center .widget-title > label {
      color: ${config.lib.stylix.colors.withHashtag.base05};
      font-size: 1.3em;
    }

    .control-center .widget-title button {
      border-radius: 7px;
      color: ${config.lib.stylix.colors.withHashtag.base05};
      background-color: ${config.lib.stylix.colors.withHashtag.base02};
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      padding: 8px;
    }

    .control-center .widget-title button:hover {
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      background-color: ${config.lib.stylix.colors.withHashtag.base04};
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .control-center .widget-title button:active {
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      background-color: ${config.lib.stylix.colors.withHashtag.base05};
      color: ${config.lib.stylix.colors.withHashtag.base00};
    }

    .control-center .notification-row .notification-background {
      border-radius: 7px;
      color: ${config.lib.stylix.colors.withHashtag.base05};
      background-color: ${config.lib.stylix.colors.withHashtag.base01};
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      margin-top: 14px;
    }

    .control-center .notification-row .notification-background .notification {
      padding: 7px;
      border-radius: 7px;
    }

    .control-center .notification-row .notification-background .notification.critical {
      box-shadow: inset 0 0 7px 0 ${config.lib.stylix.colors.withHashtag.base08};
    }

    .control-center .notification-row .notification-background .notification .notification-content {
      margin: 7px;
    }

    .control-center .notification-row .notification-background .notification .notification-content .summary {
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .control-center .notification-row .notification-background .notification .notification-content .time {
      color: ${config.lib.stylix.colors.withHashtag.base04};
    }

    .control-center .notification-row .notification-background .notification .notification-content .body {
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .control-center .notification-row .notification-background .notification > *:last-child > * {
      min-height: 3.4em;
    }

    .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action {
      border-radius: 7px;
      color: ${config.lib.stylix.colors.withHashtag.base05};
      background-color: ${config.lib.stylix.colors.withHashtag.base00};
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      margin: 7px;
    }

    .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      background-color: ${config.lib.stylix.colors.withHashtag.base02};
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      background-color: ${config.lib.stylix.colors.withHashtag.base05};
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .control-center .notification-row .notification-background .close-button {
      margin: 7px;
      padding: 2px;
      border-radius: 6.3px;
      color: ${config.lib.stylix.colors.withHashtag.base00};
      background-color: ${config.lib.stylix.colors.withHashtag.base08};
    }

    .close-button {
      border-radius: 6.3px;
    }

    .control-center .notification-row .notification-background .close-button:hover {
      background-color: ${config.lib.stylix.colors.withHashtag.base08};
      color: ${config.lib.stylix.colors.withHashtag.base00};
    }

    .control-center .notification-row .notification-background .close-button:active {
      background-color: ${config.lib.stylix.colors.withHashtag.base08};
      color: ${config.lib.stylix.colors.withHashtag.base00};
    }

    .control-center .notification-row .notification-background:hover {
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      background-color: ${config.lib.stylix.colors.withHashtag.base02};
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .control-center .notification-row .notification-background:active {
      box-shadow: inset 0 0 0 1px ${config.lib.stylix.colors.withHashtag.base03};
      background-color: ${config.lib.stylix.colors.withHashtag.base05};
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .notification.critical progress {
      background-color: ${config.lib.stylix.colors.withHashtag.base08};
    }

    .notification.low progress,
    .notification.normal progress {
      background-color: ${config.lib.stylix.colors.withHashtag.base0D};
    }

    .control-center-dnd {
      margin-top: 5px;
      border-radius: 8px;
      background: ${config.lib.stylix.colors.withHashtag.base02};
      border: 1px solid ${config.lib.stylix.colors.withHashtag.base03};
      box-shadow: none;
    }

    .control-center-dnd:checked {
      background: ${config.lib.stylix.colors.withHashtag.base02};
    }

    .control-center-dnd slider {
      background: ${config.lib.stylix.colors.withHashtag.base03};
      border-radius: 8px;
    }

    .widget-dnd {
      margin: 0px;
      font-size: 1.1rem;
    }

    .widget-dnd > switch {
      font-size: initial;
      border-radius: 8px;
      background: ${config.lib.stylix.colors.withHashtag.base02};
      border: 1px solid ${config.lib.stylix.colors.withHashtag.base03};
      box-shadow: none;
    }

    .widget-dnd > switch:checked {
      background: ${config.lib.stylix.colors.withHashtag.base02};
    }

    .widget-dnd > switch slider {
      background: ${config.lib.stylix.colors.withHashtag.base03};
      border-radius: 8px;
      border: 1px solid ${config.lib.stylix.colors.withHashtag.base04};
    }

    /* Mpris widget */
    .widget-mpris {
      padding: 10px;
      padding-bottom: 15px;
      margin-bottom: -20px;
    }
    .widget-mpris > box {
      padding: 0px;
      margin: -5px 0px -10px 0px;
      padding: 0px;
      border-radius: 12px;
      background: alpha(${config.lib.stylix.colors.withHashtag.base02}, 0.05);
    }
    .widget-mpris > box > button:nth-child(1),
    .widget-mpris > box > button:nth-child(3) {
      margin-bottom: 0px;
    }
    .widget-mpris > box > button:nth-child(1) {
      margin-left: 0px;
      margin-right: -25px;
      opacity: 0;
    }
    .widget-mpris > box > button:nth-child(3) {
      margin-left: 0px;
      margin-right: -25px;
      opacity: 0;
    }

    .widget-mpris-album-art {
      border-radius: 12px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);
    /*all: unset;*/
    }

    /* Player button box */
    .widget-mpris > box > carousel > widget > box > box:nth-child(2) {
      margin: 5px 0px -5px 90px;
    }

    /* Player buttons */
    .widget-mpris > box > carousel > widget > box > box:nth-child(2) > button {
      border-radius: 4px;
    }
    .widget-mpris > box > carousel > widget > box > box:nth-child(2) > button:hover {
      background: alpha(currentColor, 0.1);
    }

    .widget-mpris-title {
      color: ${config.lib.stylix.colors.withHashtag.base05};
      font-weight: bold;
      font-size: 1.25rem;
      text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
    }
    .widget-mpris-subtitle {
      color: ${config.lib.stylix.colors.withHashtag.base05};
      font-size: 1rem;
      text-shadow: 0px 0px 3px rgba(0, 0, 0, 1);
    }

    .widget-mpris-player {
    margin: 0px;
    padding: 15px;
    background-color: alpha(${config.lib.stylix.colors.withHashtag.base02}, 0.5);
    border-radius: 12px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);
    }
    .widget-mpris-player > box > image {
      margin: 0px 0px -20px 0px;
    }

    /*.widget-mpris .widget-mpris-player {
      background: ${config.lib.stylix.colors.withHashtag.base02};
      padding: 7px;
    }

    .widget-mpris .widget-mpris-title {
      font-size: 1.2rem;
    }

    .widget-mpris .widget-mpris-subtitle {
      font-size: 0.8rem;
    }

    .widget-menubar > box > .menu-button-bar > button > label {
      font-size: 3rem;
      padding: 0.5rem 2rem;
    }

    .widget-menubar > box > .menu-button-bar > :last-child {
      color: ${config.lib.stylix.colors.withHashtag.base08};
    }*/

    .power-buttons button:hover,
    .powermode-buttons button:hover,
    .screenshot-buttons button:hover {
      background: ${config.lib.stylix.colors.withHashtag.base02};
    }

    .control-center .widget-label > label {
      color: ${config.lib.stylix.colors.withHashtag.base05};
      font-size: 2rem;
    }

    .widget-buttons-grid {
      padding-top: 1rem;
    }

    .widget-buttons-grid > flowbox > flowboxchild > button label {
      font-size: 2.5rem;
    }

    .widget-volume {
      padding-top: 1rem;
    }

    .widget-volume label {
      font-size: 1.5rem;
      color: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .widget-volume trough highlight {
      background: ${config.lib.stylix.colors.withHashtag.base05};
    }

    .widget-backlight trough highlight {
      background: ${config.lib.stylix.colors.withHashtag.base0A};
    }

    .widget-backlight label {
      font-size: 1.5rem;
      color: ${config.lib.stylix.colors.withHashtag.base0A};
    }

    .widget-backlight .KB {
      padding-bottom: 1rem;
    }

    .image {
      padding-right: 0.5rem;
    }

  '';
  home.file.".config/swaync/config.json".source = ./config.json;
}
