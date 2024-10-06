{ config, ... }: {

  # ┳┳┓┏┓┓┏┓┏┓
  # ┃┃┃┣┫┃┫ ┃┃
  # ┛ ┗┛┗┛┗┛┗┛      

  # Notifications for wayland

  services.mako = with config.colorScheme.palette; {
    enable = true;
    backgroundColor = "#${base01}";
    borderColor     = "#${base08}";
    borderRadius    = 0;
    borderSize      = 2;
    textColor       = "#${base06}";
    layer           = "overlay";
  };
}
