{...}: {
  programs.yazi = {
    enable = true;
    settings = {
    };
  };

  xdg.configFile."yazi/theme.toml".force = true;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
}
