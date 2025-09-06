{config, lib, ...} : {

  xdg.configFile."waybar/config".source = ./waybar.conf;
  programs.waybar = {
    enable = true;
  
    style = 
      ''
* {
    border: none;
    font-family: "Maple Mono NF CN", "Noto Sans CJK SC";
    font-size: 17px;
    min-height: 0;
    border-radius: 1rem;
}

#waybar {
    background: transparent;
    color: #${config.lib.stylix.colors.base05};
    margin: 0;
    padding: 0;
}

#window {
    margin: 5px;
    padding-left: 1rem;
    padding-right: 1rem;
    transition: none;
    color: #${config.lib.stylix.colors.base0B};
    background: #${config.lib.stylix.colors.base02};
    font-family: "Maple Mono NF CN", "Noto Sans CJK SC";
}

#workspaces {
    background: #${config.lib.stylix.colors.base02};
    margin: 5px;
    font-family: "Maple Mono NF CN";
    font-size: 25px;
    border-radius: 1rem;
}
#workspaces button {
    margin: 5px;
    color: #${config.lib.stylix.colors.base0D};
    background: #${config.lib.stylix.colors.base03};
}

#workspaces button.active {
  color: #${config.lib.stylix.colors.base07};
  border-radius: 1rem;
  background: #${config.lib.stylix.colors.base04};
  font-weight: bold;
}

#workspaces button:hover {
    color: #${config.lib.stylix.colors.base01};
    background: #${config.lib.stylix.colors.base06};
}

#battery,
#backlight,
#pulseaudio,
#network {
    margin: 5px;
    padding: 0.5rem 1rem;
    transition: none;
    background: #${config.lib.stylix.colors.base02};
    color: #${config.lib.stylix.colors.base07};
}

#pulseaudio {
    margin-right: 0;
    border-radius: 1rem 0px 0px 1rem;
    padding-left: 1rem;
}

#network {
    border-radius: 0px 1rem 1rem 0px;
    margin-right: 1rem;
    margin-left: 0;
    padding-right: 1rem;
}

#network:hover,
#pulseaudio:hover,
#battery:hover,
#backlight:hover
{
    background: #${config.lib.stylix.colors.base03};
}

#battery.charging, #battery.plugged {
    color: white;
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
        background-color: #BF616A;
        color: #B5E8E0;
    }
}

#clock {
    margin: 6px;
    padding-left: 1.5rem;
    padding-right: 1.5rem;
    border-radius: 1rem;
    transition: none;
    color: #${config.lib.stylix.colors.base0C};
    font-size: 25px;
    font-weight: bold;
    font-family: "Maple Mono NF CN";
    background: #${config.lib.stylix.colors.base02};
}

#memory,
#cpu,
#tray {
    margin: 5px;
    padding-left: 1rem;
    padding-right: 1rem;
    transition: none;
    color: #${config.lib.stylix.colors.base08};
    background: #${config.lib.stylix.colors.base02};
}
#cpu {
    color: #${config.lib.stylix.colors.base0E};
}

#custom-launcher {
    font-size: 25px;
    margin: 5px;
    margin-left: 1rem;
    padding-left: 1rem;
    padding-right: 1rem;
    border-radius: 1rem;
    transition: none;
    color: rgb(126, 186, 228);
    background: #${config.lib.stylix.colors.base02};
}
      '';
  };
}
