{...}: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "catppuccin-mocha";
    };
  };

  xdg.configFile."bat/themes/catppuccin-mocha.tmTheme".force = true;
  xdg.configFile."bat/themes/catppuccin-mocha.tmTheme".source = ./catppuccin-mocha.tmTheme;
}
