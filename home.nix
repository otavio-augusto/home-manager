{ pkgs, inputs, ... }:

{
  home.username = "souza";
  home.homeDirectory = "/home/souza";
  home.stateVersion = "23.11";

  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nvchad4nix.homeManagerModule
    ./scripts
    ./shells
    ./programs/git
    ./programs/alacritty
    ./programs/ranger
    ./programs/zathura
    ./programs/yazi
    ./programs/bat
    ./programs/eww
    ./programs/firefox
    ./programs/hyprland
    ./programs/mako
    ./programs/nvchad
    ./programs/rofi
    #./programs/bash
    #./programs/zsh
    ./programs/nushell
    ./programs/starship
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  home.packages = [
    pkgs.cached-nix-shell
    pkgs.dolphin
    pkgs.tor-browser
    pkgs.ncdu
    pkgs.pavucontrol
    pkgs.discord
    pkgs.vesktop
    pkgs.keepassxc
    pkgs.font-awesome
    pkgs.heroic
    (pkgs.lutris.override {
       extraPkgs = pkgs: [
        pkgs.protontricks
        pkgs.protonup
        pkgs.winetricks
        pkgs.wineWowPackages.stable
       ];
    })
    pkgs.qbittorrent
    pkgs.speedread
    pkgs.feh
    pkgs.zathura
    pkgs.psmisc
    pkgs.atlauncher
    pkgs.jdk21
    pkgs.castero
    pkgs.easyeffects
  ];
  nixpkgs.config.allowUnfree = true;

  home.file = { };

  home.sessionVariables = {
    EDITOR    = "nvim";
    BROWSER   = "firefox";
    TERMINAL  = "alacritty";
  };

  programs.home-manager.enable = true;
}
