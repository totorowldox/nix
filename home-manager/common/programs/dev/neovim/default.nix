{ pkgs, config, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      codespell
      gcc
      gnumake
      unzip
      wget
      # 搜寻工具
      ripgrep
      fd

      # LSP
      nil
      lua-language-server

      # Formatter
      stylua

      vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };

  # [TODO] change it later
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink /home/remo/Documents/nvim-config;
}
