{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # 整体布局保持：用户名/主机 → 路径 → nix_shell → git → 语言/包 → 字符
      format = ''
        [╭](bold white) $username$hostname$directory$nix_shell$git_branch$git_status$package$python$rust$golang$nodejs
        [╰](bold white) $character'';
      add_newline = true;
      continuation_prompt = " [⋯](bold purple) ";

      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
        style = "bold cyan";
        format = "[$path]($style)[$read_only]($read_only_style) ";
        home_symbol = " ";
      };

      character = {
        success_symbol = "[λ](bold purple)";
        error_symbol = "[λ](bold red)";
        format = "$symbol ";
      };

      nix_shell = {
        symbol = " ";
        style = "bold blue";
        impure_msg = "[impure](bold red)";
        format = "[$symbol$state]($style) ";
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        style = "bold red";
        format = "$all_status$ahead_behind ";
        conflicted = "󰀦 ";
        ahead = "󰈙 $count ";
        behind = "󰮉 $count ";
        diverged = "󰃻 ";
        untracked = " $count ";
        modified = "󰷥 $count ";
        staged = "󰱒 $count ";
        renamed = "󰑕 $count ";
        deleted = "󰧧 $count ";
        typechanged = " ";
      };

      python = { format = "via [$symbol$version]($style) "; };
      rust = { format = "[$symbol$version]($style) "; };
      golang = { format = "[$symbol$version]($style) "; };
      nodejs = { format = "[$symbol$version]($style) "; };
      package = { format = "[$symbol$version]($style) "; };

      username = {
        show_always = false;
        format = "[$user]($style)@";
        style_user = "bold white";
        style_root = "bold red";
      };

      hostname = {
        ssh_only = true;
        format = "[$hostname]($style) ";
        style = "bold white";
      };
    };
  };
}
