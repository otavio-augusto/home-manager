{pkgs, ...}: {
  home.packages = [
    pkgs.eza
    pkgs.broot
    pkgs.ripgrep
    pkgs.libqalculate
    pkgs.htop
    pkgs.fzf
    pkgs.jq
    pkgs.tlrc
    pkgs.gawk
    pkgs.socat
    pkgs.lshw
    pkgs.unar
    pkgs.p7zip
    pkgs.slides
    pkgs.glow
  ];

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs = {
    nushell = {
      enable = true;
      # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
      configFile.source = ./config.nu;
      # for editing directly to config.nu
      extraConfig = ''
        $env.EDITOR = 'nvim'
        $env.PAGER  = 'less -R'
      '';
      shellAliases = {
        vim = "nvim";
        vi = "nvim";
        v = "nvim";
        vimdiff = "nvim";
        vh = "nvim /home/souza/.config/home-manager/home.nix";
        rh = "ranger /home/souza/.config/home-manager/";
        vc = "sudo nvim /etc/nixos/configuration.nix";
        hms = "home-manager switch";
        r = "ranger";
      };
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
  };
}
