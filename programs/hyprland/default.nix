{
  pkgs,
  config,
  ...
}: {
  # ┓┏┓┏┏┓┳┓┓ ┏┓┳┓┳┓
  # ┣┫┗┫┃┃┣┫┃ ┣┫┃┃┃┃
  # ┛┗┗┛┣┛┛┗┗┛┛┗┛┗┻┛

  # Hyprland is a modern Wayland compositor
  # https://github.com/hyprwm/Hyprland

  home.packages = [
    pkgs.grim
    pkgs.slurp
    pkgs.swappy
    pkgs.wlroots
    pkgs.wl-clipboard
    pkgs.wlsunset
    pkgs.wev
  ];

  wayland.windowManager.hyprland = let
    mod = "SUPER";
  in {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      animations = {
        enabled = false;
      };

      bind = [
        "${mod}, RETURN, exec, ${pkgs.alacritty}/bin/alacritty"
        "${mod}, b, exec, ${pkgs.alacritty}/bin/alacritty"
        "${mod}, c, killactive"
        "${mod}, p, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun"
        "      , Print, exec, ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - - | ${pkgs.wl-clipboard}/bin/wl-copy"
        "${mod}, m, exec, [floating] alacritty -e qalc"

        "${mod}, left, movefocus, l"
        "${mod}, right, movefocus, r"
        "${mod}, up, movefocus, u"
        "${mod}, down, movefocus, d"

        "${mod}+SHIFT, left, movewindow, l"
        "${mod}+SHIFT, right, movewindow, r"
        "${mod}+SHIFT, up, movewindow, u"
        "${mod}+SHIFT, down, movewindow, d"

        "${mod}, h, resizeactive, -10, 0"
        "${mod}, l, resizeactive, 10, 0"
        "${mod}, j, resizeactive, 0, -10"
        "${mod}, k, resizeactive, 0, 10"

        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod}, 8, workspace, 8"
        "${mod}, 9, workspace, 9"
        "${mod}, 0, workspace, 10"

        "${mod}+SHIFT, 1, movetoworkspace, 1"
        "${mod}+SHIFT, 2, movetoworkspace, 2"
        "${mod}+SHIFT, 3, movetoworkspace, 3"
        "${mod}+SHIFT, 4, movetoworkspace, 4"
        "${mod}+SHIFT, 5, movetoworkspace, 5"
        "${mod}+SHIFT, 6, movetoworkspace, 6"
        "${mod}+SHIFT, 7, movetoworkspace, 7"
        "${mod}+SHIFT, 8, movetoworkspace, 8"
        "${mod}+SHIFT, 9, movetoworkspace, 9"
        "${mod}+SHIFT, 0, movetoworkspace, 10"

        "${mod}, f, fullscreen"
      ];

      # REPEATABLE
      binde = [
        # RESIZE WINDOW
        "${mod} ,l, resizeactive,  10  0"
        "${mod} ,h,  resizeactive, -10  0"
        "${mod} ,j,    resizeactive,  0 -10"
        "${mod} ,k,  resizeactive,  0  10"
      ];

      exec-once = [
        "${pkgs.eww}/bin/eww d"
        "${pkgs.eww}/bin/eww open bar_1"
        "${pkgs.wlsunset}/bin/wlsunset"
      ];
    };
    extraConfig = with config.colorScheme.palette; ''
      general {
        gaps_in = 2
        gaps_out = 4
        border_size = 2
        col.active_border = rgb(${base08})
        col.inactive_border = rgb(${base01})
      }
    '';
  };
}
