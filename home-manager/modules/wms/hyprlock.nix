{
    programs.hyprlock = {
        enable = true;
        
        settings = {
            general = {
                #disable_loading_bar = true;
                #grace = 300;
                hide_cursor = true;
                #no_fade_in = false;
            };

            background = [
                {
                    path = "screenshot";
                    blur_passes = 3;
                    blur_size = 4;
                    noise = 0.0117;
                    contrast = 1.3;
                    brightness = 0.8;
                    vibrancy = 0.21;
                    vibrancy_darkness = 0.0;
                }
            ];

            input-field = [
                {
                    size = "250, 50";
                    position = "0, -70";
                    dots_center = true;
                    dots_size = 0.26;
                    dots_spacing = 0.64;
                    fade_on_empty = false;
                    font_color = "rgb(202, 211, 245)";
                    inner_color = "rgb(54, 58, 79)";
                    outer_color = "rgb(245, 189, 230)";
                    outline_thickness = 3;
                    rounding = 22;
                    placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
                    shadow_passes = 2;
                }
            ];

            label = [
                # Hours
                {
                    text = ''cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"'';
                    #color = $color6;
                    font_size = 112;
                    font_family = "Maple Mono NF CN 10";
                    shadow_passes = 3;
                    shadow_size = 4;

                    position = "0, 320";
                    halign = "center";
                    valign = "center";
                }

                # Minutes
                {
                    text = ''cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"'';
                    #color = $color6;
                    font_size = 112;
                    font_family = "Maple Mono NF CN 10";
                    shadow_passes = 3;
                    shadow_size = 4;

                    position = "0, 180";
                    halign = "center";
                    valign = "center";
                }

                # Today
                {
                    text = ''cmd[update:18000000] echo "<b><big> "$(LC_ALL=ja_JP.UTF8 date +'%A')" </big></b>"'';
                    #color = $color7;
                    font_size = 22;
                    font_family = "Maple Mono NF CN 10";

                    position = "0, 70";
                    halign = "center";
                    valign = "center";
                }

                # Week
                {
                    text = ''cmd[update:18000000] echo "<b> "$(LC_ALL=ja_JP.UTF8 date +'%x')" </b>"'';
                    #color = $color7;
                    font_size = 18;
                    font_family = "Maple Mono NF CN 10";

                    position = "0, 30";
                    halign = "center";
                    valign = "center";
                }
            ];
        };
    };
}