{pkgs, ...} : {

  # ┳┓┏┓┳┓┏┓┏┓┳┓
  # ┣┫┣┫┃┃┃┓┣ ┣┫
  # ┛┗┛┗┛┗┗┛┗┛┛┗

  programs.ranger = {
    enable = true;
    extraConfig = ''
      export SHELL=${pkgs.nushell}/bin/nu
      set preview_images true
      set preview_images_method ueberzug
    '';
    extraPackages = [
      pkgs.ueberzugpp
    ];
  };

}
