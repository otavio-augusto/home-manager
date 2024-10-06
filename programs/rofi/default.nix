{pkgs, ...} : {

  # ┳┓┏┓┏┓┳
  # ┣┫┃┃┣ ┃
  # ┛┗┗┛┻ ┻   

  # A scriptable menu

  home.packages = [
    pkgs.rofi-wayland
  ];

  xdg.configFile."rofi/config.rasi".force = true;
  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
}
