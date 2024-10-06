{
  pkgs,
  lib,
  ...
}: {
  # ┳┓┏┓┏┓┓┏
  # ┣┫┣┫┗┓┣┫
  # ┻┛┛┗┗┛┛┗

  # TERMINAL UTILITIES

  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      vimdiff = "nvim";
      vh = "nvim /home/souza/.config/home-manager/home.nix";
      rh = "ranger /home/souza/.config/home-manager/";
      vc = "sudo nvim /etc/nixos/configuration.nix";
q      hms = "home-manager switch";
    };
    bashrcExtra = let
      bhist = pkgs.writeShellScriptBin "bhist" ''
        eval $(cat /home/souza/.bash_history | sort -r | ${pkgs.fzf}/bin/fzf)
      '';
    in ''
      bind -x '"\e[B": ${lib.getExe bhist}'
      eval "$(starship init bash)"
    '';
  };
}
